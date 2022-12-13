package ph.com.cpi.model;

	import java.util.Properties;
	import javax.mail.Message;
	import javax.mail.MessagingException;
	import javax.mail.PasswordAuthentication;
	import javax.mail.Session;
	import javax.mail.Transport;
	import javax.mail.internet.InternetAddress;
	import javax.mail.internet.MimeMessage;

	public class SendEmail {
	    public void email(String email, String npassword) {
	      String to = email;
	      String from = "finalprojectcpi@gmail.com";
	      String password = "ptbxealfeoygfemm";
	      String host = "smtp.gmail.com";

	      Properties properties = System.getProperties();
	      properties.put("mail.smtp.host", host);
	      properties.put("mail.smtp.port", "465");
	      properties.put("mail.smtp.ssl.enable", "true");
	      properties.put("mail.smtp.auth", "true");

	      Session session = Session.getInstance(properties, new javax.mail.Authenticator(){
	        protected PasswordAuthentication getPasswordAuthentication() {
	          return new PasswordAuthentication(from, password);
	        }
	      });

	      try {
	        MimeMessage message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(from));
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	        message.setSubject("New Password");
	        message.setText("Here's your new Password: " + npassword);

	        Transport.send(message);
	        System.out.println("New Password Sent Successfully");
	        
	      } catch (MessagingException mex) {
	        mex.printStackTrace();
	      }
	      return;
	   }
	}
