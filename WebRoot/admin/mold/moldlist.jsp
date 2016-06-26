<%@page import="com.jscms.admin.MoldController"%>
<%@page import="com.jscms.frame.JSUtils"%>
<%@page language="java" import="java.util.*" pageEncoding="utf8"%>
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
			  <li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "mold", "index") %>">模型列表</a></li>
			  <li role="presentation"><a href="<%=JSUtils.buildReqPath(request, "mold", "addMold") %>">新增模型</a></li>
			</ul>
		</div>
		<div>
			<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <div class="panel-heading">模型列表</div>
				  <div class="panel-body">
				  <!-- Table -->
				  <table class="table table-hover">
					<thead>
					  <tr>
						<th>ID</th>
						<th>模型名称</th>
						<th>模型标识</th>
						<th>模型属性</th>
						<th>设置</th>
						<th>状态</th>
						<th>操作</th>
					  </tr>
					</thead>
					<tbody>
					<c:forEach items="${requestScope.dataList}" begin="0" var="mold" varStatus="stat" >
					  <tr>
						<th scope="row"><c:out value="${mold.mid}" default="0" /></th>
						<td><c:out value="${mold.moldname}"/></td>
						<td><c:out value="${mold.molds}"/></td>
						<td>系统模型道</td>
						<td><a href="?c=a_traits&amp;molds=product">推荐属性管理</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=JSUtils.buildReqPath(request, "fields", "index") %>&molds=${mold.molds}&mid=${mold.mid}">字段管理</a></td>
						<td>
						<c:choose>
							<c:when test="${mold.isshow == 1}">
								<c:out value="开启"/>
							</c:when>
							<c:otherwise>
								<c:out value="关闭"/>
							</c:otherwise>
						</c:choose>
							
						</td>
						<td><a href="<%=JSUtils.buildReqPath(request, "mold", "addMold","&op=edit&mid=") %>${mold.mid}">编辑</a>&nbsp;&nbsp;&nbsp;<a href="<%=JSUtils.buildReqPath(request, "mold", "addMold","&op=del&mid=") %>${mold.mid}">删除</a></td>
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
