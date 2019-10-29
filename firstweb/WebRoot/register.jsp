<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
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
	<script type="text/javascript" src="lib/data.js"></script>
  </head>
  
  <body onload="addOption();changeOption();test();">
  	  <%@ include file="header.jsp"%>
  	  <div style="height:10px"></div>
	  <div class="container">
	  	 <form class="form-horizontal" action="append.jsp" method="post" name="form1" onsubmit="return checkinfo()">
		    <div class="form-group">
		    	<label for="No" class="col-sm-2 control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
		    	<div class="col-sm-10">
		    		<input type="text" class="form-control" id="No" placeholder="请输入学号" name="stuNo" onblur="checkedNo()">
		    	</div>
		    </div>
		    
		    <div class="form-group">
		    	<label for="pass" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
		    	<div class="col-sm-10">
		    		<input type="password" class="form-control" id="pass" placeholder="请设置你的登录密码" name="stuPassword">
		    	</div>
		    </div>
		    
		    <div class="form-group">
		    	<label for="conpass" class="col-sm-2 control-label">确认密码</label>
		    	<div class="col-sm-10">
		    		<input type="password" class="form-control" id="conpass" placeholder="请确认你的登录密码" name="conPassword" onblur="conPass()">
		    	</div>
		    </div>
		    
		    <div class="form-group">
		    	<label for="nam" class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
		    	<div class="col-sm-10">
		    		<input type="text" class="form-control" id="nam" placeholder="请输入姓名" name="stuName">
		    	</div>
		    </div>
		    
		    <div class="form-group">
		    	<label class="col-sm-2 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
		    	<label class="col-sm-1">
				    <input type="radio" name="stuSex"  checked value="男"> 男
				</label>
				<label class="col-sm-1">
				    <input type="radio" name="stuSex" value="女"> 女
				</label>
		    </div>
		    
		    <div class="form-group">
			    <label class="col-sm-2 control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院</label>
			    <div class="col-sm-2">
			    	<select class="form-control" id="da" name="stuDepart"></select>
				</div>
			    <label class="col-sm-2 control-label">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</label>
				<div class="col-sm-2">
	   				<select class="form-control" id="xiao" name="stuClass"></select>
				</div>
   			</div>
   			
   			<div class="form-group">
   				<label class="col-xs-1 control-label col-sm-2">出生日期</label>
   				<div class="col-xs-10">
   					<div class="col-xs-10">
		   				<select class="form-control" name="year" id="year" size="1" onchange="changeOption()">
		   						<option></option>
						</select>
					</div>
					<div class="col-xs-2">年</div>
					<div class="col-xs-10">
						<select class="form-control" name="mounth" id="month" size="1" onchange="changeOption()">
								<option></option>
						</select>
					</div>
					<div class="col-xs-2">月</div>
					<div class="col-xs-10">
						<select class="form-control" name="day" id="day" size="1">
								 <option></option>
						</select>
					</div>
					<div class="col-xs-2">日</div>
				</div>
   			</div>		
   		    <div class="form-group">
		    	<label for="phone" class="col-sm-2 control-label">联系方式</label>
		    	<div class="col-sm-10">
		    		<input type="text" class="form-control" id="phone" placeholder="请输入手机号" name="stuPhone">
		    	</div>
		    </div>
		    
		    <div class="form-group">
		    	<label for="qq" class="col-sm-2 control-label">Q&nbsp;&nbsp;Q</label>
		    	<div class="col-sm-10">
		    		<input type="text" class="form-control" id="qq" placeholder="请输入QQ号" name="stuQQ">
		    	</div>
		    </div>
		    <div class="form-group">
		    	<label for="me" class="col-sm-2 control-label">自我介绍</label>
		    	<div class="col-sm-10">
		    		<textarea id="me" class="form-control" rows="3" name="stuMe" placeholder="请输入自我介绍和你想学习的知识"></textarea>
		    	</div>
		    </div>
		    <div class="form-group">
		    	<button type="submit" class="btn btn-info col-xs-3 col-xs-offset-2">注册</button>
		    	<button type="reset" class="btn btn-warning col-xs-3 col-xs-offset-2">重置</button>
		    </div>
		 </form>
	  </div>
	<script src="lib/jquery-3.3.1.min.js"></script>
  	<script src="Bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="lib/star.js"></script>
	<script>
		function checkinfo(){
			if(form1.stuNo.value.length == 0){
				alert("学号不能为空!");
				return false;
			}else if(form1.stuPassword.value.length == 0){
				alert("密码不能为空!");
				return false;
			}else if(form1.stuName.value.length == 0){
				alert("姓名不能为空!");
				return false;
			}else if(form1.stuPhone.value.length == 0 || form1.stuPhone.value == ""){
				alert("手机号不能为空!");
				return false;
			}else if(form1.stuQQ.value.length == 0 || form1.stuQQ.value == ""){
				alert("QQ号不能为空!");
				return false;
			}
		};
		function conPass(){
			var pass = document.form1.stuPassword.value;
			var conpass = document.form1.conPassword;
			if(pass != conpass.value){
				alert("两次输入的密码不一致!");
				conpass.foucs();
				return false;
			}
		};
	</script>
  </body>
</html>
