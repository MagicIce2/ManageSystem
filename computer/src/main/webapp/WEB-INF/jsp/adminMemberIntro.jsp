<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2019/6/19
  Time: 16:16
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
<div style="height: 30px;" class="adminresourceleft">
    <h3>成员简介管理</h3>
</div>
<div class="row adminresourceleft">
    <div class="col-sm-2 "><button class="btn btn-primary" data-toggle="modal" data-target="#memberIntroAddDialog">添加成员简介</button></div>
</div>
<div class="container">
    <c:if test="${not empty memberIntros}">
        <table class="table table-striped center-block" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-5" data-genuitec-path="/firstweb/WebRoot/Resource.jsp">
            <thead>
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>学院</th>
                <th>专业</th>
                <th>班级</th>
                <th>职务</th>
                <th>简介</th>
                <th>格言</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${memberIntros}" var="memberIntro">
                <c:if test="${not memberIntro.del}">
                    <tr>
                        <td>${memberIntro.staffId}</td>
                        <td>${memberIntro.staffName}</td>
                        <td>${memberIntro.staffDepart}</td>
                        <td>${memberIntro.staffProfession}</td>
                        <td>${memberIntro.staffClass}</td>
                        <td>${memberIntro.staffDuty}</td>
                        <td>${memberIntro.staffIntroduce}</td>
                        <td>${memberIntro.staffMotto}</td>
                        <td>
                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#memberIntroEditDialog" onclick="memberIntro_update(${memberIntro.staffId})">修改</a><br/>
                            <a href="#" class="btn btn-primary btn-xs" onclick="memberIntro_delete(${memberIntro.staffId})">删除</a>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<!-- 添加成员简介对话框 -->
<div class="modal fade" id="memberIntroAddDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加简介信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="add_memberIntro_form" enctype="multipart/form-data" action="${pageContext.request.contextPath}/jsp/memberIntro_save.action"">
                    <div class="form-group">
                        <label for="staffNameadd" class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="staffNameadd" placeholder="请输入姓名" name="staffName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="staffDepartadd" class="col-sm-2 control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="staffDepartadd" name="staffDepart" onchange="firstSel()">
                                <c:forEach items="${departments}" var="department">
                                    <option value="${department.id}">${department.departName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="staffProfessionadd" class="col-sm-2 control-label">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="staffProfessionadd" placeholder="请输入专业" name="staffProfession">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="staffClassadd" class="col-sm-2 control-label">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="staffClassadd" name="staffClass"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="staffDutyadd" class="col-sm-2 control-label">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="staffDutyadd" name="staffDuty">
                                <c:forEach items="${duties}" var="duty">
                                    <option value="${duty.dutyName}">${duty.dutyName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="staffIntroduceadd" class="col-sm-2 control-label">简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="staffIntroduceadd" placeholder="请输入简介" name="staffIntroduce">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="staffMottoadd" class="col-sm-2 control-label">格&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;言</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="staffMottoadd" placeholder="请输入格言" name="staffMotto">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片</label>
                        <div class="col-sm-10">
                            <input type="file" placeholder="请上传照片" name="staffPicture">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">添加</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 成员简介编辑对话框 -->
<div class="modal fade" id="memberIntroEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改简介信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="memberIntroUpdateForm">
                    <input type="hidden" name="staffId" id="staffId">
                    <div class="form-group">
                        <label for="staffName" class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="staffName" placeholder="请输入姓名" name="staffName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="staffDepart" name="staffDepart" onchange="firstSel2()">
                                <c:forEach items="${departments}" var="department">
                                    <option value="${department.id}">${department.departName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="staffProfession" class="col-sm-2 control-label">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="staffProfession" placeholder="请输入专业" name="staffProfession">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="staffClass" name="staffClass"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="staffDuty" class="col-sm-2 control-label">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="staffDuty" name="staffDuty">
                                <c:forEach items="${duties}" var="duty">
                                    <option value="${duty.dutyName}">${duty.dutyName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="staffIntroduce" class="col-sm-2 control-label">简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="staffIntroduce" placeholder="请输入简介" name="staffIntroduce">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="staffMotto" class="col-sm-2 control-label">格&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;言</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="staffMotto" placeholder="请输入格言" name="staffMotto">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="update()">保存修改</button>
            </div>
        </div>
    </div>
</div>
<script>
    function memberIntro_save() {
        $.post("${pageContext.request.contextPath}/jsp/memberIntro_save.action",$("#add_memberIntro_form").serialize(), function (data) {
            if (data){
                $("#add_memberIntro_form").modal('hide');
                alert("添加成功！");
                window.location.href = "${pageContext.request.contextPath}/jsp/memberIntroAdmin.action";
            }else{
                alert("添加失败！");
            }
        });
    }
    
    function memberIntro_update(id) {
        $.post("${pageContext.request.contextPath}/jsp/memberIntro_getById.action", {"staffId":id}, function (data) {
            $("#staffId").val(data.staffId);
            $("#staffName").val(data.staffName);
            $("#staffDepart").val(data.staffDepart);
            $("#staffProfession").val(data.staffProfession);
            $("#staffClass").val(data.staffClass);
            $("#staffDuty").val(data.staffDuty);
            $("#staffIntroduce").val(data.staffIntroduce);
            $("#staffMotto").val(data.staffMotto);
        })
    }

    function memberIntro_delete(id) {
        if (confirm("确定要删除吗？")){
            $.post("${pageContext.request.contextPath}/jsp/memberIntro_delete.action", {"staffId":id}, function (data) {
               if (data){
                   alert("删除成功！");
                   window.location.href = "${pageContext.request.contextPath}/jsp/memberIntroAdmin.action";
               }else{
                   alert("删除失败！");
               }
            });
        }
    }

    function update() {
        $.post("${pageContext.request.contextPath}/jsp/memberIntro_update.action",$("#memberIntroUpdateForm").serialize(), function (data) {
            if (data){
                $("#memberIntroUpdateForm").modal('hide');
                alert("修改成功！");
                window.location.href = "${pageContext.request.contextPath}/jsp/memberIntroAdmin.action";
            }else{
                alert("修改失败！");
            }
        })
    }

    $(function () {
        firstSel();
        firstSel2();
    })

    function firstSel() {
        var departId = $("#staffDepartadd").val();
        if (departId != null && "" != departId){
            $.post("${pageContext.request.contextPath}/jsp/gradeByDepart.action", {"id":departId}, function (data) {
                // var res = $.parseJSON(data);
                var option;
                $.each(data, function (i, n) {
                    option += "<option value='" + n.id + "'>" + n.className + "</option>"
                })
                // console.log(option);
                $("#staffClassadd").html(option);
                $("#staffClassadd").show();
            })
        }else {
            $("#staffClassadd").hide();
        }
    }

    function firstSel2() {
        var departId = $("#staffDepart").val();
        if (departId != null && "" != departId){
            $.post("${pageContext.request.contextPath}/jsp/gradeByDepart.action", {"id":departId}, function (data) {
                // var res = $.parseJSON(data);
                var option;
                $.each(data, function (i, n) {
                    option += "<option value='" + n.id + "'>" + n.className + "</option>"
                })
                // console.log(option);
                $("#staffClass").html(option);
                $("#staffClass").show();
            })
        }else {
            $("#staffClass").hide();
        }
    }
</script>
</body>
</html>
