<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'speak.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
	<link rel="stylesheet" href="Bootstrap3/css/bootstrap.min.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background:url(img/huiheng.jpg) repeat-x;">
   	<%@ include file="header.jsp"%>
   	<div class="alert alert-danger">
   		<p>亲爱的用户，你好！本时间段不是社团纳新阶段，请本周六周日(9月15、16日)于生活区小广场缴纳社团费用，届时会进行登记，成为正式社团成员。</p>
   	</div>
   	<script src="lib/jquery-3.3.1.min.js"></script>
  	<script src="Bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="lib/star.js"></script>
  </body>
</html>
