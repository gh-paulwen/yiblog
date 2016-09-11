<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章列表</title>
<link rel="stylesheet" href="dist/css/bootstrap.css">
<script type="text/javascript" src="dist/js/jquery.js"></script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<jsp:include page="top.jsp"></jsp:include>
	<div class="container">
		<h1 class="text-danger">文章列表&nbsp;:&nbsp;${requestScope.currentCate}</h1><br>
		<ul class="list-group">
			<s:iterator value="%{#request.listPassage}" var="passage">
				<s:url action="pass_get" var="url">
					<s:param name="passage.id" value="%{#passage.id}" />
				</s:url>
				<li class="list-group-item"><h4><a
					href="<s:property value="#url"/>"><s:property
							value="%{#passage.title}" /></a><small>&nbsp;&nbsp;
							作者:<s:property value="#passage.author.name"/>&nbsp;&nbsp;
							阅读次数:<s:property value="#passage.readtime"/>&nbsp;&nbsp;
							撰写时间:<s:property value="#passage.writetime"/></small></h4></li>
				<br>
			</s:iterator>
		</ul>
		<ul title="页数" class="breadcrumb">
			<s:iterator value="%{#request.mapPage}" var="page">
				<li><s:url escapeAmp="false" var="url" value="pass_page">
						<s:param name="page" value="%{#page.value}" />
						<s:param name="passagePerPage" value="%{passagePerPage}"></s:param>
						<s:param name="category" value="%{category.id}" />
						<s:param name="subCategory" value="%{subCategory.id}" />
					</s:url> <a href="<s:property value="#url"/>"> <s:property
							value="#page.key" />
				</a></li>
			</s:iterator>
		</ul>
	</div>
	<script type="text/javascript" src="dist/js/bootstrap.js"></script>
</body>
</html>