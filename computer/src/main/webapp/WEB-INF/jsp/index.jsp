<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 28761
  Date: 2018/11/29
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>

    <title>计算机社团</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/user-defined.css" />

    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"56193",secure:"56198"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body style="background-color:white; margin-top: 71px;">
<%@ include file="header.jsp"%>
<div data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-11" data-genuitec-path="/firstweb/WebRoot/index.jsp">
    <div style="background:url(${pageContext.request.contextPath}/img/huiheng.jpg) repeat-x;margin-top:-20px;" class="hidden-xs container" >
        <img src="${pageContext.request.contextPath}/img/banner.jpg" class="img-rounded img-responsive">
    </div>
    <div class="visible-xs-block" style="margin-top:-20px;">
        <img alt="" src="${pageContext.request.contextPath}/img/haibao.jpg" class="img-rounded img-responsive">
    </div>
    <div class="container">
        <div style="height:50px; width:160px;"><h2 class="alert alert-danger" >社团活动</h2></div>
        <div class="row">
            <s:iterator value="indexInfos" var="indexinfo">
                <div class="col-sm-3">
                    <div class="alert alert-info">
                        <h3><s:property value="#indexinfo.title"/></h3>
                        <p>
                            <s:property value="#indexinfo.content"/>
                        </p>
                    </div>
                </div>
            </s:iterator>
        </div>
    </div>
    <div class="container">
        <div class="alert alert-info">
            <div style="height:70px; width:160px; margin-left:6.4%;">
                <h3 class="alert alert-danger" >走进计算机</h3>
            </div>
            <div class="row">
                <div class="col-sm-3 col-sm-offset-1">
                    <a href="https://dumall.baidu.com/speaker1">
                        <img src="${pageContext.request.contextPath}/img/xiaodu.jpg" class="img-rounded img-responsive">
                    </a>
                    <a href="https://dumall.baidu.com/speaker1"><h4 style="margin-left:18%;margin-top:10px;">小度智能音箱</h4></a>
                </div>

                <div class="col-sm-3 col-sm-offset-1">
                    <a href="https://m.zol.com.cn/mb/?qq-pf-to=pcqq.group">
                        <img src="${pageContext.request.contextPath}/img/zhuban.jpg" class="img-rounded img-responsive">
                    </a>
                    <a href="https://m.zol.com.cn/mb/?qq-pf-to=pcqq.group"><h4 style="margin-left:18%;margin-top:10px;">电脑主板</h4></a>
                </div>

                <div class="col-sm-3 col-sm-offset-1">
                    <a href="http://bbs.eeworld.com.cn/thread-502655-1-1.html">
                        <img src="${pageContext.request.contextPath}/img/guanglifang.jpg" class="img-rounded img-responsive">
                    </a>
                    <a href="http://bbs.eeworld.com.cn/thread-502655-1-1.html"><h4 style="margin-left:18%;margin-top:10px;">RGB七彩光立方</h4></a>
                </div>
            </div>
        </div>
    </div>

    <div class="container alert alert-success">
        <div class="row">
            <div style="text-align:center"><h2>社团简介</h2></div>
            <div class="alert alert-waring" style="padding:0px 5%;">
                <p style="text-indent:2em">计算机社团成立于2003年，是信息工程学院一个专业性的社团。中间造就了很多人才，同时还汇集了很多对计算机有兴趣的人，形成了一个很大的体系，社团一直致力于普及计算机知识，锻炼计算机人才，培养动手能力，弘扬创新精神。以及专业技术能力的培养。
                </p>
            </div>
        </div>
    </div>

    <div class="container alert alert-info">
        <div class="row">
            <div style="text-align:center"><h2>联系我们</h2></div>
            <div style="margin-left:40px;">
                <ul class="nav">
                    <li> <span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span> 18236328020</li>
                    <li> <span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 2038165118</li>
                    <li> <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> 2038165118@qq.com</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="visible-xs-block" style="margin-bottom:100px;">
        <a href="register.jsp">
            <button class="btn btn-info col-xs-3 col-xs-offset-4" style="margin-top:30px;">加入我们</button>
        </a>
    </div>

</div>
<%@ include file="footer.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/Bootstrap3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/star.js"></script>
</body>
</html>

