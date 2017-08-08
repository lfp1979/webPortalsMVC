<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${article.title}</title>
<link href="css/css2.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<s:import url="/showTop.mvc" />
<div>
	<div>
		您当前位置：
		<s:forEach items="${path}" var="p">
			<a href="${p.value}">${p.key}</a> >>
    	</s:forEach>>
		${article.title}&nbsp;
	</div>
	<div class="w650 wrapper">
		<h1>${article.title}</h1>
		<div class="hui hcenter">
			来源：
			${article.comeFrom}
			发布时间：
			${article.addTime}
			点击数：
			${article.hits}
		</div>
		<hr size="2" color="#C3E7E3" width="95%" />
		<span class="gray14"> ${article.content}</span>
	</div>
	<div class="w250 wrapper">
		<div class="title">
			<span>本类New15</span> 
			<img src="images/index5_39.gif" class="img-right" />
		</div>
		<ul>
		<s:forEach items="${new15}" var="article">
			<s:url value="articleShow.mvc" var="url">
				<s:param name="articleId">
					${article.id}
				</s:param>
			</s:url>
			<li>
			<a href="${url}">
				${article.title}
			</a>
			</li>
		</s:forEach>
		</ul>
	</div>
</div>
</body>
</html>
