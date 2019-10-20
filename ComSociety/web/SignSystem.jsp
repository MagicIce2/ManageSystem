<%@ page import="com.SignSystem.session.MySessionContext" %><%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2018/10/14
  Time: 22:08
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

<body onload="addOption();changeOption();test();">
<%@ include file="header.jsp"%>
<div style="height:10px"></div>
<div class="container">
    <%
        Object msg = request.getAttribute("message");
        if(msg != null){
    %>
    <br/>
    <font color="red"><%=msg%></font>
    <br/><br/>
    <%
        }
    %>
    <div class="alert alert-warning"><h2>请注意，填写的信息，必须是正确个人信息，如有错误，导致无法销假，后果自负！</h2></div>
    <form class="form-horizontal" action="append.pi" method="post" name="form1" onsubmit="return checkinfo()">
        <div class="form-group">
            <label for="nam" class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="nam" placeholder="请输入姓名" name="stuName" value='<%=request.getParameter("stuName") == null ? "" : request.getParameter("stuName") %>'>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院</label>
            <div class="col-sm-2">
                <select class="form-control" id="da" name="stuDepart"></select>
            </div>
            <label class="col-sm-2 control-label">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</label>
            <div class="col-sm-2">
                <select class="form-control" id="xiao" name="stuClass"></select>
            </div>
        </div>

        <div class="form-group" style="display:none">
            <label class="col-xs-1 control-label col-sm-2">出生日期</label>
            <div class="col-xs-10">
                <div class="col-xs-10">
                    <select class="form-control" name="year" id="year" size="1" onchange="changeOption()">
                        <option></option>
                    </select>
                </div>
                <div class="col-xs-2">年</div>
                <div class="col-xs-10">
                    <select class="form-control" name="mounth" id="month" size="1" onchange="changeOption()">
                        <option></option>
                    </select>
                </div>
                <div class="col-xs-2">月</div>
                <div class="col-xs-10">
                    <select class="form-control" name="day" id="day" size="1">
                        <option></option>
                    </select>
                </div>
                <div class="col-xs-2">日</div>
            </div>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-info col-xs-3 col-xs-offset-2">立即签到</button>
            <button type="reset" class="btn btn-warning col-xs-3 col-xs-offset-2">重置</button>
        </div>
    </form>
    <%
        Cookie [] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0){
            for(Cookie c: cookies){
                if (c.getName().equals("StuInfo")){
                    MySessionContext mySessionContext = MySessionContext.getInstance();
                    HttpSession session1 = mySessionContext.getSession(c.getValue());
                    if(session1 != null) {
                        if (session1.getAttribute("stuName") != null && session1.getAttribute("stuClass") != null){
                            request.getRequestDispatcher("success.jsp").forward(request, response);
                        }
                    }
                }
            }
        }
    %>
</div>
<script src="lib/jquery-3.3.1.min.js"></script>
<script src="Bootstrap3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/star.js"></script>
<script>
    function checkinfo(){
        if(form1.stuName.value.length == 0){
            alert("姓名不能为空!");
            return false;
        }
    };
</script>
</body>
</html>
