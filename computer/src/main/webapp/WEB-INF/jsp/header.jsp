<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%--<c:set var="path" value="${pageContext.request.contextPath}"/>--%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
  		<nav class="navbar navbar-inverse navbar-static-top bs-docs-nav navbar-fixed-top">
			<div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/index"><strong>计算机社团</strong></a>
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle " data-toggle="collapse" data-target="#divNav">

                        <!---   navbar-toggle:【触发】按钮，会有下拉导航    data-toggle:交替执行某动作，collapse:展开和收缩
                              data-target:目标对象(自己定义一个名字-->

                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <!--按钮里的内容,三条横杠-->
                    </button>
                </div>
                <div id="divNav" class="collapse nav-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}/jsp/resource">资源下载</a></li>
                        <li><a href="${pageContext.request.contextPath}/jsp/memberIntroduction">成员简介</a></li>
                        <li><a href="${pageContext.request.contextPath}/jsp/computerBase">计算机基础</a></li>
                        <li><a href="${pageContext.request.contextPath}/jsp/blogCourse">文件教程</a></li>
                        <li><a href="https://720yun.com/t/2f825mfkmuf?scene_id=492960">校园3D游</a></li>
                    </ul>
                    <div  class="navbar-right">
                        <ul class="nav navbar-nav">
                           <c:if test="${empty sessionScope.username}">
                                <li><a href="${pageContext.request.contextPath}/jsp/register">注册</a></li>
                                <li><a href="${pageContext.request.contextPath}/jsp/login">登录</a></li>
                           </c:if>
                            <li><c:if test="${sessionScope.username ne 'admin'}"><a href="#">${sessionScope.username}</a></c:if></li>
                            <li><c:if test="${sessionScope.username eq 'admin'}"><a href="${pageContext.request.contextPath}/jsp/admin.action">进入后台</a></c:if></li>
                        </ul>
                    </div>
                </div>
                <div class="hidden-xs">
					<ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}/jsp/resource">资源下载</a></li>
                        <li><a href="${pageContext.request.contextPath}/jsp/memberIntroduction">成员简介</a></li>
                        <li><a href="${pageContext.request.contextPath}/jsp/computerBase">计算机基础</a></li>
                        <li><a href="${pageContext.request.contextPath}/jsp/blogCourse">文件教程</a></li>
						<li><a href="https://720yun.com/t/2f825mfkmuf?scene_id=492960">校园3D游</a></li>
					</ul>
					<div  class="navbar-right">
						<ul class="nav navbar-nav">
                            <c:if test="${empty sessionScope.username}">
                                <li><a href="${pageContext.request.contextPath}/jsp/register">注册</a></li>
                                <li><a href="${pageContext.request.contextPath}/jsp/login">登录</a></li>
                            </c:if>
                            <li><c:if test="${sessionScope.username ne 'admin'}"><a href="#">${sessionScope.username}</a></c:if></li>
                            <li><c:if test="${sessionScope.username eq 'admin'}"><a href="${pageContext.request.contextPath}/jsp/admin.action">进入后台</a></c:if></li>
                        </ul>
					</div>
				</div>
			</div>
		</nav>


