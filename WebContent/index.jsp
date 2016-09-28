<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/bootstrap.css">
<link rel="shortcut icon" href="icon.ico">
<link
	href="//cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/dist/js/jquery.js"></script>
<style type="text/css">
#divAnnouncement {
	padding: 5px;
}
</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>

	<div class="container-fluid container">
		<div class="row">
			
			<div class="col-sm-3 col-md-2 sidebar">
				<h3>分类</h3>
				<ul class="nav nav-sidebar">
					<s:iterator value="%{#request.listCategory}" var="category" status="vs">
						<s:url escapeAmp="false" var="categoryUrl" action="pass_page">
							<s:param name="page" value="1"/>
							<s:param name="passagePerPage" value="10"/>
							<s:param name="category.id" value="%{#category.id}"/>
						</s:url>
						<li><a href="<s:property value="#categoryUrl"/>"><s:property value="#category.name"/></a></li>
					</s:iterator>
					<li></li>
				</ul>
				<br><br><br>
				<p>总访问次数&nbsp;:&nbsp;${totaltime.time }</p>
				<p>${buildSite.content }&nbsp;:&nbsp;<s:property value="#request.buildSite.time"/></p>
				<p>${lastUpdate.content }&nbsp;:&nbsp;<s:property value="#request.lastUpdate.time"/></p>
			</div>
			<div class="col-sm-9 col-md-10 main">
				<h3>阅读量</h3>
				<ul class="list-group">
					<s:iterator value="%{#request.mostRead}" var="passage">
						<s:url action="pass_get" var="url">
							<s:param name="passage.id" value="#passage.id"></s:param>
						</s:url>
						<li class="list-group-item">
							<h4>
								<a href="<s:property value="#url"/>"> <s:property
										value="#passage.title" />
								</a> <small>&nbsp;&nbsp;分类:<s:property
										value="#passage.category.name" /> &nbsp;&nbsp; 阅读次数:<s:property
										value="#passage.readtime" />
								</small>
							</h4>
						</li>
					</s:iterator>
				</ul>

				<h3>最近</h3>
				<ul class="list-group">
					<s:iterator value="%{#request.latest}" var="passage">
						<s:url action="pass_get" var="url">
							<s:param name="passage.id" value="#passage.id"></s:param>
						</s:url>
						<li class="list-group-item">
							<h4>
								<a href="<s:property value="#url"/>"> <s:property
										value="#passage.title" />
								</a> <small>&nbsp;&nbsp;分类:<s:property
										value="#passage.category.name" /> &nbsp;&nbsp; 撰写时间:<s:property
										value="#passage.writetime" />
								</small>
							</h4>
						</li>
					</s:iterator>
				</ul>
			</div>


		</div>
		<jsp:include page="bottom.jsp"></jsp:include>
	</div>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/dist/js/bootstrap.js"></script>
</body>
</html>