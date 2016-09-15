<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign in</title>
<link rel="stylesheet" href="dist/css/bootstrap.css">
<script type="text/javascript" src="dist/js/jquery.js"></script>
</head>

<jsp:include page="nav.jsp"></jsp:include>
<body>

	<div class="container">
		<h1>Sign in</h1>
		<form action="${pageContext.request.contextPath }/user_login" method="POST">
			<table class="table" style="width:40%;">
				<tr>
					<td>username:</td>
					<td><input type="text" class="form-control" name="user.name"></td>
				</tr>
				<tr>
					<td>password:</td>
					<td><input type="password" class="form-control" name="user.password"></td>
				</tr>
				
				<tr>
					<td colspan="2"><input type="submit"></td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>