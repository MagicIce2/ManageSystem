<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2019/6/19
  Time: 16:15
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
    <h3>主页信息管理</h3>
</div>
<div class="container">
    <c:if test="${not empty indexInfos}">
        <table class="table table-striped center-block" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-5" data-genuitec-path="/firstweb/WebRoot/Resource.jsp">
            <thead>
            <tr>
                <th>序号</th>
                <th>标题</th>
                <th>内容</th>
                    <%--<th>修改</th>--%>
                <th>修改</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${indexInfos}" var="indexInfo">
                <tr>
                    <td>${indexInfo.id}</td>
                    <td>${indexInfo.title}</td>
                    <td>${indexInfo.content}</td>
                        <%--<td><a>修改</a></td>--%>
                    <td><a href="#" class="btn btn-primary btn-xs" onclick="indexInfo_update(${indexInfo.id})" data-toggle="modal" data-target="#indexInfoEditDialog">修改</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
<!-- 主页编辑对话框 -->
<div class="modal fade" id="indexInfoEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改主页信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_indexInfo_form">
                    <input type="hidden" name="id" id="id">
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="title" placeholder="请输入标题" name="title">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="content" class="col-sm-2 control-label">内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="content" placeholder="请输入内容" name="content">
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
    function indexInfo_update(id) {
        $.ajax({
          type: "post",
          url: "${pageContext.request.contextPath}/jsp/indexInfo_getById.action",
          data: {"id":id},
          success: function (data) {
              $("#id").val(data.id);
              $("#title").val(data.title);
              $("#content").val(data.content);
          }  
        })
    }
    
    function update() {
        $.post("${pageContext.request.contextPath}/jsp/indexInfo_update.action", $("#edit_indexInfo_form").serialize(), function (data) {
            if(data){
                $("#resourceAddDialog").modal('hide');
                alert("主页信息更新成功！");
                window.location.reload();
            }else{
                alert("主页信息更新失败！");
            }
        });
    }
</script>
</body>
</html>
