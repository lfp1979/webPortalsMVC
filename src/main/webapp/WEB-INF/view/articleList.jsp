<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  
 	<s:url value="getClassArticles.mvc" var="url" >
 		<s:param name="classId">${clazz.id}</s:param>
 	</s:url>
	 <div class="inner">
		 <div class="title">
        		<span>
        		<a href="${url}">${clazz.sortName}</a></span>
        		<span><a href="${url}">更多</a></span>
        		<img src="images/index5_39.gif" class="img-right"/>
        </div>
     
        <ul>
       		<s:forEach items="${articleList}" var="article">     		
       				<li><a href="articleShow.mvc?articleId=${article.id}">
       				<s:if test="${article.isTop}"><font color="red"></s:if>
       				<s:if test="${article.isCommend}"><font color="green"></s:if>
       					${article.title}
       				<s:if test="${article.isTop}"></font><img  src="images/top.gif"></s:if>
       				<s:if test="${article.isCommend}"></font><img  src="images/recommend.png"></s:if>
       				</a></li>
       			
       		</s:forEach>
        </ul>
     </div>
</body>
</html>