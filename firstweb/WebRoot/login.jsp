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
	<link rel="stylesheet" href="Bootstrap3/css/bootstrap.min.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<%@ include file="header.jsp"%>
  	<div class="container">
    <form class="form-horizontal" action="check_login.jsp" method="post" name="form_login" onsubmit="return checkinfo_login()">
		    <div class="form-group">
		    	<label for="No" class="col-sm-2 control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
		    	<div class="col-sm-10">
		    		<input type="text" class="form-control" id="No" placeholder="请输入学号,就是当时自己设置的账号" name="stuNologin" onblur="checkedNo()">
		    	</div>
		    </div>
		    
		    <div class="form-group">
		    	<label for="pass" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
		    	<div class="col-sm-10">
		    		<input type="password" class="form-control" id="pass" placeholder="请输入你的登录密码，自己设置的" name="stuPasswordlogin">
		    	</div>
		    </div>
		    <div class="form-group">
		    	<button type="submit" class="btn btn-info col-xs-3 col-xs-offset-2">登录</button>
		    	<button type="reset" class="btn btn-warning col-xs-3 col-xs-offset-2">重置</button>
		    </div>
	</form>
	<script>
		function checkinfo_login(){
			if(form_login.stuNo.value.length == 0){
				alert("学号不能为空!");
				return false;
			}else if(form_login.stuPassword.value.length == 0){
				alert("密码不能为空!");
				return false;
			}
		};
	</script>
	</div>
    <script src="lib/jquery-3.3.1.min.js"></script>
  	<script src="Bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="lib/star.js"></script>
  </body>
</html>
