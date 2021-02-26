package org.zerock.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class AppListener
 *
 */
public class AppListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public AppListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	ServletContext app = sce.getServletContext();
    	// application 영역에 Context root 추가  
         ServletContext application = sce.getServletContext();
         //건희 사진 루트 
         String staticPath = "https://objectstorage.ap-seoul-1.oraclecloud.com/n/cnq0frxctuu1/b/bucket-20210210-1438/o/";
         
         application.setAttribute("root", application.getContextPath());
         app.setAttribute("staticPath", staticPath);
    }
	
}
