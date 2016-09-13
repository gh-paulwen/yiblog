<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
<link rel="stylesheet" href="dist/css/bootstrap.css">
<script type="text/javascript" src="dist/js/jquery.js"></script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<jsp:include page="top.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-xs-8">
				<h3>most read</h3>
				<ul class="list-group">
					<s:iterator value="%{#request.mostRead}" var="passage">
						<s:url action="pass_get" var="url">
							<s:param name="passage.id" value="#passage.id"></s:param>
						</s:url>
						<li class="list-group-item"><h4>
								<a href="<s:property value="#url"/>"><s:property
										value="#passage.title" /></a><small>&nbsp;&nbsp;分类:<s:property 
										value="#passage.category.name"/>&nbsp;&nbsp; 作者:<s:property
										value="#passage.author.name" />&nbsp;&nbsp; 阅读次数:<s:property
										value="#passage.readtime" />&nbsp;&nbsp; 撰写时间:<s:property
										value="#passage.writetime" /></small>
							</h4></li>
					</s:iterator>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-8">
				<h3>latest</h3>
				<ul class="list-group">
					<s:iterator value="%{#request.latest}" var="passage">
						<s:url action="pass_get" var="url">
							<s:param name="passage.id" value="#passage.id"></s:param>
						</s:url>
						<li class="list-group-item"><h4>
								<a href="<s:property value="#url"/>"><s:property
										value="#passage.title" /></a><small>&nbsp;&nbsp;分类:<s:property 
										value="#passage.category.name"/>&nbsp;&nbsp; 作者:<s:property
										value="#passage.author.name" />&nbsp;&nbsp; 阅读次数:<s:property
										value="#passage.readtime" />&nbsp;&nbsp; 撰写时间:<s:property
										value="#passage.writetime" /></small>
							</h4></li>
					</s:iterator>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="dist/js/bootstrap.js"></script>
</body>
</html>