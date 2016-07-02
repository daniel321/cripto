package testMail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	static String from = "obondanielspam@gmail.com";
	static String username = from;
	static String password = "spammymail";
	
	static String to = "nataliagbar@gmail.com";
	static String another = "aecarames@gmail.com";
	
	static String host = "smtp.gmail.com";
	static String port = "587"; // "25";
	
   public static void main(String[] args) {

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", port);

      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
	   }
         });

      try {
	   // Create a default MimeMessage object.
	   Message message = new MimeMessage(session);
	
	   // Set From: header field of the header.
	   message.setFrom(new InternetAddress(from));
	
	   // Set To: header field of the header.
	   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	   message.addRecipients(Message.RecipientType.CC,InternetAddress.parse(another));
	   
	   // Set Subject: header field
	   message.setSubject("Spam!!!");
	
	   // Now set the actual message
	   message.setText("Hello, this is sample for to check send email using JavaMailAPI ");

	   // Send message
	   Transport.send(message);

	   System.out.println("Sent message successfully....");

      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
   }
}
