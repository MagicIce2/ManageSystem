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
  	<%@ page import="java.sql.*" %>
    <%
    	request.setCharacterEncoding("utf-8");
    	String login_user = request.getParameter("stuNologin");
    	String login_password = request.getParameter("stuPasswordlogin");
    	
    	try{
    		String driverClass = "com.mysql.jdbc.Driver";
    		String Path = request.getRealPath("");
    		String url = "jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=gbk";
    		String username = "root";
    		String password = "windowmysql123";
    		Class.forName(driverClass);
    		Connection conn = DriverManager.getConnection(url, username, password);
    		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    		
    		ResultSet rs = stmt.executeQuery("select * from stuinfo");
    		boolean flag = false;
    		while(rs.next()){
	    		if(rs.getString(2).equals(login_user) && rs.getString(9).equals(login_password)){
	    			out.print("<center><h3>修改数据</h3></center>");
	    			
  					out.print("<table class='table table-bordered'>");
  					out.print("<thead><tr><th>名称</th><th>修改前的数据</th><th>请输入修改后的数据</th></tr></thead>");
  					out.print("<tbody>");
  					out.print("<form class='form-horizontal' action='modify_info.jsp' method='post' name='form_modify'>");
  					out.print("<tr><td><input type='hidden' id='disabledTextInput' class='form-control' name='ModifyID' value='"+rs.getInt(1)+"'>学号</td><td>"
  						+rs.getString(2)+"</td><td><input type='text' class='form-control' name='ModifystuNo'></td></tr>");
  					out.print("<tr><td>学院</td><td>"+rs.getString(3)+"</td><td><input type='text' class='form-control' name='ModifyDepart></td></tr>");
  					out.print("<tr><td>班级</td><td>"+rs.getString(4)+"</td><td><input type='text' class='form-control' name='ModifyClass></td></tr>");
  					
  					out.print("<tr><td colspan=3>");
    				out.print("</td></tr>");
	    			out.print("</form>");
	    			out.print("</tbody>");
    				out.print("</table>");
	    			
	    			flag = true;
	    		}
    		}
    		if(!flag){
    			out.print("登录失败");
    			out.print("请重新登录！");
  				response.setHeader("Refresh","1,url=login.jsp");
    		}
    	}catch(ClassNotFoundException e){
    		out.println("驱动程序类异常，加载出错!<br/>");
    		out.println(e.getMessage());
    	}catch(SQLException e){
    		out.println("数据库连接或SQL查询异常!<br/>");
    		out.println(e.getMessage());
    	}catch(Exception e){
    		out.println("出现其他异常!<br/>");
    		out.println(e.getMessage());
    	}
    		
    %>
    <script src="lib/jquery-3.3.1.min.js"></script>
  	<script src="Bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="lib/star.js"></script>
  </body>
</html>
