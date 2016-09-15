<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
<link rel="stylesheet" href="dist/css/bootstrap.css">
<script type="text/javascript" src="dist/js/jquery.js"></script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container">
		<table class="table">
			<tr>
				<td>id</td>
				<td>${viewUser.id }</td>
			</tr>
			<tr>
				<td>name</td>
				<td>${viewUser.name }</td>
			</tr>
			<tr>
				<td>email</td>
				<td>${viewUser.email }</td>
			</tr>
			<tr>
				<td>password</td>
				<td>${viewUser.password }</td>
			</tr>
			<tr>
				<td>phone number</td>
				<td>${viewUser.phonenumber }</td>
			</tr>
			<tr>
				<td>sex</td>
				<td>${viewUser.sex }</td>
			</tr>
			<tr>
				<td>birthDate</td>
				<td>${viewUser.birthDate }</td>
			</tr>
			<tr>
				<td>registerDate</td>
				<td>${viewUser.registerDate }</td>
			</tr>
			<tr>
				<td>lastLoginDate</td>
				<td>${viewUser.lastLoginDate }</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript" src="dist/js/bootstrap.css"></script>
</body>
</html>