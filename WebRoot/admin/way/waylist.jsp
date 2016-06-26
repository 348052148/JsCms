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
			  <li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "way", "index") %>&mold=${requestScope.data.mold}"><c:out value="${requestScope.data.mname }" default="" />列表</a></li>
			  <li role="presentation"><a href="<%=JSUtils.buildReqPath(request, "way", "addWay") %>&mold=${requestScope.data.mold}">新增<c:out value="${requestScope.data.mname }" default="" /></a></li>
			</ul>
		</div>
		<div>
			<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <div class="panel-heading"><c:out value="${requestScope.data.mname }" default="" />列表</div>
				  <div class="panel-body">
				  <!-- Table -->
				  <table class="table table-hover">
					<thead>
					  <tr>
						<th>ID</th>
						<th>标题</th>
						<th>状态</th>
						<th>发布时间</th>
						<th>点击</th>
						<th>操作</th>
					  </tr>
					</thead>
					<tbody>
					<c:forEach begin="0" items="${requestScope.list }" var="way" >
					  <tr>
						<th scope="row"><c:out value="${way.id }" default=""/></th>
						<td><c:out value="${way.title }" default=""/></td>
						<td>
						<c:choose>
							<c:when test="${way.isshow==1 }">
								已审
							</c:when>
							<c:otherwise>
								未审
							</c:otherwise>
						</c:choose>
						</td>
						<td><c:out value="${way.addtime }" default=""/></td>
						<td><c:out value="${way.hits }" default=""/></td>
						<td><a href="<%=JSUtils.buildReqPath(request, "way", "editWay") %>&mold=${requestScope.data.mold}&id=${way.id }">编辑</a>&nbsp;&nbsp;&nbsp;<a href="<%=JSUtils.buildReqPath(request, "way", "deleteWay") %>&mold=${requestScope.data.mold}&id=${way.id }">删除</a></td>
					  </tr>
					 </c:forEach>
					</tbody>
				  </table>
				  <c:if test="${requestScope.pageInfo.total>1 }">
				  <%@include file="pageNav.jsp" %>
				  </c:if>
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
