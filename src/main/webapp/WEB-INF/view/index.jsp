<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebPortals</title>
<link href="css/css2.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/page.css">
<link href="css/index.css" rel="stylesheet" type="text/css">
</head>
<body>

<s:import url="/showTop.mvc" />
	<div class="cell">
		<s:import url="/listByOrderId.mvc" >
			<s:param name="orderId" value="1"/>
		</s:import>
	
        <s:import url="/listByOrderId.mvc" >
			<s:param name="orderId" value="2"/>
		</s:import>
    </div>
    <div class="cell">
		 <jsp:include page="picShow.jsp"/>
         <s:import url="/listByOrderId.mvc" >
			<s:param name="orderId" value="3"/>
		</s:import>
    </div>
    <div class="cell  right">
		 <jsp:include page="articleList.jsp"/>
    </div>

    <div class="cell">
		 <s:import url="/listByOrderId.mvc" >
			<s:param name="orderId" value="4"/>
		</s:import>
    </div>
    <div class="cell">
		 <s:import url="/listByOrderId.mvc" >
			<s:param name="orderId" value="5"/>
		</s:import>
    </div>
    <div class="cell">
		 <s:import url="/listByOrderId.mvc" >
			<s:param name="orderId" value="6"/>
		</s:import>
    </div>


    <div class="cell bottom">
		<div class="inner ">
        	<div class="title">
        		<span>友情链接</span>
        		<img src="images/index5_39.gif" class="img-right"/>
        	</div>
		 	<ul>
            	<s:forEach items="${urlList}" var="u">
       				<li><a href='${u.lurl}'>${u.lname}</a></li>
       			</s:forEach>
         	</ul>
        </div>
   	</div>
<jsp:include page="footer.jsp"/>
</body>

</html>
