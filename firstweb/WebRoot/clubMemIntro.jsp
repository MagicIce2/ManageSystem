<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'clubMemIntro.jsp' starting page</title>
    
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

  </head>
  
  <body>
  	<%@ include file="header.jsp"%>
  	<div style="background:url(img/huiheng.jpg) repeat-x;">
	  	<div style="height:20px"></div>
	    <div class="container">
	    	<div class="row">
			    <div class="col-md-4">
			    	<img src="img/liquanwei.jpg" class="img-rounded img-responsive">
			    	<div class="bg-success" style="padding:5px; margin:10px 0; ">
			    		<h5>姓名：李全伟</h5>
			    		<h5>专业：网络工程</h5>
			    		<h5>职位：计算机社团社长</h5>
			    		<p>个人简介：个人酷爱各种运动，性格很随和。就读于皇家园林（信阳农林学院）网络工程专业，曾获得学校冬季长跑三等奖，夏季运动会三等奖。</p>
						<p>座右铭：走好选择的路，别选择好走的路，你才能拥有真正的自己。</p>
			    	</div>
			    </div>
			    <div class="col-md-4">
			    	<img src="img/shankaikai.jpg" class="img-rounded img-responsive">
			    	<div class="bg-success" style="padding:5px; margin:10px 0; ">
			    		<h5>姓名：单凯凯</h5>
			    		<h5>专业：计算机应用技术</h5>
			    		<h5>职位：计算机副社长</h5>
			    		<p>个人简述：入党积极分子，优秀团员，本人性格开朗，善于交流，具有团队协作精神; 任2018级计算机社团副社长，任班级文艺委员，富于创新精神，乐于接受挑战，不怕困难，曾获第九届蓝桥杯大赛省级三等奖。</p>
						<p>座右铭：当你的才华还撑不起你的野心的时候，你就应该静下心来学习，当你的能力还驾驭不了你的目标时，就应该沉下心来历练；</p>
			    	</div>
			    </div>
			    <div class="col-md-4">
			    	
			    	<img src="img/limengxian.jpg" class="img-rounded img-responsive">
			    	<div class="bg-success" style="padding:5px; margin:10px 0; ">
			    		<h5>姓名：李孟娴</h5>
			    		<h5>专业：数字媒体</h5>
			    		<h5>职位：计算机社团网络宣传部</h5>
			    		<p>个人简介：我是来自17级数字媒体二班的李孟娴，现在担任计算机社团网络宣传部一职 。我平常比较喜欢听歌，喜欢出去玩，看最美的风景。我是一个觉得结果不重要，做好自己应该做的，不留遗憾就好的人，努力成为最优秀的自己。</p>
						<p>座右铭：哭着流泪是怯懦的宣泄,笑着流泪是勇敢的宣言。</p>
			    	</div>
			    </div>
			    
			    <div class="clearfix"></div>
			    <div style="height:20px"></div>

			    
			    <div class="col-md-4">
			    	<img src="img/xiongdudu.jpg" class="img-rounded img-responsive">
			    	<div class="bg-success" style="padding:5px; margin:10px 0; ">
			    		<h5>姓名：熊都都</h5>
			    		<h5>专业：农学2017</h5>
			    		<h5>职位：计算机社团副社长</h5>
			    		<p>个人简介：性豁达，善言谈，喜看书，乐于交友</p>
						<p>座右铭：愿你出走半生，回来仍是少年</p>
			    	</div>
			    </div>
			    <div class="col-md-4">
			    	<img src="img/wanglijun.jpg" class="img-rounded img-responsive">
			    	<div class="bg-success" style="padding:5px; margin:10px 0; ">
			    		<h5>姓名：王莉君</h5>
			    		<h5>专业：数字媒体</h5>
			    		<h5>职位：计算机社团网络宣传部</h5>
			    		<p>个人简述：时喜欢看书 听歌有时候也追剧。喜欢交朋友性格就是活泼。正直和努力是我做人的原则，沉着和冷静是我遇事的态度，强烈责任感使我能够面对任何困难和挑战。虽然现在的我不是最好的，但我会努力成为最好的自己！</p>
						<p>座右铭：没有最好 只有更好！</p>
			    	</div>
			    </div>
			    <div class="col-md-4">
			    	<img src="img/zhuwenzhong.jpg" class="img-rounded img-responsive">
			    	<div class="bg-success" style="padding:5px; margin:10px 0; ">
			    		<h5>姓名：  朱文中</h5>
			    		<h5>专业：  数字媒体</h5>
			    		<h5>职位：  计算机社团秘书</h5>
			    		<p>个人简介：我叫朱文中，是一个朝气的男孩。模样虽然谈不上很完美，但也绝对不难看。我担任计算机社团秘书一职。我喜欢运动，喜欢打篮球。也喜欢读书，特别是在一个安静的雨天。我的最大爱好是ps，当然并不是很出色，也在学习当中。这就是我</p>
						<p>座右铭：   当断不断，反受其乱</p>
			    	</div>
			    </div>
			    
			    <div class="clearfix"></div>
			    <div style="height:20px"></div>
			    
				<div class="col-md-4">
			    	<img src="img/lijingru.jpg" class="img-rounded img-responsive">
			    	<div class="bg-success" style="padding:5px; margin:10px 0; ">
			    		<h5>姓名：李静茹</h5>
			    		<h5>专业：制药工程专业</h5>
			    		<h5>职位：计算机社团活动监督部</h5>
			    		<p>个人简介：优秀团员。性格开朗，爱交朋友，喜欢各类运动，乒乓球，篮球，台球，滑板…班级组织委员，喜欢尝试没做过的事情，喜欢挑战。</p>
						<p>座右铭：在科学上没有平坦的大道，只有不畏劳苦沿着陡峭的山路攀登的人，才有希望达到光辉的顶点。</p>
			    	</div>
			    </div>
				
			    <div class="col-md-4">
			    	<img src="img/yangfan.jpg" class="img-rounded img-responsive">
			    	<div class="bg-success" style="padding:5px; margin:10px 0; ">
			    		<h5>姓名：杨帆</h5>
			    		<h5>专业：网络工程（软件开发）</h5>
			    		<h5>职位：计算机社团外联赞助部</h5>
			    		<p>个人简介：爱好:看书，追漫，旅游</p>
						<p>座右铭：衣带渐宽终不悔。</p>
			    	</div>
			    </div>
			    
			    <div class="col-md-4">
			    	<img src="img/zhangjingwen.jpg" class="img-rounded img-responsive">
			    	<div class="bg-success" style="padding:5px; margin:10px 0; ">
			    		<h5>姓名：郑嵩艳</h5>
			    		<h5>专业：食品学院 食品质量与安全二班</h5>
			    		<h5>职位：计算机社团财会</h5>
			    		<p>个人简介：担任本社团的财会，负责管理社团的账本等，配合校社联财务审计部的工作，同时又是校社联财务审计部的干事。</p>
						<p>座右铭：Never say never.</p>
			    	</div>
			    </div>
				
				<div class="clearfix"></div>
			    <div style="height:20px"></div>
				
			    <div class="col-md-4">
			    	<img src="img/aixinggang.jpg" class="img-rounded img-responsive">
			    	<div class="bg-success" style="padding:5px; margin:10px 0; ">
			    		<h5>姓名：艾兴港</h5>
			    		<h5>专业：物联网工程</h5>
			    		<h5>职位：计算机社团财会</h5>
			    		<p>个人简述：性格活泼开朗，外向，进修学业的同时喜欢社会实践，在校园生活和社会实践生活中不断的挑战自我、充实自己，现已组建了自己的团队，同时多次担任校园项目大使、信阳农林学院电信公司副经理等职务并多次获得创业奖项</p>
						<p>座右铭：价值取决于努力与贡献</p>
			    	</div>
			    </div>

			    <div class="col-md-4">
			    	<img src="img/zhangkailong.jpg" class="img-rounded img-responsive">
			    	<div class="bg-success" style="padding:5px; margin:10px 0; ">
			    		<h5>姓名：张凯龙</h5>
			    		<h5>专业：商务英语</h5>
			    		<h5>职位：活动监督部</h5>
			    		<p>个人简述：入党积极分子，优秀团员，本人吃苦耐劳，认真负责，具有团队协作精神，积极主动参加学校举办各种活动，团结同学，积极进取。</p>
						<p>座右铭：不愿当将军的士兵不是好士兵，我会一直努力，用行动来证明自己。</p>
			    	</div>
			    </div>
			    
			</div>
	    </div>
    </div>
	<script src="lib/jquery-3.3.1.min.js"></script>    
    <script src="Bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="lib/star.js"></script>
  </body>
</html>
