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

<script type="text/javascript">
	var submitFlag = 0;
	$(document).ready(function(){
		$("#inputEmail").blur(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/user_checkEmail?user.email=" + $("#inputEmail").val(),
				type : "GET",
				dataType : "text",
				success : function(text){
					if(text=="valid"){
						$("#pEmail").html("该邮箱可用");
						submitFlag = 1;
						$("#btnEmail").removeAttr("disabled");
					}else if(text=="unvalid"){
						$("#pEmail").html("该邮箱已经被注册");
						submitFlag = 0;
						$("#btnEmail").attr("disabled","disabled");
					}
				},
				error : function(){
					alert("error");
				}
			});
		});
		
		var _verifyCode = null;
		$("#btnEmail").click(function(){
			if($("#inputEmail").val()==""){
				return;
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/user_sendVerifyEmail?user.email=" + $("#inputEmail").val(),
				type : "GET",
				dataType : "text",
				success : function(text){
					_verifyCode = text;
				},
				error : function(){
					alert("failed");
				}
			});
		});
		
		$("#inputVerifyCode").blur(function(){
			if($("#inputVerifyCode").val()==_verifyCode){
				$("#codeResult").html("match");
				submitFlag = 1;
			}else {
				submitFlag = 0;
			}
		});
		
		$("#inputName").blur(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/user_checkName?user.name=" + $("#inputName").val(),
				type : "GET",
				dataType : "text",
				success : function(text){
					if(text=="valid"){
						$("#pName").html("可用");
						submitFlag = 1;
					}else if(text=="unvalid"){
						$("#pName").html("已被使用");
						submitFlag = 0;
					}
				},
				error : function(){
					alert("error");
				}
			});
		});
		
		$("#inputPassword").blur(function(){
			var _password0 = $("#inputPassword").val();
			if(_password0==""){
				$("#pPassword").html("密码不要为空吧");
				submitFlag = 0;
			}else {
				$("#pPassword").html("*");
				submitFlag = 1;
			}
		});
		
		$("#inputRepeatPassword").blur(function(){
			if($("#inputRepeatPassword").val() != $("#inputPassword").val()){
				$("#pRepeatPassword").html("两次密码需相同");
				submitFlag = 0;
			}else{
				$("#pRepeatPassword").html("*");
				submitFlag = 1;
			}
		});
		
		$("#btnSubmit").click(function(){
			if(submitFlag == 1){
				$("#form_signup").submit();
			}
		});
	});
</script>

</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container">
		<h2 class="text-center">注册</h2>
		<s:form id="form_signup" action="user_save" theme="simple"
			method="POST">
			<table class="table table-condensed" style="width: 50%;margin:auto;">
				<tr>
					<td colspan="2"><input id="inputEmail" type="text" placeholder="邮箱"
						class="form-control" name="user.email"></td>
					<td><p id="pEmail" class="text-danger">*</p></td>
					<td><input disabled="disabled" type="button" class="btn btn-primary" id="btnEmail" value="发送确认码"/></td>
				</tr>
				<tr>
					<td colspan="2"><input id="inputVerifyCode" type="text" placeholder="确认码" class="form-control"></td>
					<td colspan="2"><p id="codeResult" class="text-danger">*</p></td>
				</tr>
				<tr>
					<td colspan="2"><input id="inputName" type="text" placeholder="用户名"
						class="form-control" name="user.name"></td>
					<td colspan="2"><p id="pName" class="text-danger">*</p></td>
				</tr>
				<tr>
					<td colspan="2"><input id="inputPassword" type="password" placeholder="密码(推荐6到20位)"
						class="form-control" name="user.password"></td>
					<td colspan="2"><p id="pPassword" class="text-danger">*</p></td>
				</tr>
				<tr>
					<td colspan="2"><input id="inputRepeatPassword" type="password" placeholder="重复密码"
						class="form-control"></td>
					<td colspan="2"><p id="pRepeatPassword" class="text-danger">*</p></td>
				</tr>
				
				<tr>
					<td colspan="2"><input name="user.birthDate" type="date" placeholder="出生日期(可选)" class="form-control"></td>
					<td colspan="2"><p class="text-danger">如 : 1995-09-22</p></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" placeholder="电话号码(可选)" class="form-control" name="user.phonenumber"></td>
				</tr>
				<tr>
					<td><select title="性别" name="user.sex">
							<option value="1">男</option>
							<option value="2">女</option>
							<option value="0">保密</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><input class="form-control btn btn-primary" type="button" id="btnSubmit" value="注册"></td>
				</tr>
			</table>
		</s:form>
	</div>
</body>
</html>