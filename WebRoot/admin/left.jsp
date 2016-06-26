<%@page import="java.net.URLEncoder"%>
<%@page import="com.jscms.frame.JSUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="<%=JSUtils.staticAdminRsPath(request) %>css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=JSUtils.staticAdminRsPath(request) %>dh.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	
	<ul class="nav nav-sidebar">
            <li class="active" ><a href="<%=JSUtils.buildReqPath(request, "index", "info") %>" target="main" >系统总览 <span class="sr-only">(current)</span></a></li>
            <li><a href="<%=JSUtils.buildReqPath(request, "section", "index") %>" target="main">栏目管理</a></li>
            <li><a href="<%=JSUtils.buildReqPath(request, "mold", "index") %>" target="main">模型管理</a></li>
            <li><a href="#id1"  class="collapsed" data-toggle="collapse" >内容管理</a>
				<ul id="id1" class="collapse menu-second nav nav-sidebar" >
					<c:forEach begin="0" items="${requestScope.moldList }" var="mold">
					<!-- 写死路径 后期可能需要更改 -->
					<li class="" ><a target="main" href="admin.php?c=way&a=index&mold=${mold.molds }" ><c:out value="${mold.moldname }" default="" />·管理</a></li>
					</c:forEach>
				</ul>
			</li>
			<li><a href="#id3"  class="collapsed" data-toggle="collapse" >其他管理</a>
				<ul  id="id3" class="collapse menu-second nav nav-sidebar">
					<li><a href="<%=JSUtils.buildReqPath(request, "comment", "index") %>" target="main">评论管理</a></li>
					<li><a href="<%=JSUtils.buildReqPath(request, "ads", "index") %>" target="main">广告管理</a></li>
				</ul>
            </li>
			<li><a href="#id2"  class="collapsed" data-toggle="collapse" >系统管理</a>
				<ul  id="id2" class="collapse menu-second nav nav-sidebar">
					<li><a href="<%=JSUtils.buildReqPath(request, "system", "index") %>" target="main">系统设置</a></li>
					<li><a href="<%=JSUtils.buildReqPath(request, "admin", "index") %>" target="main">管理员设置</a></li>
				</ul>
            </li>
    </ul>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/bootstrap.min.js"></script>
  </body>
</html>