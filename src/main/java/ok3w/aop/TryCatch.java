package ok3w.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class TryCatch {
	private String getExceptionMsg(Exception e)
	{
		Throwable t=e.getCause();
		String msg="";
	    while(t!=null)
	    {
		  msg=t.getMessage();
		  t=t.getCause();
	    }
	    if(msg.contains("Duplicate entry") && msg.contains("SortName"))
	    {
	    	String name=msg.substring(16, msg.length()-18);
	    	msg="��Ŀ���ƣ�"+name+" �ظ�";
	    }
	    if(msg.contains("Cannot delete") && msg.contains("ok3w_article_ibfk_1"))
	    {
	    	msg="����ɾ���������ȷ�ϴ�����µ��������¶���ɾ����";
	    }
	    if(msg.contains("Cannot delete") && msg.contains("ok3w_class_ibfk_1"))
	    {
	    	msg="����ɾ���������ȷ�ϴ�����µ������������ɾ����";
	    }
	    return msg;
	}
	@Pointcut("execution(* ok3w.service.Service.*(..))")
	private void anyMethod(){}
	
	@Around("anyMethod()")
	public Object doBasicProfiling(ProceedingJoinPoint pjp) throws Throwable{
		Object object=null;
		try {
			 object=pjp.proceed();
				} catch (Exception e) {
					throw new RuntimeException(getExceptionMsg(e));
				}
		return object;
		}
}
