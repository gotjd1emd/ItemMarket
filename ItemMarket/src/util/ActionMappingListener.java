package util;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import controller.Action;

/**
 * Application Lifecycle Listener implementation class ActionMappingListener
 *
 */
@WebListener
public class ActionMappingListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ActionMappingListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
    	ServletContext application = arg0.getServletContext(); 
		String fileName = application.getInitParameter("action");
		
		Map<String, Action> map = new HashMap<>();
		System.out.println("contextlistener 시작");
		
		//properties
		ResourceBundle rb = ResourceBundle.getBundle(fileName);//classes 
		
		for(String key : rb.keySet()) {
			String className = rb.getString(key);
			
			try {
				Action action = (Action)Class.forName(className).newInstance();
				map.put(key, action);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		application.setAttribute("map", map);
    }
	
}