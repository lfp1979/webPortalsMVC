<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/index.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div id="header">
	<div id="logo">
		<img src="images/logo.gif"/>
	</div>
    <div id="mar">
    	<span><strong><font color="red">滚动新闻：</font></strong></span>
    	<marquee >${moveArticle.content}</marquee>
    </div>
    <div id="nav">
    	<ul>
    	  	<li><img src="images/index5_11.gif" /></li><li><a href="admin/listArticle.mvc?pageNum=1">文章管理</a></li>
            <li><img src="images/index5_11.gif" /></li><li><a href="admin/listClass.mvc?id=0">类别管理</a></li>
           <s:forEach items="${clazz0.child}" var="clazz">  
            		<s:url value="getClassArticles.mvc" var="url" >
 						<s:param name="classId">${clazz.id}</s:param>
 					</s:url>
            	  <li><img src="images/index5_11.gif" /></li>
            	  <li><a href="${url}">${clazz.sortName}</a></li>
            </s:forEach>
         
        </ul>
    </div>
   
</div>
</body>
</html>