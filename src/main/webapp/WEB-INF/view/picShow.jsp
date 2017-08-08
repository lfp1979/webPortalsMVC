<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="bootstrap/js/jquery-1.9.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script> 
 $(document).ready(function(){ 
 $('#myCarousel').carousel({interval:5000});//每隔5秒自动轮播 
 }); 
 </script> 
</head>
<body>
	<div class="inner">
		<div id="myCarousel" class="carousel slide">
  			<ol class="carousel-indicators">
  				<s:forEach items="${picList}" begin="0" end="0">
  					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
  				</s:forEach>
    			<s:forEach items="${picList}" begin="1" varStatus="st">
  					<li data-target="#myCarousel" data-slide-to="${st.index}" ></li>
  				</s:forEach>
  			</ol>
  <!-- Carousel items -->
  			<div class="carousel-inner">
  				<div class="active item">
  					<s:forEach items="${picList}" begin="0" end="0" var="pic">
  					<div class="item">
  							<a href="articleShow.mvc?articleId=${pic.id}">
  								<img src="${pic.picFile}" style="width:100%; height:200px"/>
  							</a>
        					<div class="carousel-caption">
                      			${pic.title}
                      		</div>
    				</div>
  					</s:forEach>
    			</div>
  				<s:forEach items="${picList}" begin="1" var="pic">
  					<div class="item">
  					    <a href="articleShow.mvc?articleId=${pic.id}">
  							<img src="${pic.picFile}" style="width:100%; height:200px"/>
        				</a>
        					<div class="carousel-caption">
                      			${pic.title}
                      		</div>
    				</div>
  				</s:forEach>
  			</div>
  <!-- Carousel nav -->
  		<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
  		<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
	</div>  
	
</body>
</html>