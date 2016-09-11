<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<script type="text/javascript">
	function onMouseOver(i) {
		var listid = "#list" + i;
		$(listid).show();
	}
	function onMouseLeave(i) {
		var listid = "#list" + i;
		$(listid).hide();
	}

	$(document).ready(function() {
		$("#liadmin").hide();
		$("#lilogout").hide();
		if ($("#currentUserPower").attr("value") == 1) {
			$("#lisignin").hide();
			$("#lisignup").hide();
			$("#liadmin").show();
			$("#lilogout").show();
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
					<li><a href="${pageContext.request.contextPath }/index.jsp">Home</a></li>
					<li id="lisignin"><a
						href="${pageContext.request.contextPath }/signin.jsp">Sign in</a></li>
					<li id="lisignup"><a
						href="${pageContext.request.contextPath }/signup.jsp">Sign up</a></li>
					<li id="liadmin"><a href="#">Admin Action</a></li>
					<li id="lilogout"><s:a action="user_logout">Logout</s:a></li>

				</ul>
			</div>
		</div>
	</div>
</body>
