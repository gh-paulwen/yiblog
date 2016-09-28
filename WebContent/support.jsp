<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>捐赠</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/bootstrap.css">
<link rel="shortcut icon" href="icon.ico">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/dist/js/jquery.js"></script>

</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container-fluid container">
		<h1>捐赠</h1>
		<span style="font-size: 16px">如果觉得文章对你有帮助的话，那就捐赠作为服务器的费用。</span>

		<h2>捐赠方式（都是赤裸裸地砸钱）</h2>

		<h3>微信</h3>
		<img alt=""
			src="${pageContext.request.contextPath }/CKFinderJava/userfiles/images/wechat-5.png"
			style="height: 342px; width: 280px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img alt=""
			src="${pageContext.request.contextPath }/CKFinderJava/userfiles/images/wechat-10.png"
			style="height: 328px; width: 280px" />
		<h3>支付宝</h3>
		<img alt=""
			src="${pageContext.request.contextPath }/CKFinderJava/userfiles/images/alipay-5.jpg"
			style="height: 326px; width: 280px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img alt=""
			src="${pageContext.request.contextPath }/CKFinderJava/userfiles/images/alipay-10.jpg"
			style="height: 326px; width: 280px" /> <br>
		<br>
		<jsp:include page="bottom.jsp"></jsp:include>
	</div>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/dist/js/jquery.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/dist/js/bootstrap.js"></script>
</body>
</html>