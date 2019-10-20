<%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2018/10/15
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/bootstrap.min.css" />
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/data.js"></script>
</head>
<body>
    <%@ include file="SignHeader.jsp"%>
    <div style="height:10px"></div>
    <div class="alert alert-warning"><h1>签到成功！你的签到信息如下，如有错误，请尽快联系社团工作人员！</h1></div>
    <div class="alert alert-info"><h3>
        学院：${studentSignModel.stuDepart}<br/>
        班级：${studentSignModel.stuClass}<br/>
        姓名：${studentSignModel.stuName}<br/>
    </h3>
    </div>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/Bootstrap3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/star.js"></script>
</body>
</html>
