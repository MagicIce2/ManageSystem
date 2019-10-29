<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>计算机社团</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
	<link rel="stylesheet" href="Bootstrap3/css/bootstrap.min.css" />
	<link rel="stylesheet" href="Bootstrap3/css/user-defined.css" />
	<link rel="stylesheet" href="Bootstrap3/css/teachers.css">
	<script src="lib/jquery-1.7.2.min.js"></script>
	 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body style="background-color:#eee;">
  		<%@ include file="header.jsp"%>
  		<div style="background:url(img/huiheng.jpg) repeat-x;">
	  		<div style="background:url(img/huiheng.jpg) repeat-x;margin-top:-20px;" class="hidden-xs" >
				<div  class="teachers_banner">
				    <div class="clearfix teachers_b">
				        <div class="slide" id="slide">
				            <ul>
				                <li> <img src="img/banner.jpg" alt="" title=""> </li>
				                <li> <img src="img/banner1.jpg" alt="" title=""> </li>
				                <li> <img src="img/banner2.jpg" alt=""  title=""> </li>
				                <li> <img src="img/banner3.jpg" alt=""  title=""> </li>
				            </ul>
				            <div class="arrow">
				                <div class="prev"> < </div>
				                <div class="next"> > </div>
				            </div>
				        </div>
				    </div>
				</div>

	  		</div>
	  		<div class="visible-xs-block" style="margin-top:-20px;">
	  			<img alt="" src="img/haibao.jpg" class="img-rounded img-responsive">
	  		</div>
	  		<div class="container">
	  			<div style="height:50px; width:160px;"><h2 class="alert alert-danger" >社团活动</h2></div>
	  			<div class="row">
	  				<div class="col-sm-3">
		  				<div class="alert alert-info">
		  					<h3>义诊活动</h3>
		  					<p>	
		为传承中华助人为乐的精神，发扬雷锋精神，计算机社团面向全校学生提供一次义诊活动，可以维修一些常见的问题，并且可以安装一些学习的软件，同时还有还会讲解一些常见问题的解决方法		
		  					</p>
		  				</div>
	  				</div>
	  				<div class="col-sm-3">
		  				<div class="alert alert-info">
		  					<h3>硬件教程</h3>
		  					<p>	
		多一分了解，多一份收获，多了解一点硬件可以让你自己动手配置自己的电脑，告别理论，直接进行实践，不用担心学不会，就怕你没时间，而且还会有装机大赛，既能得到证书，还能可以体会其中的happyness。		
		  					</p>
		  				</div>
	  				</div>
	  				<div class="col-sm-3">
		  				<div class="alert alert-info">
		  					<h3>软件教程</h3>
		  					<p>	
		看一个人熟悉软件的程度可以看出他是小白还是大神，首先社团会教大家如何安装几种办公软件，并简单让大家了解软件的·使用方法。还有就是安装系统教程，保证你轻轻的来，满载而归。  					
							</p>
		  				</div>
	  				</div>
	  				<div class="col-sm-3">
		  				<div class="alert alert-info">
		  					<h3>前沿科技</h3>
		  					<p>	
		大数据，云计算，区块链，人工智能，AI最近几年很火，会有专门的人才向大家讲解现在技术的发展方向，将迷茫的你带回正轨，当然中间可以观看电影，让你看到未来的技术，说不定下一个工业革命就是因为你。
		  					</p>
		  				</div>
	  				</div>
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
		  						<img  src="img/xiaodu.jpg" class="img-rounded img-responsive">
		  					</a>
		  					<a href="https://dumall.baidu.com/speaker1"><h4 style="margin-left:18%;margin-top:10px;">小度智能音箱</h4></a>
		  				</div>
		  				
		  				<div class="col-sm-3 col-sm-offset-1">
		  					<a href="#">
		  						<img  src="img/zhuban.jpg" class="img-rounded img-responsive">
		  					</a>
		  					<a href="#"><h4 style="margin-left:18%;margin-top:10px;">电脑主板</h4></a>
		  				</div>
		  				
		  				<div class="col-sm-3 col-sm-offset-1">
		  					<a href="http://bbs.eeworld.com.cn/thread-502655-1-1.html">
		  						<img  src="img/guanglifang.jpg" class="img-rounded img-responsive">
		  					</a>
		  					<a href="http://bbs.eeworld.com.cn/thread-502655-1-1.html"><h4 style="margin-left:18%;margin-top:10px;">光立方</h4></a>
		  				</div>
		  			</div>
		  		</div>
	  		</div>
	  		
	  		<div class="container alert alert-success">
	  			<div class="row">
	  				<div style="text-align:center"><h2>社团简介</h2></div>
	  				<div class="alert alert-waring" style="padding:0px 5%;">
	  					<p style="text-indent:2em">计算机社团成立时间较早，是信息工程学院唯一一个专业性的社团。中间造就了很多人才，同时还汇集了很多对计算机有兴趣的人，形成了一个很大的体系，本着普及计算机知识，锻炼计算机人才，培养动手能力，弘扬创新精神。计算机社团作为信息工程学院代表性社团，有着专业型较强的社团，曾荣获2013-2014“十佳专业性社团”“2013-2014优秀社团”“2014-2015十佳明星社团”等诸多奖项
