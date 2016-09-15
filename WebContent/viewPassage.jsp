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
		var replyUlId = "#replyUl" + i;
		$(id).hide();
		$(replyUlId).hide();
	}
}

function showOrHideForm(count,toUser){
	var formid="#replyForm"+count;
	var buttonid="#replyButton"+count;
	var toUserInputid="#replyToUser"+count;
	if($(buttonid).html()=="回复"){
		if(!$("#currentUserId").attr("value")){
			alert("you must login first");
			return ;
		}
		$(buttonid).html("收起");
		$(toUserInputid).attr("value",toUser);
		$(formid).show();	
	}else if($(buttonid).html()=="收起"){
		$(buttonid).html("回复");
		$(formid).hide();
	}	
}

function showOrHideReply(count){
	var replyUlId = "#replyUl" + count;
	var replyButtonId = "#showReplyButton" + count;
	if($(replyButtonId).html()!="收起"){
		$(replyButtonId).html("收起");
		$(replyUlId).show();	
	}else {
		$(replyButtonId).html("展开");
		$(replyUlId).hide();
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
	background-color: #fff;
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
		<ul class="list-group">
			<s:iterator value="%{#request.mapComment}" status="vs" var="item">

				<li class="list-group-item">
					<div>
						<s:a action="user_getById?user.id=%{#item.key.fromUser.id}">
							<s:property value="#item.key.fromUser.name" />
						</s:a>
						&nbsp;:&nbsp;
						<s:property value="#item.key.content" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button id="showReplyButton<s:property value="#vs.index"/>"
							type="button"
							onclick="showOrHideReply(<s:property value="#vs.index"/>)">
							共
							<s:property value="#item.key.replyCount" />
							条回复
						</button>
						<button id="replyButton<s:property value="#vs.index"/>"
							type="button"
							onclick="showOrHideForm(<s:property value="#vs.index"/>,<s:property value="#item.key.fromUser.id"/>)">回复</button>
						<br>
						<ul class="list-group" id="replyUl<s:property value="#vs.index"/>">
							<s:iterator value="#item.value" var="reply">
								<li class="list-group-item">
									<div>
										<s:a action="user_getById?user.id=%{#reply.fromUser.name}">
											<s:property value="#reply.fromUser.name" />
										</s:a>
										&nbsp;回复&nbsp;
										<s:a action="user_getById?user.id=%{#reply.toUser.name}">
											<s:property value="#reply.toUser.name" />
										</s:a>
										&nbsp;:&nbsp;
										<s:property value="#reply.content" />
										<button id="replyButton<s:property value="#vs.index"/>"
											type="button"
											onclick="showOrHideForm(<s:property value="#vs.index"/>,<s:property value="#reply.fromUser.id"/>)">回复</button>
									</div>
								</li>
							</s:iterator>
						</ul>
						<form id="replyForm<s:property value="#vs.index"/>"
							action="${pageContext.request.contextPath }/reply_save"
							method="POST">
							<input type="hidden" name="comment.id" value="<s:property value="#item.key.id"/>"> 
							<input type="hidden" name="fromUser.id"	value="${sessionScope.currentUser.id }">
							<input type="hidden" name="passageid" value="${passage.id }">
							<input type="hidden" id="replyToUser<s:property value="#vs.index"/>" value="" name="toUser.id">
							<textarea rows="10" cols="40" name="reply.content"></textarea>
							<input type="submit" value="提交">
						</form>
					</div>
				</li>
			</s:iterator>
		</ul>
	</div>
	<script type="text/javascript" src="dist/js/bootstrap.js"></script>
</body>
</html>