<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>计算机社团</title>
    
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
      <c:if test="${empty requestScope.memberintro}"><c:redirect url="getclub.inf"></c:redirect></c:if>
  </head>
  
  <body>
  	<%@ include file="header.jsp"%>
  	<div style="background:url(img/huiheng.jpg) repeat-x;">
	  	<div style="height:20px"></div>
	    <div class="container">
	    	<div class="row">
                <c:forEach items="${requestScope.memberintro}" var="intro" varStatus="p">
                <div class="col-md-4">
                    <img src="${intro.staff_picture}" class="img-rounded img-responsive">
                    <div class="bg-success" style="padding:5px; margin:10px 0; ">
                        <h5>姓名：${intro.staff_name}</h5>
                        <h5>专业：${intro.staff_profession}</h5>
                        <h5>职位：${intro.staff_duty}</h5>
                        <p>个人简介：${intro.staff_introduce}</p>
                        <p>座右铭：${intro.staff_motto}</p>
                    </div>
                </div>
                    <c:if test="${p.count%3 == 0}">
                        <div class="clearfix"></div>
                        <div style="height:20px"></div>
                    </c:if>
                </c:forEach>
			</div>
	    </div>
    </div>
    <%@ include file="footer.jsp"%>
	<script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="Bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/star.js"></script>
  </body>
</html>
