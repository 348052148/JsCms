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
	<style>
		.info{
			margin-right:20px;
			text-decoration: none;
			cursor: pointer;
			color: #000;
		}
	</style>
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
	
		<div>
		<c:forEach begin="0" items="${requestScope.comments }" var="comment">
			<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <div class="panel-heading">
			  <c:choose>
			  	<c:when test="${comment.isshow==1 }">
			  		<label >状态：</label><a class="info"  >已审</a>
			  	</c:when>
			  	<c:otherwise>
			  		<label  >状态：</label><a class="info" style="color:red" >未审</a>
			  	</c:otherwise>
			  </c:choose>
			  
			  <label  >栏目：</label><a class="info" ><c:out value="${comment.sname }" default=""/></a>
			  <label  >标题：</label><a class="info" ><c:out value="${comment.title }" default=""/></a>
			  <c:choose>
			  	<c:when test="${comment.uid >0 }">
			  		<label >用户：</label><a class="info" ><c:out value="${comment.uid }" default=""/></a>
			  	</c:when>
			  	<c:otherwise>
			  		<label >用户：</label><a class="info" ><c:out value="游客" default=""/></a>
			  	</c:otherwise>
			  </c:choose>
			  <label >发表时间：</label><a class="info" ><c:out value="${comment.atime }" default="" /></a>
			  <a href="<%=JSUtils.buildReqPath(request, "comment", "delete") %>&id=${comment.id}" style="float:right;margin-left:20px;">删除</a> <a href="<%=JSUtils.buildReqPath(request, "comment", "edit") %>&id=${comment.id}" style="float:right;">编辑</a>
			  </div>
				  <div class="panel-body">
				  <p>${comment.content }</p>
			   </div>
			</div>
			</c:forEach>
		</div>
		
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/bootstrap.min.js"></script>
  </body>
</html>