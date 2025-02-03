package com.zhourx.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author zhourx
 */
public interface FileService {
    /**
     * 上传头像到OSS
     *
     * @param file
     * @return
     */
    String uploadFileAvatar(MultipartFile file);
    String uploadFileAvatarToMinio(MultipartFile file);
}
