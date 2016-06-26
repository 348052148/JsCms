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
			  <li role="presentation" ><a href="<%=JSUtils.buildReqPath(request, "admin", "index") %>">管理员管理</a></li>
			  <li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "admin", "group") %>">管理员分组</a></li>
			</ul>
		</div>
		<div>
			<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <div class="panel-heading">栏目列表</div>
				  <div class="panel-body">
				  <!-- Table -->
				  <table class="table table-hover">
					<thead>
					  <tr>
						<th>ID</th>
						<th>分组名称</th>
						<th>操作</th>
					  </tr>
					</thead>
					<tbody>
						<c:forEach begin="0" items="${requestScope.grouplist }" var="group">
							<tr>
								<th scope="row"><c:out value="${group.gid }" default="" /></th>
								<td><c:out value="${group.name }" default="" /></td>
								<td><a href="<%=JSUtils.buildReqPath(request, "admin", "group") %>&gid=${group.gid }">编辑</a>&nbsp;&nbsp;&nbsp;<a href="<%=JSUtils.buildReqPath(request, "admin", "deleteGroup") %>&gid=${group.gid }">删除</a></td>
							  </tr>
						</c:forEach>
					</tbody>
				  </table>
				  <c:choose >
				  	<c:when test="${empty requestScope.group }">
				  		<form class="form-horizontal" action="<%=JSUtils.buildReqPath(request, "admin", "addGroup") %>" method="post">
							<div class="form-group">
								 <label for="mode_name" class="col-sm-1 control-label">分组名称</label>
								<div class="col-sm-2">
								  <input type="text" class="form-control" id="mode_name" placeholder="" name="name" />
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-1"></div>
								<button type="submit" class="btn btn-default">提交</button>
							</div>
						</form>
				  	</c:when>
				  	<c:otherwise>
				  		<form class="form-horizontal" action="<%=JSUtils.buildReqPath(request, "admin", "addGroup") %>&gid=${requestScope.group.gid }" method="post" >
							<div class="form-group">
								 <label for="mode_name" class="col-sm-1 control-label">分组名称</label>
								<div class="col-sm-2">
								  <input type="text" class="form-control" id="mode_name" placeholder="" name="name" value="${requestScope.group.name }" />
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-1"></div>
								<button type="submit" class="btn btn-default">提交</button>
							</div>
						</form>
				  	</c:otherwise>
				  </c:choose>
				  
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