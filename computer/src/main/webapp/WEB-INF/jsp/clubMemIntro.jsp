<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/bootstrap.min.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
      <%--<c:if test="${empty requestScope.memberIntros}"><c:redirect url="memberintro_findAll"></c:redirect></c:if>--%>
  </head>
  
  <body>
  	<%@ include file="header.jsp"%>
    <%--<s:debug></s:debug>--%>
  	<div style="background:url(${pageContext.request.contextPath}/img/huiheng.jpg) repeat-x;">
	  	<div style="height:20px"></div>
	    <div class="container">
	    	<div class="row">
                <c:forEach items="${requestScope.memberIntros}" var="intro" varStatus="p">
                <div class="col-md-4">
                    <img src="${pageContext.request.contextPath}${intro.staffPicture}" class="img-rounded img-responsive">
                    <div class="bg-success" style="padding:5px; margin:10px 0; ">
                        <h5>姓名：${intro.staffName}</h5>
                        <h5>专业：${intro.staffProfession}</h5>
                        <h5>职位：${intro.staffDuty}</h5>
                        <p>个人简介：${intro.staffIntroduce}</p>
                        <p>座右铭：${intro.staffMotto}</p>
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
	<script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/Bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/star.js"></script>
  </body>
</html>
