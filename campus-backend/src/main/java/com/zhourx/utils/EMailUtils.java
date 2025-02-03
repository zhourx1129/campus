package com.zhourx.utils;


import cn.hutool.Hutool;
import cn.hutool.extra.template.TemplateException;
import com.zhourx.config.EMailConfig;
import jodd.util.StringUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Map;

import static com.zhourx.constants.SystemConstants.EMAIL_FROM;

/**
 * 邮件信息发送工具类
 */
@Component
@RequiredArgsConstructor
public class EMailUtils {
    // 邮箱配置类
    private final EMailConfig emailConfig;
    // 邮箱发送类
    @Resource
    private JavaMailSender javaMailSender;


    /**
     * 发送文本邮件
     *
     * @param title       标题
     * @param text        文本
     * @param targetMails 目标邮箱
     */
    @SneakyThrows(Exception.class)
    public void sendText(String title, String text, String... targetMails) {
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        // 发件人
        simpleMailMessage.setFrom(EMAIL_FROM);
        // 收件人
        simpleMailMessage.setTo(targetMails);
        // 邮件主题
        simpleMailMessage.setSubject(title);
        // 邮件内容
        simpleMailMessage.setText(text);
        javaMailSender.send(simpleMailMessage);;

    }

}