<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div >
			您当前位置：
			<s:forEach items="${path}" var="p">
				<a href="${p.value}">${p.key}</a> >>
    		</s:forEach>
			文章列表
			${article.title}
	</div>
	<div class="w650 wrapper">
		
		<div class="black14b title">
			<s:forEach items="${clazz.child}" var="c">
				<a href='getClassArticles.mvc?classId=${c.id}'>[${c.sortName}]</a>
			</s:forEach>
			<img src="images/index5_39.gif" class="img-right" />
		</div>
		<div>
			<ul>
				<s:forEach items="${articleList}" var="a">
					<li>
						 <span class="gray">.</span>
						 <span><a href="articleShow.mvc?articleId=${a.id}"> 
						 		<s:if test="${a.isTop}">
									<font color="red">
								</s:if>
								 <s:if test="${a.isCommend}">
									<font color="green">
								</s:if> 
								${a.title}
								<s:if test="${a.isTop}">
									</font><img src="images/top.gif">
								</s:if> 
								<s:if test="${a.isCommend}">
									</font><img src="images/recommend.png">
								</s:if>
								</a>
						</span> 
						<span class="tright"> <fmt:formatDate value="${a.addTime}" pattern="yyyy-MM-dd"/></span>
					</li>
				</s:forEach>
			</ul>
		</div>
	</div>
	<div class="w250 wrapper">
		<div class="title">
			<span>本类top15</span> <img src="images/index5_39.gif" class="img-right" />
		</div>
		
		<ul>
			<li><span class="tright">点击</span></li>
			<s:forEach items="${top15}" var="a">
				<s:url value="articleShow.mvc" var="url">
					<s:param name="articleId">
						${a.id}
					</s:param>
				</s:url>

				<li>
					  <span class="left"><a href="${url}">
							<s:if test="${a.isTop}">
								<font color="red">
							</s:if>
							<s:if test="${a.isCommend}">
								<font color="green">
							</s:if>
							${a.title}
							<s:if test="${a.isTop}">
								</font><img src="images/top.gif">
							</s:if>
							<s:if test="${a.isCommend}">
								</font><img src="images/recommend.png">
							</s:if>
							</a> 
						</span> 
						<span class="tright">${a.hits}</span>
				</li>
			</s:forEach>
		</ul>
	</div>
	
</body>
</html>
