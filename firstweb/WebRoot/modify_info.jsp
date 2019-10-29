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
  	
  	<%@ page import="java.sql.*" %>
    <%
    	request.setCharacterEncoding("utf-8");
    	String modify_No = request.getParameter("ModifystuNo");
    	String modify_depart= request.getParameter("ModifyDepart");
    	String modify_class = request.getParameter("ModifyClass");
    	String modify_id = request.getParameter("ModifyID");
    	
    	try{
    		String driverClass = "com.mysql.jdbc.Driver";
    		String Path = request.getRealPath("");
    		String url = "jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=gbk";
    		String username = "root";
    		String password = "windowmysql123";
    		Class.forName(driverClass);
    		Connection conn = DriverManager.getConnection(url, username, password);
    		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
 			int modify_Id = Integer.parseInt(modify_id);
			ResultSet rs = stmt.executeQuery("select * from stuinfo");
			while(rs.next()){
				if(rs.getInt(1) == modify_Id){
	    	String sql = "update stuinfo set stuNo = "+modify_No+"stuDepart="+modify_depart+"stuClass="+modify_class+"where id="+modify_Id;
	    	stmt.execute(sql);
				}
		}
	    	out.print("修改成功");
	    	
	

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
