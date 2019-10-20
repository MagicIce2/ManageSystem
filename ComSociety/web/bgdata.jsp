<%@ page import="java.util.List" %>
<%@ page import="com.SignSystem.domain.Student" %><%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2018/10/16
  Time: 7:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>签到系统</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <link rel="stylesheet" href="Bootstrap3/css/bootstrap.min.css" />
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="lib/data.js"></script>
</head>
<body onload="test()" class="container">
    <%
        String title = "\t\t\t\t\t\t\t\t\t " + "证  明" + "\r\n\t" ;
        String head = "兹因计算机社团举办活动需要，时间：（19:00~20:30），地点（二教414），故";
        String tile = "不能正常出勤晚自习，因此给贵部工作带来不便，敬请谅解，并给予销假。\r\n\t特此证明！";
    %><br/><br/>
    <form action="export.pi" method="post" name="form2">
        <input type="hidden" value="<%=title%>" name="title">
        <input type="hidden" value="<%=head%>" name="head">
        <input type="hidden" value="<%=tile%>" name="tile">
        <div class="row">
            <div class="form-group col-sm-3">
                <label class="col-sm-3 control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院</label>
                <div class="col-sm-9">
                    <select class="form-control" id="da" name="stuDepart"></select>
                </div>
            </div>
            <div class="col-sm-2"><input type="submit" value="导出数据" name="query" class="form-control"></div>
            <div class="col-sm-2"><input type="submit" value="查看数据" name="query" class="form-control"></div>
            <div class="col-sm-2"><input type="submit" value="清除数据" name="query" class="form-control clear"></div>
        </div>
    </form>
    <%
        List<Student> students = (List<Student>)request.getAttribute("students");
        if(students != null && students.size() > 0){
    %>
    <br/><br/>
        <table class="table table-bordered table-responsive">
            <tr>
                <th>学院</th>
                <th>班级</th>
                <th>姓名</th>
                <th>删除</th>
            </tr>
            <%
                for(Student student: students){
            %>
            <tr>
                <td><%= student.getStuDepart()%></td>
                <td><%= student.getStuClass()%></td>
                <td><%= student.getStuName()%></td>
                <td><a href="delete.pi?id=<%= student.getId() %>" class="delete">删除</a></td>
            </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>
    <script src="lib/jquery-3.3.1.min.js"></script>
    <script src="Bootstrap3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="lib/star.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".delete").click(function () {
                var content = $(this).parent().parent().find("td:eq(2)").text();
                var flag = confirm("确定要删除"+ content +"的信息吗？");
                return flag;
            });
        })
        $(function () {
            $(".clear").click(function () {
                return confirm("确定要清空数据库吗?");
            })
        })
    </script>
</body>
</html>
