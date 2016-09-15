<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<link rel="stylesheet" href="dist/css/bootstrap.css">
<script type="text/javascript" src="dist/js/jquery.js"></script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container">
	<table class="table">
		<thead>
			<tr>
				<th>id</th>
				<th>name</th>
				<th>email</th>
				<th>phone number</th>
				<th>sex</th>
				<th>birthDate</th>
				<th>registerDate</th>
				<th>lastLoginDate</th>
			</tr>
		</thead>

		<tbody>
			<s:iterator value="listUser" var="user">
				<tr>
					<td><s:property value="#user.id" /></td>
					<td><s:a action="user_getById?user.id=%{#user.id}"><s:property value="#user.name" /></s:a></td>
					<td><s:property value="#user.email" /></td>
					<td><s:property value="#user.phonenumber" /></td>
					<td><s:property value="#user.sex" /></td>
					<td><s:property value="#user.birthDate" /></td>
					<td><s:property value="#user.registerDate" /></td>
					<td><s:property value="#user.lastLoginDate" /></td>
				</tr>
			</s:iterator>

		</tbody>
	</table>
	<ul title="页数" class="breadcrumb">
		<s:iterator value="%{#request.pageMap}" var="page">
			<li><s:url escapeAmp="false" var="url" value="user_viewUsers">
					<s:param name="page" value="%{#page.value}" />
					<s:param name="userPerPage" value="%{userPerPage}"></s:param>
				</s:url> <a href="<s:property value="#url"/>"> <s:property
						value="#page.key" />
			</a></li>
		</s:iterator>
	</ul>
	
	</div>
	
	<script type="text/javascript" src="dist/js/bootstrap.js"></script>

</body>
</html>