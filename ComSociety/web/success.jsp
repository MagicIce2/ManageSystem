<%@ page import="com.SignSystem.session.MySessionContext" %><%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2018/10/15
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <link rel="stylesheet" href="Bootstrap3/css/bootstrap.min.css" />
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="lib/data.js"></script>
</head>
<body>
    <%@ include file="header.jsp"%>
    <div style="height:10px"></div>
    <div class="alert alert-warning"><h1>签到成功！你的签到信息如下，如有错误，请尽快联系社团工作人员！</h1></div>
    <div class="alert alert-info"><h3>
    <%
        Cookie [] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0){
            for(Cookie c: cookies){
                if (c.getName().equals("StuInfo")){
                    MySessionContext mySessionContext = MySessionContext.getInstance();
                    HttpSession session1 = mySessionContext.getSession(c.getValue());
                    //System.out.println(c.getValue());
                    //System.out.println(session1.getAttribute("stuDepart"));
                    if(session1 != null) {
                       out.print("学院：");
                       out.print(session1.getAttribute("stuDepart") + "<br/>");
                       out.print("班级：");
                       out.print(session1.getAttribute("stuClass") + "<br/>");
                       out.print("姓名：");
                       out.print(session1.getAttribute("stuName") + "<br/>");
                    }
                }
            }
        }
    %>
    </h3>
    </div>
    <script src="lib/jquery-3.3.1.min.js"></script>
    <script src="Bootstrap3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="lib/star.js"></script>
</body>
</html>
