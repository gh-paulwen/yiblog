<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看文章</title>
<link rel="stylesheet" href="dist/css/bootstrap.css">
<script type="text/javascript" src="dist/js/jquery.js"></script>
<script type="text/javascript">
function hideForms(count){
	for(var i=0;i<count;i++){
		var id = "#replyForm" + i;
		$(id).hide();
	}
}

function showOrHideForm(count,currentUser){
	var formid="#replyForm"+count;
	var buttonid="#replyButton"+count;
	if($(buttonid).html()=="回复"){
		if(!$("#currentUserId").attr("value")){
			alert("you must login first");
			return ;
		}
		$(buttonid).html("收起");
		$(formid).show();	
	}else if($(buttonid).html()=="收起"){
		$(buttonid).html("回复");
		$(formid).hide();
	}	
}

$(document).ready(function(){
	$("#commentForm").hide();
	$("#commentButton").click(function(){
		if(!$("#currentUserId").attr("value")){
			alert("you must login first");
			return ;
		}
		$("#commentForm").show();
	});
});

</script>

<style type="text/css">
#divMain {
	background-color:#fff;
}
</style>
</head>
<body onload="hideForms(${requestScope.listCommentSize})">
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container" id="divMain">
		<input type="hidden" id="currentUserId"
			value="${sessionScope.currentUser.id }">
		<h2 class="text-center">${passage.title }</h2>
		${passage.content } <br>
		<button id="commentButton">添加评论</button>
		<s:form action="comment_save" method="POST" id="commentForm">
			<s:hidden name="fromUser.id" value="%{#session.currentUser.id}"></s:hidden>
			<s:hidden name="toUser.id" value="%{#request.passage.author.id}"></s:hidden>
			<s:hidden name="passage.id" value="%{#request.passage.id}"></s:hidden>
			<s:textarea name="comment.content"></s:textarea>
			<s:submit value="评论" />
		</s:form>
		<s:iterator value="%{#request.listComment}" status="vs" var="comment">
			<div>
				<s:property value="#comment.fromUser.name" />
				&nbsp;:&nbsp;
				<s:property value="#comment.content" />
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="replyButton<s:property value="#vs.index"/>" class="test"
					type="button"
					onclick="showOrHideForm(<s:property value="#vs.index"/>)">回复</button>
				<br>
				<form id="replyForm<s:property value="#vs.index"/>"
					action="${pageContext.request.contextPath }/reply_save"
					method="POST">
					<input type="hidden" name="comment.id"
						value="<s:property value="#comment.id"/>"> <input
						type="hidden" name="fromUser.id"
						value="${sessionScope.currentUser.id }"> <input
						type="hidden" name="toUser.id"
						value="<s:property value="#comment.fromUser.id"/>">
					<textarea rows="10" cols="40" name="reply.content"></textarea>
					<input type="submit" value="提交">
				</form>
			</div>
		</s:iterator>
	</div>
	<script type="text/javascript" src="dist/js/bootstrap.js"></script>
</body>
</html>