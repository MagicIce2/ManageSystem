<%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2019/6/22
  Time: 12:57
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
    <title>${terminate.title}</title>
    <style type="text/css">
        .pstyle{
            text-indent:2em;
            line-height: 30px;
            font-size: 16px;
        }
        .hright{
            text-align: right;
        }
    </style>
</head>
<body class="container">
<h3 align="center">证明</h3>
<p class="pstyle">${terminate.head}${terminate.data}${terminate.footer}</p>
<p class="pstyle">特此证明！</p>
<h4 style="position: absolute; bottom: 60px; right: 10%;" class="hright">计算机社团</h4>
<h4 style="position: absolute; bottom: 30px; right: 10%;" class="hright">范宣宏</h4>
<h4 style="position: absolute; bottom: 0px; right: 10%;" id="dt" class="hright"></h4>
<script type="text/javascript">
    $(function () {
        var date = new Date();
        var  year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        $("#dt").html(year + "年" + month + "月" + day + "日" );
    })
</script>
</body>
</html>
