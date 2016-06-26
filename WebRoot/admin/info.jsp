<%@page import="com.jscms.frame.JSUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ??3?meta??*??*?????ì???????*??*????á -->
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
    ${sessionScope.position}
	<!--
		<div class="" style="width:400px;">
			<ul class="nav nav-tabs nav-justified">
			  <li role="presentation" class="active"><a href="main.php">Home</a></li>
			  <li role="presentation"><a href="main.php">Profile</a></li>
			  <li role="presentation"><a href="main.php">Messages</a></li>
			</ul>
		</div>
	-->
		<div>
			<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <div class="panel-heading">系统总览</div>
				  <div class="panel-body">
					<dl class="dl-horizontal">
					  <dt>当前登录:</dt>
					  <dd>${sessionScope.user.userName } &nbsp;&nbsp;<a href="<%=JSUtils.buildReqPath(request, "admin", "index") %>">[修改资料]</a>&nbsp;&nbsp;<a href="<%=JSUtils.buildReqPath(request, "login", "logout") %>">[退出登录]</a></dd></br>
					  <dt>操作提示:</dt>
					  <dd>请在菜单选择需要操作的内容。</dd></br>
					  <dt>友情提示:</dt>
					  <dd>如不会使用本系统或不会制作模板等，可选择官方服务，为您提供全程无忧服务，详询官方网站客服。http://jscms.com</dd></br>
					  <dt>系统介绍:</dt>
					  <dd>JSCMS通用建站系统</dd></br>
					  <dt>系统内存:</dt>
					  <dd><c:out value="${requestScope.info.total }" default=""/></dd></br>
					  <dt>使用内存:</dt>
					  <dd><c:out value="${requestScope.info.use }" default=""/></dd></br>
					  <dt>JDK版本:</dt>
					  <dd><c:out value="${requestScope.info.Jdkversion }" default=""/></dd></br>
					  <dt>官方网址:</dt>
					  <dd>www.jscms.com</dd></br>
					  <dt>email:</dt>
					  <dd>msbox@live.cn</dd></br>
					</dl>
				  </div>
			</div>
			
		</div>
		
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/bootstrap.min.js"></script>
  </body>
</html>
