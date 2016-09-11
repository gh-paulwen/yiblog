<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign up</title>
<link rel="stylesheet" href="dist/css/bootstrap.css">
<script type="text/javascript" src="dist/js/jquery.js"></script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container">
		<h2>注册</h2>
		<s:form action="user_save" theme="simple"
			method="POST">
			<table class="table" style="width: 40%;">
				<tr>
					<td colspan="2"><input type="text" placeholder="邮箱"
						class="form-control" name="user.email"></td>
					<td><p class="text-danger">*</p></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" placeholder="用户名"
						class="form-control" name="user.name"></td>
					<td><p class="text-danger">*</p></td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" placeholder="密码"
						class="form-control" name="user.password"></td>
					<td><p class="text-danger">*</p></td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" placeholder="重复密码"
						class="form-control" name="repeatPassword"></td>
					<td><p class="text-danger">*</p></td>
				</tr>
				
				<tr>
					<td><input name="user.birthDate" type="date" placeholder="出生日期" class="form-control"></td>
					<td><p class="text-danger">如 : 1995-09-22</p></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" placeholder="电话号码" class="form-control" name="user.phonenumber"></td>
				</tr>
				<tr>
					<td><select title="性别" name="user.sex">
							<option value="1">男</option>
							<option value="2">女</option>
							<option value="0">保密</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><input class="form-control btn btn-primary" type="submit" value="注册"></td>
				</tr>
			</table>
		</s:form>
	</div>
</body>
</html>