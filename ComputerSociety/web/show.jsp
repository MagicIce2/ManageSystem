<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2018/10/16
  Time: 10:07
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
    <script type="text/javascript" src="static/js/data.js"></script>
</head>
<body>
    <%
        String Infos = (String)request.getAttribute("stuNameInfo");
        if(Infos != null && Infos.length() > 0){
    %>
    <br/><br/>

    <table class="table table-bordered table-responsive">
        <tr>
            <th>字符串</th>
        </tr>
        <tr>
            <td><%=Infos%></td>
        </tr>
    </table>
    <%
        }
    %>
    <script type="text/javascript" src="static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="Bootstrap3/js/bootstrap.min.js"></script>
</body>
</html>
