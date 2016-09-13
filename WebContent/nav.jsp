<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#lilogout").hide();
		$("#liViewUsers").hide();
		$("#liAddPassage").hide();
		$("#liAddCates").hide();
		if ($("#currentUserPower").attr("value") == 1) {
			$("#lisignin").hide();
			$("#lisignup").hide();
			$("#lilogout").show();
			$("#liViewUsers").show();
			$("#liAddPassage").show();
			$("#liAddCates").show();
		} else if ($("#currentUserPower").attr("value") == 2) {
			$("#lisignin").hide();
			$("#lisignup").hide();
			$("#lilogout").show();
		}		
	});
</script>
</head>

<body>
	<input type="hidden" id="currentUserPower"
		value="${sessionScope.currentUser.power.id }">
	<div class="container">
		<div class="navbar navbar-default">

			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Project Name</a>
			</div>

			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li id="lisignin"><a
						href="${pageContext.request.contextPath }/signin.jsp">登录</a></li>
					<li id="lisignup"><a
						href="${pageContext.request.contextPath }/signup.jsp">注册</a></li>
					<li id="liViewUsers"><s:a action="">查看用户</s:a></li>
					<li id="liAddPassage"><a href="${pageContext.request.contextPath}/addPass.jsp">写文章</a></li>
					<li id="liAddCates"><a href="${pageContext.request.contextPath }/addCates.jsp">添加分类/子分类</a></li>
					<li id="lilogout"><s:a action="user_logout">退出</s:a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
