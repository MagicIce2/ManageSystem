<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2019/6/22
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/user-defined.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/adminiframe.css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/Bootstrap3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/star.js"></script>
    <title>Title</title>
</head>
<body>
<div class="container">
    <div>
        <form method="post" action="${pageContext.request.contextPath}/jsp/fileSave.action" enctype="multipart/form-data">
            <label>文件教程上传</label>
            <input type="file" class="admin-content-file" name="mdfile"/>
            <input type="submit" class="btn btn-primary" value="上传">
        </form>
    </div>
    <c:if test="${not empty fileCourses}">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>名称</th>
                <th>位置</th>
                <th>上传者</th>
                <th>上传时间</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${fileCourses}" var="fileCourse">
                <c:if test="${not fileCourse.del}">
                    <tr>
                        <td><a href="#">${fileCourse.fileName}</a></td>
                        <td>${fileCourse.fileUrl}</td>
                        <td>${fileCourse.createdBy}</td>
                        <td>${fileCourse.createdTime}</td>
                        <td><a href="#" onclick="deleteById(${fileCourse.id})">删除</a></td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
<script>
    function deleteById(id) {
        window.location.href = "${pageContext.request.contextPath}/jsp/admin_delete?id=" + id;
    }
</script>
</body>
</html>
