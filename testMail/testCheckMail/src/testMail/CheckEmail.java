package testMail;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;

public class CheckEmail {
	static String from = "obondanielspam@gmail.com";
	static String username = from;
	static String password = "spammymail";
	
	static String host = "smtp.gmail.com";
	static String port = "995"; 
	
   public static void main(String[] args) {

      Properties props = new Properties();
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", port);
      props.put("mail.smtp.starttls.enable", "true");
      
      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
	   }
         });

      try {
          //create the POP3 store object and connect with the pop server
          Store store = session.getStore("pop3s");
          store.connect(host, username, password);
          
          Folder emailFolder = store.getFolder("INBOX");
          emailFolder.open(Folder.READ_ONLY);
          
          // retrieve the messages from the folder in an array and print it
          Message[] messages = emailFolder.getMessages();

          for (int i = 0, n = messages.length; i < n; i++) {
             Message message = messages[i];
             System.out.println("---------------------------------");
             System.out.println("Email Number " + (i + 1));
             System.out.println("Subject: " + message.getSubject());
             System.out.println("From: " + message.getFrom()[0]);
            
             System.out.println("Text: " + getText(message));          	 
          }

          //close the store and folder objects
          emailFolder.close(false);
          store.close(); 
          
      } catch (MessagingException | IOException e) {
         throw new RuntimeException(e);
      }
   }
   
   /**
    * Return the primary text content of the message.
    */
   private static String getText(Part p) throws MessagingException, IOException {
       if (p.isMimeType("text/*")) {
           String s = (String)p.getContent();
           p.isMimeType("text/html");
           return s;
       }

       if (p.isMimeType("multipart/alternative")) {
           // prefer html text over plain text
           Multipart mp = (Multipart)p.getContent();
           String text = null;
           for (int i = 0; i < mp.getCount(); i++) {
               Part bp = mp.getBodyPart(i);
               if (bp.isMimeType("text/plain")) {
                   if (text == null)
                       text = getText(bp);
                   continue;
               } else if (bp.isMimeType("text/html")) {
                   String s = getText(bp);
                   if (s != null)
                       return s;
               } else {
                   return getText(bp);
               }
           }
           return text;
       } else if (p.isMimeType("multipart/*")) {
           Multipart mp = (Multipart)p.getContent();
           for (int i = 0; i < mp.getCount(); i++) {
               String s = getText(mp.getBodyPart(i));
               if (s != null)
                   return s;
           }
       }
       return null;
   }
}
