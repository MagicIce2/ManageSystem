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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%@ page import="java.sql.*" %>
    <center><h3>职工数据库中所有的记录</h3></center>
    <%
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
    		out.print("<table border align='center'>");
    		out.print("<tr>");
    		rs.last();
    		out.print("<td colspan=13 align='center'>社员（共" + rs.getRow() + "条记录)</td>");
    		rs.beforeFirst();
    		out.print("</tr>");
    		
    		//数据库显示代码
    		out.print("<tr>");
    		out.print("<th width=100>"+"序号</th>");
    		out.print("<th width=100>"+"学号</th>");
    		out.print("<th width=100>"+"学院</th>");
    		out.print("<th width=100>"+"班级</th>");    		
    		out.print("<th width=100>"+"姓名</th>");
    		out.print("<th width=100>"+"联系方式</th>");    		
    		out.print("<th width=100>"+"性别</th>");
    		out.print("<th width=100>"+"QQ</th>");
    		out.print("<th width=100>"+"密码</th>");    		
    		out.print("<th width=100>"+"生日</th>");
    		out.print("<th width=100>"+"是否已缴费</th>");
    		out.print("<th width=100>"+"修改</th>");
    		out.print("<th width=100>"+"删除</th>");
    		out.print("</tr>");
    		
    		while(rs.next()){
    			out.print("<tr align='center'>");
    			out.print("<td>"+rs.getInt(1)+"</td>");
    			out.print("<td>"+rs.getString(2)+"</td>");
    			out.print("<td>"+rs.getString(3)+"</td>");
    			out.print("<td>"+rs.getString(4)+"</td>");
    			out.print("<td>"+rs.getString(5)+"</td>");
    			out.print("<td>"+rs.getString(6)+"</td>");
    			out.print("<td>"+rs.getString(7)+"</td>");
    			out.print("<td>"+rs.getString(8)+"</td>");
    			out.print("<td>"+rs.getString(9)+"</td>");
    			out.print("<td>"+rs.getString(10)+"</td>");
    			out.print("<td>"+rs.getInt(11)+"</td>");
    			out.print("<td><a href='#'>"+"修改</a></td>");
    			out.print("<td><a href='#'>"+"删除</a></td>");
    			out.print("</tr>");
    		}
    		out.print("</table>");
    		
    		//释放资源代码
    		rs.close();
    		stmt.close();
    		conn.close();
    			
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
  </body>
</html>
