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
			  <li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "admin", "index") %>">管理员管理</a></li>
			  <li role="presentation"><a href="<%=JSUtils.buildReqPath(request, "admin", "group") %>">管理员分组</a></li>
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
						<th>用户名</th>
						<th>用户密码</th>
						<th>分组</th>
						<th>真实姓名</th>
						<th>邮箱</th>
						<th>电话</th>
						<th>操作</th>
					  </tr>
					</thead>
					<tbody>
					<c:forEach begin="0" items="${requestScope.adminlist }" var="admin" >
						<c:choose>
							<c:when test="${empty requestScope.selectID }">
								<tr>
									<th scope="row"><c:out value="${admin.aid }" default="" /></th>
									<td><c:out value="${admin.auser }" default="" /></td>
									<td>****</td>
									<c:choose>
										<c:when test="${admin.gid==-1 }">
											<td>超级管理员</td>	
										</c:when>
										
										<c:otherwise>
											<c:forEach begin="0" items="${requestScope.grouplist }" var="group" >
												<c:if test="${group.gid==admin.gid }">
												<td><c:out value="${group.name }" default=""/></td>
												</c:if>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									
									<td><c:out value="${admin.aname }" default="" /></td>
									<td><c:out value="${admin.aemail }" default="" /></td>
									<td><c:out value="${admin.atel }" default="" /></td>
									<td><a href="<%=JSUtils.buildReqPath(request, "admin", "index") %>&aid=${admin.aid}">编辑</a>&nbsp;&nbsp;&nbsp;<a href="<%=JSUtils.buildReqPath(request, "admin", "deleteAdmin") %>&aid=${admin.aid}">删除</a></td>
								  </tr>	
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${admin.aid==requestScope.selectID }">
									  <tr>
											<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "admin", "addAdmin") %>&aid=${admin.aid }" >
											<th scope="row"><c:out value="${admin.aid }" default="" /></th>
											<td><input type="text" class="form-control col-sm-1" id="mode_index" placeholder="" name="auser" value="${admin.auser }" ></td>
											<td><input type="text" class="form-control col-sm-1" id="mode_index" placeholder="" name="apass" value="${admin.apass }" ></td>
											<td>
												<select class="form-control" name="gid">
												  <option value="-1">超级管理员</option>
												  <c:forEach begin="0" items="${requestScope.grouplist }" var="group" >
												  		<option value="${group.gid }"><c:out value="${group.name }" default=""/></option>
												  </c:forEach>
											  	</select>
											</td>
											<td><input type="text" class="form-control col-sm-1" id="mode_index" placeholder="" name="aname" value="${admin.aname }" ></td>
											<td><input type="text" class="form-control col-sm-1" id="mode_index" placeholder="" name="aemail" value="${admin.aemail }" ></td>
											<td><input type="text" class="form-control col-sm-1" id="mode_index" placeholder="" name="atel" value="${admin.atel }" ></td>
											<td><button type="submit" class="btn btn-default">修改</button></td>
											</form>
										  </tr>
									</c:when>
									<c:otherwise>
										<tr>
										<th scope="row"><c:out value="${admin.aid }" default="" /></th>
										<td><c:out value="${admin.auser }" default="" /></td>
										<td>****</td>
										<c:choose>
											<c:when test="${admin.gid==-1 }">
												<td>超级管理员</td>	
											</c:when>
											
											<c:otherwise>
												<c:forEach begin="0" items="${requestScope.grouplist }" var="group" >
													<c:if test="${group.gid==admin.gid }">
													<td><c:out value="${group.name }" default=""/></td>
													</c:if>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										
										<td><c:out value="${admin.aname }" default="" /></td>
										<td><c:out value="${admin.aemail }" default="" /></td>
										<td><c:out value="${admin.atel }" default="" /></td>
										<td><a href="<%=JSUtils.buildReqPath(request, "admin", "index") %>&aid=${admin.aid}">编辑</a>&nbsp;&nbsp;&nbsp;<a href="<%=JSUtils.buildReqPath(request, "admin", "deleteAdmin") %>&aid=${admin.aid}">删除</a></td>
									  </tr>	
									</c:otherwise>
								</c:choose>
								
							</c:otherwise>
						</c:choose>
										
					</c:forEach>
					  <tr>
						<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "admin", "addAdmin") %>" >
						<th scope="row">+</th>
						<td><input type="text" class="form-control col-sm-1" id="mode_index" placeholder="" name="auser" ></td>
						<td><input type="text" class="form-control col-sm-1" id="mode_index" placeholder="" name="apass" ></td>
						<td>
							<select class="form-control" name="gid">
							  <option value="-1">超级管理员</option>
							  <c:forEach begin="0" items="${requestScope.grouplist }" var="group" >
									<option value="${group.gid }"><c:out value="${group.name }" default=""/></option>
							  </c:forEach>
						  	</select>
						</td>
						<td><input type="text" class="form-control col-sm-1" id="mode_index" placeholder="" name="aname" ></td>
						<td><input type="text" class="form-control col-sm-1" id="mode_index" placeholder="" name="aemail" ></td>
						<td><input type="text" class="form-control col-sm-1" id="mode_index" placeholder="" name="atel" ></td>
						<td><button type="submit" class="btn btn-default">添加</button></td>
						</form>
					  </tr>
					</tbody>
				  </table>
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