<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>计算机社团</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Bootstrap3/css/bootstrap.min.css" />
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"56193",secure:"56198"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
  
  <body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-5" data-genuitec-path="/firstweb/WebRoot/Resource.jsp">
  	<%@ include file="header.jsp"%>
    <div class="container">
    <c:if test="${not empty resources}">
        <table class="table table-striped" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-5" data-genuitec-path="/firstweb/WebRoot/Resource.jsp">
		    <thead>
		    <tr>
		      	<th>名称</th>
		      	<th>提取码</th>
		      	<th>日期</th>
		    </tr>
		    </thead>
		    <tbody>
                <c:forEach items="${resources}" var="resource">
                    <c:if test="${not resource.del}">
                        <tr>
                            <td><a href="${resource.link}">${resource.title}</a></td>
                            <td>提取码：${resource.pass}</td>
                            <td>${resource.date}</td>
                        </tr>
                    </c:if>
                </c:forEach>
		  	</tbody>
		</table>
    </c:if>
    </div>
    <%@ include file="footer.jsp"%>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/Bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/star.js"></script>
  </body>
</html>
