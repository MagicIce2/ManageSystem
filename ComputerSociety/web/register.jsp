<%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2018/11/29
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>计算机社团</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <link rel="stylesheet" href="Bootstrap3/css/bootstrap.min.css" />
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="static/js/data.js"></script>
    <script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"56193",secure:"56198"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body onload="addOption();changeOption();test();" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-14" data-genuitec-path="/firstweb/WebRoot/register.jsp">
<%@ include file="header.jsp"%>
<div style="height:10px" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-14" data-genuitec-path="/firstweb/WebRoot/register.jsp"></div>
<div class="container">
    <c:if test="${not empty requestScope.message}">
        <div class="alert alert-warning">${requestScope.message}</div>
    </c:if>
    <form class="form-horizontal" action="append.cd" method="post" name="form1" onsubmit="return checkinfo()">
        <div class="form-group">
            <label for="No" class="col-sm-2 control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="No" placeholder="请输入学号" name="stuNo" value="${param.stuNo}" onblur="checkedNo()">
            </div>
        </div>

        <div class="form-group">
            <label for="pass" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="pass" placeholder="请设置你的登录密码" name="stuPassword" value="${param.stuPassword}">
            </div>
        </div>

        <div class="form-group">
            <label for="conpass" class="col-sm-2 control-label">确认密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="conpass" placeholder="请确认你的登录密码" name="conPassword" value="${param.conPassword}" onblur="conPass()">
            </div>
        </div>

        <div class="form-group">
            <label for="nam" class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="nam" placeholder="请输入姓名" name="stuName" value="${param.stuName}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
            <label class="col-sm-1">
                <input type="radio" name="stuSex" <c:if test="${param.stuSex eq '男'}">checked</c:if> value="男"> 男
            </label>
            <label class="col-sm-1">
                <input type="radio" name="stuSex" <c:if test="${param.stuSex eq '男'}">checked</c:if> value="女"> 女
            </label>
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

        <div class="form-group">
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
            <label for="phone" class="col-sm-2 control-label">联系方式</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="phone" placeholder="请输入手机号" name="stuPhone" value="${param.stuPhone}">
            </div>
        </div>

        <div class="form-group">
            <label for="qq" class="col-sm-2 control-label">Q&nbsp;&nbsp;Q</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="qq" placeholder="请输入QQ号" name="stuQQ" value="${param.stuQQ}">
            </div>
        </div>
        <div class="form-group">
            <label for="me" class="col-sm-2 control-label">自我介绍</label>
            <div class="col-sm-10">
                <textarea id="me" class="form-control" rows="3" name="stuMe" placeholder="请输入自我介绍和你想学习的知识" value="${param.stuMe}"></textarea>
            </div>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-info col-xs-3 col-xs-offset-2">注册</button>
            <button type="reset" class="btn btn-warning col-xs-3 col-xs-offset-2">重置</button>
        </div>
    </form>
</div>
<%@ include file="footer.jsp"%>
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="Bootstrap3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/star.js"></script>
<script>
    function checkinfo(){
        if(form1.stuNo.value.length == 0){
            alert("学号不能为空!");
            return false;
        }else if(form1.stuPassword.value.length == 0){
            alert("密码不能为空!");
            return false;
        }else if(form1.stuName.value.length == 0){
            alert("姓名不能为空!");
            return false;
        }else if(form1.stuPhone.value.length == 0 || form1.stuPhone.value == ""){
            alert("手机号不能为空!");
            return false;
        }else if(form1.stuQQ.value.length == 0 || form1.stuQQ.value == ""){
            alert("QQ号不能为空!");
            return false;
        }
    };
    function conPass(){
        var pass = document.form1.stuPassword.value;
        var conpass = document.form1.conPassword;
        if(pass != conpass.value){
            alert("两次输入的密码不一致!");
            conpass.foucs();
            return false;
        }
    };
</script>
</body>
</html>
