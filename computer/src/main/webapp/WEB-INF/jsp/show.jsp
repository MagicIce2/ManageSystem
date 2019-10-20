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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/bootstrap.min.css" />
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/data.js"></script>
    <script src="https://cdn.bootcss.com/marked/0.6.2/marked.js"></script>
    <script src="https://cdn.bootcss.com/marked/0.6.2/marked.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Bootstrap3/js/bootstrap.min.js"></script>
</head>
<%@ include file="header.jsp"%>
<body class="container">
<script>
    $.get("${pageContext.request.contextPath}/${fileCourse.fileUrl}", function (response, status, xhr) {
        $(".configContent").html(marked(response));
    })
</script>
    <%--<%@ include file="computerbase.html"%>--%>
    <%--<jsp:include page="computerbase.html" flush="true"/>--%>
    <h3>${fileCourse.fileName}</h3>
    <div class="configContent"></div>
    <%--<script type="text/javascript">--%>
        <%--$(document).ready(function () {--%>
            <%--$('.configContent').load('computerbase.html');--%>
        <%--});--%>
    <%--</script>--%>
</body>
</html>
