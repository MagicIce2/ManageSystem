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
    <title>后台管理</title>
    <style type="text/css">
        .iframeLeft{
            height: 750px;
            width: 15%;
            float: left;
        }
        .iframeRight{
            height: 750px;
            width: 84%;
            padding: 20px;
            float: right;
        }
    </style>
</head>
<body>
    <div>
        <%@ include file="header.jsp"%>
    </div>
    <div style="margin-top: -25px;">
        <iframe src="adminleft" class="iframeLeft" frameborder="0" marginheight="0" marginwidth="0"></iframe>
        <iframe src="member_findAll" class="iframeRight" name="iframe_content"
                frameborder="0" scrolling="auto" marginheight="0" marginwidth="0"></iframe>
    </div>
</body>
</html>