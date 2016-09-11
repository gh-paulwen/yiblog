<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<body>
	<script type="text/javascript">
		function onMouseOver(i){
			var listid = "#list"+i;
			$(listid).show();
		};
		function onMouseLeave(i){
			var listid = "#list"+i;
			$(listid).hide();
		};
		
	</script>
	<div class="container">
		<ul class="nav navbar-nav">
			<s:iterator value="%{#request.mapCategory}" status="vs"
				var="category">
				<li id="drop<s:property value="#vs.index"/>"
					onmouseover="onMouseOver(<s:property value="#vs.index"/>)"
					onmouseout="onMouseLeave(<s:property value="#vs.index"/>)"><a
					class="dropdown-toggle"
					href="${pageContext.request.contextPath}/pass_page?page=1&passagePerPage=5&category.id=<s:property value="#category.key.id"/> "><h4>
							<s:property value="#category.key.name" />
						</h4></a>
					<ul id="list<s:property value="#vs.index"/>" class="dropdown-menu">
						<s:iterator value="%{#category.value}" var="subCategory">
							<li><a
								href="${pageContext.request.contextPath}/pass_page?page=1&passagePerPage=5&subCategory.id=<s:property value="#subCategory.id"/>"><s:property
										value="#subCategory.name" /></a></li>
						</s:iterator>
					</ul></li>
			</s:iterator>
			<li><s:a action="pass_page?page=1&passagePerPage=5">
					<h4>all</h4>
				</s:a></li>

		</ul>
	</div>
</body>
