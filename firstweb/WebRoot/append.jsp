<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'append.jsp' starting page</title>
    
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
  	<%
  		request.setCharacterEncoding("utf-8");
  		
  		String stuno = request.getParameter("stuNo");
  		String stupassword = request.getParameter("stuPassword");
  		String stuname = request.getParameter("stuName");
  		String stusex = request.getParameter("stuSex");
		String studepart = request.getParameter("stuDepart");
		String stuclass = request.getParameter("stuClass");
		String year = request.getParameter("year")+"-";
		String mounth = request.getParameter("mounth")+"-";
		String day = request.getParameter("day");
		String birthday = year+mounth+day;
		String phone = request.getParameter("stuPhone");
		String qq = request.getParameter("stuQQ");
		String me = request.getParameter("stuMe");
		if(stuno == null || stupassword == null || stuname == null || phone == null || qq == null){
			out.print("<jsp:forward page='register.jsp'>");
			return;
		}
		if(stuno.trim().equals("") || stupassword.trim().equals("") || stuname.trim().equals("") || phone.trim().equals("") || qq.trim().equals("")){
			return;
		}
  		try{
  			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=gbk";
			String username = "root";
			String password = "windowmysql123";
			Class.forName(driverClass);
			Connection conn = DriverManager.getConnection(url, username, password);
			
    		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    		ResultSet rs = stmt.executeQuery("select * from stuinfo");
    		rs.last();
    		int number = rs.getRow() + 1;
    		rs.close();
    		String stuData = "insert into stuinfo(id,stuNo,stuDepart,stuClass,stuName,stuPhone,stuSex,stuQQ,stuPassword,stuBirthday,stuMe)"
    			+"values("+number+",'"+stuno+"','"+studepart+"','"+stuclass+"','"
    			+stuname+"','"+phone+"','"+stusex+"','"+qq+"','"+stupassword+"','"+birthday+"','"+me+"')";
    		stmt.executeUpdate(stuData);
    		stmt.close();
    		conn.close();
  			out.print("<a href='pay.jsp'>添加成功，点击进入社团主页！</a>");
  			out.print("若无动作3秒钟后跳转！");
  			response.setHeader("Refresh","3,url=index.jsp");
  		}catch(SQLException e){
    		out.println("数据库连接或SQL查询异常!<br/>");
    		out.println(e.getMessage());
    	}catch(Exception e){
    		out.println("<a href='register.jsp'>出现其他异常!,输入的数据不正确，请重新输入！</a><br/>");
    		out.println(e.getMessage());
    	}
  	%>
  </body>
</html>
