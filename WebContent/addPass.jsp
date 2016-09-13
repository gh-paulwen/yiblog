<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加文章</title>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="dist/js/jquery.js"></script>
<link rel="stylesheet" href="dist/css/bootstrap.css">
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/subCategory_getXmlByCategory?category.id=" + $("#categorySelect").val(),
			type:"GET",
			dataType:"xml",
			success:function(xml){
				$("#subCategorySelect").empty();
				var root = xml.documentElement;
				var arr = root.getElementsByTagName("subcategory");
				for(var i = 0;i < arr.length ;i++){
					var subCate = arr[i];
					var attrs = subCate.attributes;
					var nodeOption = document.createElement("option");
					var nodeText = document.createTextNode(attrs[1].value);
					nodeOption.appendChild(nodeText);
					nodeOption.setAttribute("value",attrs[0].value);
					$("#subCategorySelect").append(nodeOption);
				}					
			},
			error: function(){
				alert("error");
			}
		});
		$("#categorySelect").change(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/subCategory_getXmlByCategory?category.id=" + $("#categorySelect").val(),
				type:"GET",
				dataType:"xml",
				success:function(xml){
					$("#subCategorySelect").empty();
					var root = xml.documentElement;
					var arr = root.getElementsByTagName("subcategory");
					for(var i = 0;i < arr.length ;i++){
						var subCate = arr[i];
						var attrs = subCate.attributes;
						var nodeOption = document.createElement("option");
						var nodeText = document.createTextNode(attrs[1].value);
						nodeOption.appendChild(nodeText);
						nodeOption.setAttribute("value",attrs[0].value);
						$("#subCategorySelect").append(nodeOption);
					}					
				},
				error: function(){
					alert("error");
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="container">
	
	<h1>添加文章</h1>
	<s:form action="pass_save" method="POST" theme="simple">
		<s:select id="categorySelect" list="%{#request.listCategory}"
			listKey="id" listValue="name" name="category.id"></s:select>
		<br>
		子标题 :<select name="subCategory.id" id="subCategorySelect"></select>
		<s:hidden name="author.id" value="%{#session.currentUser.id}"></s:hidden>
		标题 :<s:textfield name="passage.title"></s:textfield>
		文章内容 :<textarea name="passage.content"></textarea>
		<s:submit />
		
	</s:form>
	
	</div>
	
	
	<script type="text/javascript">
			var editor = CKEDITOR.replace('passage.content',{
				height : '600px',
				filebrowserBrowseUrl : 'ckfinder/ckfinder.html',
				filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?Type=Images',
				filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?Type=Flash',
				filebrowserUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
				filebrowserImageUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
				filebrowserFlashUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash',
				filebrowserWindowHeight : '50%',
				filebrowserWindowWidth : '70%'
			});	
			
			CKFinder.setupCKEditor(editor);
			
		</script>
</body>
</html>