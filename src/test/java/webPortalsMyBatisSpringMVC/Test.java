package webPortalsMyBatisSpringMVC;

import java.io.File;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import ok3w.entity.Article;
import ok3w.entity.Clazz;
import ok3w.service.Service;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext ac = new FileSystemXmlApplicationContext("src/main/java/applicationContext.xml"); 
		Service s = (Service) ac.getBean("service");
	    s.listClassChild(60);
	   // System.out.println(s.getPicList().size());
	}

}
