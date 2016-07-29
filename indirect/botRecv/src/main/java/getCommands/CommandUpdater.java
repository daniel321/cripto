package getCommands;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Store;

import main.Paths;

import org.apache.commons.lang3.StringUtils;

public class CommandUpdater {
	static String from = "obondanielspam@gmail.com";
	static String username = from;
	static String password = "spammymail";
	static String port = "995";

	public final Paths paths;
	Date lastDate;

	public CommandUpdater(Paths paths) {
		this.paths = paths;
		lastDate = readDate(paths.date());
	}

	public void createRoot() {
		new File(paths.root()).mkdirs();
	}

	public void updateCommands() throws MessagingException, IOException {
		Properties props = new Properties();
		props.setProperty("mail.store.protocol", "imaps");
		props.setProperty("mail.imaps.host", "imap.gmail.com");
		props.setProperty("mail.imaps.port", "993");
		props.setProperty("mail.imaps.connectiontimeout", "5000");
		props.setProperty("mail.imaps.timeout", "5000");

		// Get the Session object.
		Session session = Session.getDefaultInstance(props, null);

		// create the POP3 store object and connect with the pop server
		Store store = session.getStore("imaps");
		store.connect("imap.gmail.com", username, password);

		Folder emailFolder = store.getFolder("INBOX");
		emailFolder.open(Folder.READ_ONLY);

		Message[] messages = emailFolder.getMessages();

		// System.out.print("\n");
		// System.out.print(lastDate);
		// System.out.print("\n");

		List<File> attachments = new ArrayList<File>();
		for (int j = 0, n = messages.length; j < n; j++) {
			Message message = messages[j];
			Date messageDate = message.getReceivedDate();

			if (lastDate == null || messageDate.compareTo(lastDate) > 0) {
				lastDate = messageDate;
				writeDate(paths.date(), lastDate);

				Multipart multipart = (Multipart) message.getContent();
				// System.out.println(multipart.getCount());

				for (int i = 0; i < multipart.getCount(); i++) {
					BodyPart bodyPart = multipart.getBodyPart(i);
					if (!Part.ATTACHMENT.equalsIgnoreCase(bodyPart.getDisposition()) && !StringUtils.isNotBlank(bodyPart.getFileName())) {
						continue; // dealing with attachments only
					}
					InputStream is = bodyPart.getInputStream();
					File f = new File(paths.root() + "\\" + bodyPart.getFileName());
					FileOutputStream fos = new FileOutputStream(f);
					byte[] buf = new byte[4096];
					int bytesRead;
					while ((bytesRead = is.read(buf)) != -1) {
						fos.write(buf, 0, bytesRead);
					}
					fos.close();
					// printFile(root + bodyPart.getFileName());

					attachments.add(f);
				}
			}
		}

		// close the store and folder objects
		emailFolder.close(false);
		store.close();
	}

	public void printFile(String path) {
		try (BufferedReader br = new BufferedReader(new FileReader(path))) {
			String line = null;
			while ((line = br.readLine()) != null) {
				System.out.println(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Date readDate(String path) {
		try (BufferedReader br = new BufferedReader(new FileReader(path))) {
			String line = br.readLine();
			if (line != null) {
				return new Date(Long.parseLong(line));
			}
		} catch (IOException e) {
			//e.printStackTrace();
		}
		return lastDate;
	}

	public void writeDate(String path, Date date) throws IOException {
		cleanDate(path);
		try (PrintWriter out = new PrintWriter(path)) {
			out.println(date.getTime());
		}
	}

	public void cleanDate(String path) throws IOException {
		try (FileOutputStream out = new FileOutputStream(path, true)) {
			out.getChannel().truncate(0);
		}
	}
}