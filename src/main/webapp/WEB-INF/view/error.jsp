<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
出错了！错误信息：
	<div id="show"></div>
		<a title="后退" href="javascript:history.back();">返回上一頁</a>

	<script type="text/javascript">
           document.getElementById("show").innerHTML="${exception.message}";
	</script>
</body>
</html>