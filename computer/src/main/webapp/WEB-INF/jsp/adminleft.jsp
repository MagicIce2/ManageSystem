<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/user-defined.css" />
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/Bootstrap3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/star.js"></script>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body class="navbar-inverse">
    <ul class="center-block nav navbar-nav">
        <li><a href="member_findAll" target="iframe_content"><h4>注册管理</h4></a></li>
        <li><a href="signAdmin" target="iframe_content"><h4>签到管理</h4></a></li>
        <li><a href="indexAdmin" target="iframe_content"><h4>主页信息管理</h4></a></li>
        <li><a href="resourceAdmin" target="iframe_content"><h4>网盘资源管理</h4></a></li>
        <li><a href="adminFileCourse" target="iframe_content"><h4>文件教程管理</h4></a></li>
        <li><a href="memberIntroAdmin" target="iframe_content"><h4>成员简介管理</h4></a></li>
    </ul>
</body>
</html>