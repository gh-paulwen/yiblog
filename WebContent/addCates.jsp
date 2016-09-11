<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加分类</title>
</head>
<body>
	<h1>添加分类</h1>
	<s:form action="cate_save">
		<s:textfield label="分类名" name="category.name"/>
		<s:submit/>
	</s:form>
	<br>
	<h1>添加子分类</h1>
	<s:form action="subCategory_save">
		<s:select list="%{#request.listCategory}" listKey="id" listValue="name" name="category.id"/>
		<s:textfield label="子分类名" name="subCategory.name"/>
		<s:submit/>
	</s:form>
</body>
</html>