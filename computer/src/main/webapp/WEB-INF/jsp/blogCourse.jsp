<%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2019/6/22
  Time: 14:37
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
<%@ include file="header.jsp"%>
<body>
    <div class="container">
    <c:if test="${not empty fileCourses}">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>名称</th>
                    <th>上传者</th>
                    <th>日期</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${fileCourses}" var="fileCourse">
                    <c:if test="${not fileCourse.del}">
                        <tr>
                            <td><a href="#" onclick="showDetail(${fileCourse.id})">${fileCourse.fileName}</a></td>
                            <td>${member.stuName}</td>
                            <td>${fileCourse.createdTime}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    </div>
<script>
    function showDetail(id) {
       window.location.href = "${pageContext.request.contextPath}/jsp/getById.action?id="+id;
    }
</script>
</body>
</html>
