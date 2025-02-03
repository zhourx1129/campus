package com.zhourx.utils;

import com.zhourx.config.MinioConfig;
import io.minio.*;
import io.minio.errors.ErrorResponseException;
import io.minio.http.Method;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.concurrent.TimeUnit;

/**
 * minio实现工具类
 */
@Component
public class FileMinioUtils {


    @Value("${minio.endpoint}")
    private String endpoint;
    @Value("${minio.accessKey}")
    private String keyid;
    @Value("${minio.secretKey}")
    private String keysecret;
    @Value("${minio.bucketName}")
    private String bucketname;

    public String getEndpoint() {
        return endpoint;
    }

    public String getKeyid() {
        return keyid;
    }

    public String getKeysecret() {
        return keysecret;
    }

    public String getBucketname() {
        return bucketname;
    }

    @Autowired
    private MinioClient minioClient;

    @Autowired
    private MinioConfig configuration;

    /**
     * 判断bucket是否存在，不存在则创建
     */
    public boolean existBucket(String bucketName) {
        boolean exists;
        try {
            exists = minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build());
            if (!exists) {
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
                exists = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            exists = false;
        }
        return exists;
    }

    /**
     * 删除bucket
     */
    public Boolean removeBucket(String bucketName) {
        try {
            minioClient.removeBucket(RemoveBucketArgs.builder().bucket(bucketName).build());
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 判断文件是否存在
     *
     * @param objectName 文件名称, 如果要带文件夹请用 / 分割, 例如 /help/index.html
     * @return true存在, 反之
     */
    public Boolean checkFileIsExist(String objectName) {
        try {
            minioClient.statObject(StatObjectArgs.builder()
                    .bucket(bucketname)
                    .object(objectName).build());
            return true;
        } catch (ErrorResponseException e) {
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }

    /**
     * 上传文件
     *
     * @param file     文件
     * @param fileName 文件名称
     */
    public String upload(MultipartFile file, String fileName) {
        // 使用putObject上传一个文件到存储桶中。
        try {
            InputStream inputStream = file.getInputStream();
            minioClient.putObject(PutObjectArgs.builder()
                    .bucket(configuration.getBucketName())
                    .object(fileName)
                    .stream(inputStream, file.getSize(), -1)
                    .contentType(file.getContentType())
                    .build());
            return getFileUrl(fileName);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 获取文件访问地址（有过期时间）
     *
     * @param fileName 文件名称
     * @param time     时间
     * @param timeUnit 时间单位
     */
    public String getExpireFileUrl(String fileName, int time, TimeUnit timeUnit) {
        try {
            return minioClient.getPresignedObjectUrl(GetPresignedObjectUrlArgs.builder()
                    .method(Method.GET)
                    .bucket(configuration.getBucketName())
                    .object(fileName)
                    .expiry(time, timeUnit).build());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取文件访问地址
     *
     * @param fileName 文件名称
     */
    public String getFileUrl(String fileName) {
        String fileUrl = null;
        try {
             fileUrl = minioClient.getPresignedObjectUrl(GetPresignedObjectUrlArgs.builder()
                    .method(Method.GET)
                    .bucket(configuration.getBucketName())
                    .object(fileName)
                    .build()
            );
            int splitIndex = fileUrl.indexOf('?');
            fileUrl = splitIndex!=-1 ? fileUrl.substring(0, splitIndex):fileUrl;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileUrl;
    }

    /**
     * 下载文件
     *
     * @param fileName 文件名称
     */
    public void download(HttpServletResponse response, String fileName) {
        InputStream in = null;
        try {
            // 获取对象信息
            StatObjectResponse stat = minioClient.statObject(StatObjectArgs.builder().bucket(configuration.getBucketName()).object(fileName).build());
            response.setContentType(stat.contentType());
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
            // 文件下载
            in = minioClient.getObject(
                    GetObjectArgs.builder()
                            .bucket(configuration.getBucketName())
                            .object(fileName).build());
            IOUtils.copy(in, response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 删除文件
     *
     * @param fileName 文件名称
     */
    public void delete(String fileName) {
        try {
            minioClient.removeObject(RemoveObjectArgs.builder().bucket(configuration.getBucketName()).object(fileName).build());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}