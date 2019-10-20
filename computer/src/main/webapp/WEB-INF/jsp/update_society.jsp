<%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2018/11/30
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>

    <title>修改信息</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/bootstrap.min.css" />
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/data.js"></script>
</head>

<body onload="addOption();changeOption();test();">
        <%--<%@ include file="header.jsp"%>--%>
        <div style="height:10px"></div>
        <div class="container">
            <font color="red">${requestScope.msg}</font>
            <form class="form-horizontal" action="${pageContext.request.contextPath}/jsp/update.action" method="post" name="form1" onsubmit="return checkinfo()">
                <input type="hidden" name="id" value='${requestScope.member.id}'/>
                <input type="hidden" name="oldNo" value="${requestScope.member.stuNo}"/>
                <div class="form-group">
                    <label for="nam" class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="nam" placeholder="请输入姓名" name="stuName" value='${requestScope.member.stuName}'>
                    </div>
                </div>

                <div class="form-group">
                    <label for="no" class="col-sm-2 control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="no" placeholder="请输入学号" name="stuNo" value='${requestScope.member.stuNo}'>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
                    <label class="col-sm-1">
                        <input type="radio" name="stuSex" <c:if test="${requestScope.member.stuSex eq '男'}">checked</c:if> value="男"> 男
                    </label>
                    <label class="col-sm-1">
                        <input type="radio" name="stuSex" <c:if test="${requestScope.member.stuSex eq '女'}">checked</c:if> value="女" />女
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
                    <label for="phone" class="col-sm-2 control-label">联系方式</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="phone" placeholder="请输入手机号" name="stuPhone" value='${requestScope.member.stuPhone}'>
                    </div>
                </div>

                <div class="form-group">
                    <label for="qq" class="col-sm-2 control-label">Q&nbsp;&nbsp;Q</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="qq" placeholder="请输入QQ号" name="stuQQ" value='${requestScope.member.stuQQ}'>
                    </div>
                </div>

                <div class="form-group">
                    <label for="pass" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="pass" placeholder="请需要修改的密码" name="stuPassword" value='${requestScope.member.stuPassword}'>
                    </div>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-info col-xs-3 col-xs-offset-2">提交修改</button>
                    <button type="reset" class="btn btn-warning col-xs-3 col-xs-offset-2">重置</button>
                </div>
            </form>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/Bootstrap3/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/star.js"></script>
        <script>
            function checkinfo(){
                if(form1.stuName.value.length == 0){
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
        </script>
    </body>
</html>
