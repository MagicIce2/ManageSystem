<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h3>资源管理</h3>
    </div>
    <div class="row adminresourceleft">
        <div class="col-sm-2 "><button class="btn btn-primary" data-toggle="modal" data-target="#resourceAddDialog">添加资源</button></div>
    </div>
    <div class="container">
        <c:if test="${not empty resources}">
        <table class="table table-striped" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-5" data-genuitec-path="/firstweb/WebRoot/Resource.jsp">
            <thead>
            <tr>
                <th>名称</th>
                <th>提取码</th>
                <th>日期</th>
                <%--<th>修改</th>--%>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${resources}" var="resource">
                <c:if test="${not resource.del}">
                    <tr>
                        <td><a href="${resource.link}">${resource.title}</a></td>
                        <td>提取码：${resource.pass}</td>
                        <td>${resource.date}</td>
                        <%--<td><a>修改</a></td>--%>
                        <td><a href="#" onclick="resource_delete(${resource.id})">删除</a></td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
        </c:if>
    </div>
    <!-- 客户编辑对话框 -->
    <div class="modal fade" id="resourceAddDialog" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">添加资源信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="add_resource_form">
                        <input type="hidden" id="edit_cust_id" name="cust_id"/>
                        <div class="form-group">
                            <label for="add_resourceName" class="col-sm-2 control-label">资源名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_resourceName" placeholder="资源名称" name="title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add_resourceLink" style="float:left;padding:7px 15px 0 27px;">资源链接</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_resourceLink" placeholder="资源链接" name="link">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="save()">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
<script>
    function save(){
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/jsp/resource_save.action",
            data: $("#add_resource_form").serialize(),
            success:function (data) {
                if (data){
                    $("#resourceAddDialog").modal('hide');
                    // $("#add_resource_form")[0].reset();
                    alert("添加成功");
                    window.location.href = "${pageContext.request.contextPath}/jsp/resourceAdmin.action";
                }else{
                    alert("添加失败");
                }
            }
        })
    }

    function  resource_delete(id){
        if(confirm('确实要删除该资源吗？')){
            $.post("${pageContext.request.contextPath}/jsp/resource_delete.action", {"id":id}, function (data) {
                if (data.eq("success")){
                    alert("删除成功！");
                    window.location.reload();
                }else{
                    alert("删除失败！");
                }
            })
        }
    }
</script>
</body>
</html>
