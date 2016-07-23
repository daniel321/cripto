package SendEmail;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendEmail {
	static String from = "obondanielspam@gmail.com";
	static String username = from;
	static String password = "spammymail";

	static String to = "obondanielspam@gmail.com";

	static String name = "test.au3";
	static String path = name;

	static String host = "smtp.gmail.com";
	static String port = "587"; // "25";

	public static void main(String[] args) throws MessagingException {

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);

		// Get the Session object.
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		// Create a default MimeMessage object.
		Message message = new MimeMessage(session);

		// Set From: header field of the header.
		message.setFrom(new InternetAddress(from));

		// Set To: header field of the header.
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

		// Set Subject: header field
		message.setSubject("Spam!!!");

		// Create the message part
		BodyPart messageBodyPart = new MimeBodyPart();

		// Fill the message
		messageBodyPart.setText("Hello, this is sample for to check send email using JavaMailAPI with an attatchment!!");

		// Create a multipar message
		Multipart multipart = new MimeMultipart();

		// Set text message part
		multipart.addBodyPart(messageBodyPart);

		// Part two is attachment
		messageBodyPart = new MimeBodyPart();
		DataSource source = new FileDataSource(path);
		messageBodyPart.setDataHandler(new DataHandler(source));
		messageBodyPart.setFileName(name);
		multipart.addBodyPart(messageBodyPart);

		// Send the complete message parts
		message.setContent(multipart);

		// Send message
		Transport.send(message);

		System.out.println("Sent message successfully....");
	}
}