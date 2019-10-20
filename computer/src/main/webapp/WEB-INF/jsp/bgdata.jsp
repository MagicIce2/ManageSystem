<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2018/10/16
  Time: 7:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
    <title>签到系统</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/bootstrap.min.css" />
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/data.js"></script>
</head>
<body onload="test()">
<div class="container">
    <div style="height: 50px;"></div>
    <form name="sign_form" class="form-horizontal" id="sign_form" method="post" action="${pageContext.request.contextPath}/jsp/sign_findAll.action">
        <div class="row">
            <div class="form-group col-sm-4">
                <label class="col-sm-4 control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院</label>
                <div class="col-sm-8">
                    <select class="form-control" id="da" name="stuDepart"></select>
                </div>
            </div>
            <div class="col-sm-2"><a href="#" onclick="export_data()" class="form-control btn btn-primary btn-xs"><h6>导出数据</h6></a></div>
            <div class="col-sm-2"><button type="submit" class="form-control btn btn-primary btn-xs"><h6>查看数据</h6></button></div>
            <div class="col-sm-2"><a href="#" onclick="clear_data()" class="form-control btn btn-primary btn-xs"><h6>清除数据</h6></a></div>
            <div class="col-sm-2"><a href="#" data-toggle="modal" data-target="#signDialog" class="form-control btn-primary btn btn-xs"><h6>生成二维码</h6></a></div>
        </div>
    </form>
    <c:if test="${not empty requestScope.students}">
    <br/><br/>
        <table class="table table-bordered table-responsive">
            <tr>
                <th>学院</th>
                <th>班级</th>
                <th>姓名</th>
                <th>删除</th>
            </tr>
            </c:if>
            <c:forEach items="${ requestScope.students}" var="student">
            <tr>
                <td>${student.stuDepart}</td>
                <td>${student.stuClass}</td>
                <td>${student.stuName}</td>
                <td><a href="studentsign_delete.action?id=${student.id}" class="delete">删除</a></td>
            </tr>
            </c:forEach>
        </table>
</div>

<div class="modal fade" id="signDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <img src="/computer/img/1561029781.png" class="img-responsive img-rounded">
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/Bootstrap3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/star.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".delete").click(function () {
                var content = $(this).parent().parent().find("td:eq(2)").text();
                return confirm("确定要删除"+ content +"的信息吗？");
            });
        })

        function export_data() {
            window.open("studentSign_exportData.action?stuDepart=" + $("#da").val());
        }
        
        function clear_data() {
            $.post("${pageContext.request.contextPath}/jsp/sign_clear.action", {"stuDepart": $("#da").val()}, function (data) {
                if(data){
                    $(".table").remove();
                    alert("清空完成！");
                }else{
                    alert("清空失败！");
                }
            })
        }
    </script>
</body>
</html>
