package com.springbook.biz.email;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.springbook.biz.user.UserVO;

public class EmailSender {

    public static void main(String[] args) {
    	UserVO vo=new UserVO();
        String recipient = vo.getEmail();
        String password = vo.getPassword(); // 예시로 사용자의 비밀번호 설정

        // 사용자의 정보를 이용하여 이메일 전송
        sendEmail(recipient, password);
    }

    public static void sendEmail(String recipient, String password) {
        // 이메일 전송을 위한 설정
        final String userEmailAddress = "yidj111@gmail.com";
        final String emailPassword = "lkyr txlv lxbe wbgn";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userEmailAddress, emailPassword);
            }
        });

        MimeMessage message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(userEmailAddress));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            message.setSubject("climb 비밀번호 안내");
            message.setText("안녕하세요, " + recipient + "님.\n당신의 비밀번호는 " + password + " 입니다.");

            Transport.send(message);
            System.out.println("이메일 전송 완료");

        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
