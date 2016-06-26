<%@page import="com.jscms.frame.JSUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>JSCms-内容管理系统</title>
	<link rel="stylesheet" href="<%=JSUtils.staticAdminRsPath(request) %>css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=JSUtils.staticAdminRsPath(request) %>css/style.css">
	<style>
	</style>
</head>
<body>
	
	<div class="login">
		<h1>JSCms-内容管理系统</h1>
		<div class="login-container">				
			<div class="view-signin">
			<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "login", "login") %>" >
				<div class="signin-container">
					<div class="input-wrapper">
						<input class="input" type="text" placeholder="账号" name="auser">
					</div>
					<div class="input-wrapper">
						<input class="input" type="password" placeholder="密码" name="apass">
					</div>
					<c:if test="${!empty requestScope.errMsg }">
					<div class="input-wrapper">
						<label><c:out value="${requestScope.errMsg }" default="" /></label>
					</div>
					</c:if>
				</div>
				<button class="btn btn-info">登陆</button>	
			</form>
			</div>
		</div>
	</div>

	<script src="<%=JSUtils.staticAdminRsPath(request) %>js/bootstrap.min.js"></script>
</body>
</html>