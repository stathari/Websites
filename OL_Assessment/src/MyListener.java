


import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.*;

public class MyListener implements ServletContextListener {

	public void contextInitialized(ServletContextEvent sce) {
	try{
			ServletContext ctx=sce.getServletContext();
		Person p= new Person();
		HR hr= new HR();
		ctx.setAttribute("p", p);
		ctx.setAttribute("hr", hr);
		int error=0;
		ctx.setAttribute("error", error);
		Locale locale_US,locale_GER,locale_FR,locale_IN;
		ResourceBundle rb_US,rb_FR,rb_GER,rb_IN;
		String language_US="en";
		String language_IN="hi";
		String language_FR="fr";
		String language_GER="gr";
		String country_US="US";
		String country_IN="IN";
		String country_GER="GER";
		String country_FR="FR";
		locale_US = new Locale(language_US, country_US);
		
		rb_US = ResourceBundle.getBundle("MessagesBundle", locale_US);
		locale_FR = new Locale(language_FR, country_FR);
		
		rb_FR = ResourceBundle.getBundle("MessagesBundle", locale_FR);
		locale_GER = new Locale(language_GER, country_GER);
		
		rb_GER = ResourceBundle.getBundle("MessagesBundle", locale_GER);
		locale_IN = new Locale(language_IN, country_IN);
		
		rb_IN = ResourceBundle.getBundle("MessagesBundle", locale_IN);
		ctx.setAttribute("RB_US",rb_US);
		ctx.setAttribute("RB_IN",rb_IN);
		ctx.setAttribute("RB_GER",rb_GER);
		ctx.setAttribute("RB_FR",rb_FR);
		
		
	}
	catch(Exception e)
	{
		System.out.println("If You are seeing this message. Just stop the server and start it again! ");
		
	}
		}
	
	public void contextDestroyed(ServletContextEvent sce) {
		
		System.out.println("Destroy Called!");
	
	}


	}