现在计算机向小糍粑们发出邀请，愿你们能加入我们，成为计算机社团家族中的一员。    
	  					</p>
	  				</div>
	  			</div>
	  			<hr/>
	  			<div class="row">
	  				<div style="text-align:center"><h2>友情链接</h2></div>
	  				<a class="col-sm-2 col-sm-offset-1" href="http://www.xyafu.edu.cn/"><img src="img/xyafu.png" style="width:30px;height:30px;">信阳农林学院</a>
	  				<a class="col-sm-2 col-sm-offset-1" href="http://211.67.160.200/jkx/"><img src="img/xyafu.png" style="width:30px;height:30px;">信息工程学院</a>
	  				<a class="col-sm-2 col-sm-offset-1" href="http://bbs.eeworld.com.cn/forum.php"><img src="img/bbs_ele.png" style="width:30px;height:30px;">电子工程世界</a>
	  				<a class="col-sm-2 col-sm-offset-1" href="http://glyphicons.com/"><img src="#" style="width:30px;height:30px;">图标</a>
	  				<a class="col-sm-2 col-sm-offset-1" href="http://www.java1234.com/"><img src="#" style="width:30px;height:30px;">Java</a>
	  				<a class="col-sm-2 col-sm-offset-1" href="http://www.enlern.com/"><img src="img/enlern.jpg" style="width:30px;height:30px;">上海因仑科技公司</a>
	  				<a class="col-sm-2 col-sm-offset-1" href="http://www.enlern.com/"><img src="img/kedaxunfei.jpg" style="width:30px;height:30px;">科大讯飞</a>
	  				<a class="col-sm-2 col-sm-offset-1" href="http://ai.baidu.com/"><img src="img/baidu.jpg" style="width:30px;height:30px;">百度人工智能</a>
	  				<a class="col-sm-2 col-sm-offset-1" href="http://www.javahelp.com.cn/"><img src="img/Javahelp.jpg" style="width:30px;height:30px;">Java帮帮</a>
	  			</div>
	  		</div>

	  		<div class="container alert alert-info">
	  			<div class="row">
	  				<div style="text-align:center"><h2>联系我们</h2></div>
	  				<div style="margin-left:20px;">
	  				<ul class="nav">
	  					<li>手机号:18236328020</li>
	  					<li>Q  Q:2038165118</li>
	  					<li>邮   箱:2038165118@qq.com</li>
	  				</ul>
	  				</div>
	  			</div>
	  		</div>
	  		<div class="visible-xs-block" style="margin-bottom:100px;">
	  			<a href="speak.jsp">
	  				<button class="btn btn-info col-xs-3 col-xs-offset-4" style="margin-top:30px;">加入我们</button>
	  			</a>
	  		</div>

	  	</div>
  		
	<script src="lib/jquery-3.3.1.min.js"></script>
	<script src="Bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="lib/star.js"></script>
	<script>
    $(function () {
        /*图片位置数据*/
        var datas = [
            {'z-index': 6, opacity: 1, width: 760, height: 330, top: 40, left: 0},
            {'z-index': 3, opacity: 0.4, width: 480, height: 203, top: -10, left: -170},
            {'z-index': 2, opacity: 0.2, width: 620, height: 269, top: -60, left: 110},
            {'z-index': 3, opacity: 0.4, width: 480, height: 203,  top: -10, left: 430},
        ]
        move();

        function move() {
            /*图片分布*/
            for (var i = 0; i < datas.length; i++) {
                var data = datas[i];
                $('#slide ul li').eq(i).css('z-index',data['z-index']);
                $('#slide ul li').eq(i).stop().animate(data, 1200);
            }
        }

        /*左箭头事件*/
        $('.prev').on('click', function () {
            var last = datas.pop();
            datas.unshift(last);

            move();
        })

        /*右箭头事件处理函数*/
        function nextYewu(){
            var first = datas.shift();
            datas.push(first);
            move();
        }
        /*右箭头事件*/
        $('.next').on('click', nextYewu);

        /*自动播放*/
        var timer = setInterval(function(){
            nextYewu();
        },2000);
        /*鼠标进入slide显示箭头,清除自动播放*/
        $('#slide').on({
            mouseenter: function () {
                $('.arrow').css('display', 'block');
                clearInterval(timer);
            }, mouseleave: function () {
                $('.arrow').css('display', 'none');
                /*鼠标离开时自动播放*/
                clearInterval(timer);
                timer = setInterval(function(){
                    nextYewu();
                },5000)
            }
        })
    })
</script>
  	</body>
</html>
