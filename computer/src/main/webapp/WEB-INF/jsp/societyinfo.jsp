<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2018/11/30
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
    <title>社团成员信息</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/bootstrap.min.css" />
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/data.js"></script>
</head>

<body>
    <div class="row">
        <form action="member_findAll.action" method="post">
            <div class="col-sm-2 "><label>学院</label><input type="text" name="stuDepart" class="form-control"></div>
            <div class="col-sm-2"><label>班级</label><input type="text" name="stuClass" class="form-control"></div>
            <div class="col-sm-2"><label>学号</label><input type="text" name="stuNo" class="form-control"></div>
            <div class="col-sm-2"><label>姓名</label><input type="text" name="stuName" class="form-control"></div>
            <div class="col-sm-2"><label>手机号</label><input type="text" name="stuPhone" class="form-control"></div>
            <div class="col-sm-2"><label>性别</label><input type="text" name="stuSex" class="form-control"></div>
            <div class="col-sm-2"><label>QQ</label><input type="text" name="stuQQ" class="form-control"></div>
            <div class="col-sm-2"><label>缴费</label><input type="text" name="money" class="form-control"></div>
            <div class="col-sm-2"><h2><input type="submit" value="查询" class="form-control" name = "export"></h2></div>
            <div class="col-sm-2"><h2><button id="js-export" type="button" class="btn btn-primary form-control">导出数据</button></h2></div>
        </form>
    </div>
    <c:if test="${not empty requestScope.members}">
    <table class="table table-bordered table-responsive">
        <tr><td colspan="12" align="center">社团注册成员为${sessionScope.size}人</td></tr>
        <tr>
            <th>序号</th>
            <th>学院</th>
            <th>班级</th>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>手机号</th>
            <th>是否已缴费</th>
            <th>修改</th>
            <th>删除</th>
        </tr>
    </c:if>
    <c:forEach items="${ requestScope.members}" var="member">
        <c:if test="${not member.del}">
            <tr>
                <td>${member.id}</td>
                <td>${member.stuDepart}</td>
                <td>${member.stuClass}</td>
                <td>${member.stuNo}</td>
                <td>${member.stuName}</td>
                <td>${member.stuSex}</td>
                <td>${member.stuPhone}</td>
                <td><c:if test="${member.money == 1}">已缴费</c:if><c:if test="${member.money == 0}">未缴费</c:if></td>
                <td><a class="btn btn-primary btn-xs" href="member_edit?id=${member.id}">修改</a></td>
                <td><a href="javascript:;" class="delete" onclick="delete_data(this)">删除</a></td>
            </tr>
        </c:if>
    </c:forEach>
    </table>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Bootstrap3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/star.js"></script>
<script type="text/javascript">
    function delete_data(obj){
        var xmlHttp;
        if(window.XMLHttpRequest){
            xmlHttp=new XMLHttpRequest();
        }else{
            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (x(obj)){
            var id = $(obj).parent().parent().find("td:eq(0)").text();
            xmlHttp.open("GET", "member_delete.action?id=" + id, true);
            //xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttp.send();
            //ajax 删除数据，获取行，
            var tr = obj.parentNode.parentNode;
            //tr.parentNode.removeChild(tr);
            xmlHttp.onreadystatechange=function() {
                if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                    //alert(this.text());
                    //var tr = obj.parentNode.parentNode;
                    //获取表格中的第一行，改变人数
                    var title = $(tr).parent().children("tr:eq(0)").children();
                    var text = $(title).text().replace(/[^0-9]/ig,"");
                    var num = parseInt(text);
                    num--;
                    text = "社团注册成员为" + num + "人";
                    $(title).text(text);
                    tr.parentNode.removeChild(tr);
                    //console.log(xmlHttp.responseText);
                    //alert(xmlHttp.responseText);
                }
            }
        }
        function x(obj) {
            var content = $(obj).parent().parent().find("td:eq(4)").text();
            var flag = confirm("确定要删除"+ content +"的信息吗？");
            return flag;
        }
    };


    $('#js-export').click(function(){
        window.location.href="member_exportExcel.action";
    });
</script>
</body>
</html>
