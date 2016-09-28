<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关于</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/bootstrap.css">
<link rel="shortcut icon" href="icon.ico">
<script type="text/javascript" src="${pageContext.request.contextPath }/dist/js/jquery.js"></script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container-fluid container">
		<h1>关于我</h1>
	
		<h2>&nbsp;&nbsp;&nbsp;&nbsp;基本信息</h2>
		<span style="font-size: 16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;温景毅（Paul），大三学生（2016-2017），现就读于仲恺农业工程学院，信息科学与技术学院，计算机科学与技术专业，程序猿一枚。</span>
	
		<h2>&nbsp;&nbsp;&nbsp;&nbsp;常用语言</h2>
		<span style="font-size: 16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;java，c/cpp</span>
	
		<h2>&nbsp;&nbsp;&nbsp;&nbsp;联系方式</h2>
		<span style="font-size: 16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱
			： wen229267643@gmail.com<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;微信 ： v229267643<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企鹅 ： 229267643<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;github：https://github.com/gh-paulwen<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎大大小小的骚扰
		</span>
	
		<h1>
			<br /> 关于本博客
		</h1>
		<span style="font-size: 16px">&nbsp;&nbsp;&nbsp;&nbsp;这个博客是用ssh框架所搭建的一个博客系统，由于自己的前端水平的确是菜，所以页面很是丑，以后会改善。<br />
			&nbsp;&nbsp;&nbsp;&nbsp;搭这个博客是大二末期做数据库课程设计的时候产生的想法，目的主要有一下几个：
		</span>
	
		<ol>
			<li><span style="font-size: 16px">检验自己的学习成果。</span></li>
			<li><span style="font-size: 16px">用于记下自己的学习笔记，学了这么久发现自己并没有做学习笔记，这是一个bug。</span></li>
			<li><span style="font-size: 16px">希望认识到更多志同道合的人吧。</span></li>
			<li><span style="font-size: 16px">对自己会是一种激励。带着充实这个博客的心，我想我会更有动力去学习更多的东西。</span></li>
		</ol>
		<span style="font-size: 16px">&nbsp;&nbsp;&nbsp;
			博客内容仅仅是个人的见解和总结，如果有错误的话不妨提出。</span>
	
		<h1>关于捐赠</h1>
		<span style="font-size: 16px">&nbsp;&nbsp;&nbsp;&nbsp;我并不期望这个个人博客能赚到钱，但是如果可以补贴一点租服务器的费用的话，何乐而不为呢？</span>
		<br /> &nbsp;&nbsp;&nbsp;
		<br /> &nbsp;&nbsp;&nbsp;&nbsp;
		
		<jsp:include page="bottom.jsp"></jsp:include>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/dist/js/bootstrap.js"></script>
</body>
</html>