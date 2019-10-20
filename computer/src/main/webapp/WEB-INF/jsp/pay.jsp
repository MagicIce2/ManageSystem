<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
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

  <script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"56193",secure:"56198"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
  
  <body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-13" data-genuitec-path="/firstweb/WebRoot/pay.jsp">
	<%@ include file="header.jsp"%>
		<div class='alert alert-warning' role='alert'>
			<h2>请使用微信或者支付宝付款，支付的时候请在备注的地方写上自己的姓名，以便进行区分</h2>
		</div>
		
		<div class="col-md-4">
			 <img src="${pageContext.request.contextPath}/img/zhifubao.jpg" class="img-rounded img-responsive">
		</div>
		<div class="clearfix"></div>
		<div style="height:20px"></div>
		<div class="col-md-4">
			 <img src="${pageContext.request.contextPath}/img/weixin.jpg" class="img-rounded img-responsive">
		</div>
 	<script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
  	<script src="${pageContext.request.contextPath}/Bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/star.js"></script>
  </body>
</html>
