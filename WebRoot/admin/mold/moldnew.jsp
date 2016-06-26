<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ page import="com.jscms.frame.JSUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="<%=JSUtils.staticAdminRsPath(request) %>css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  
	<div class="container-fluid">
	${requestScope.position}
	<!--
		<div class="" style="width:400px;">
			<ul class="nav nav-tabs nav-justified">
			  <li role="presentation" class="active"><a href="main.php">Home</a></li>
			  <li role="presentation"><a href="main.php">Profile</a></li>
			  <li role="presentation"><a href="main.php">Messages</a></li>
			</ul>
		</div>
	-->
		<div class="" style="width:300px;">
			<ul class="nav nav-pills nav-justified">
			  <li role="presentation" ><a href="<%=JSUtils.buildReqPath(request, "mold", "index") %>">模型列表</a></li>
			  <li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "mold", "addMold") %>">新增模型</a></li>
			</ul>
		</div>
		
		
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">新增模型</h3>
			</div>
			<div class="panel-body">
				<%@include file="moldeditnew.jsp" %>
			</div>
		</div>
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/bootstrap.min.js"></script>
  </body>
</html>