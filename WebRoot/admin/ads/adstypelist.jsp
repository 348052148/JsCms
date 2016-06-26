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
		<div class="" style="width:600px;">
			<ul class="nav nav-pills nav-justified">
			  <li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "ads", "adstype") %>">广告位列表</a></li>
			  <li role="presentation" ><a href="<%=JSUtils.buildReqPath(request, "ads", "addAdstype") %>">新增广告位</a></li>
			  <li role="presentation"><a href="<%=JSUtils.buildReqPath(request, "ads", "ads") %>">广告列表</a></li>
			  <li role="presentation"  ><a href="<%=JSUtils.buildReqPath(request, "ads", "addAds") %>">新增广告</a></li>
			</ul>
		</div>
		<div>
			<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <div class="panel-heading">广告位列表</div>
				  <div class="panel-body">
				  <!-- Table -->
				  <table class="table table-hover">
					<thead>
					  <tr>
						<th>ID</th>
						<th>广告位名称</th>
						<th>广告位宽高</th>
						<th>广告位操作</th>
					  </tr>
					</thead>
					<tbody>
					<c:forEach begin="0" items="${requestScope.adstypeList }" var="adstype">
						<tr>
							<th scope="row">${adstype.taid }</th>
							<td>${adstype.name }</td>
							<td>宽：${adstype.adsw } 高：${adstype.adsh }</td>
							<td><a href="<%=JSUtils.buildReqPath(request, "ads", "editAdstype") %>&id=${adstype.taid}">编辑</a>&nbsp;&nbsp;&nbsp;<a href="<%=JSUtils.buildReqPath(request, "ads", "deleteAdstype") %>&id=${adstype.taid}">删除</a></td>
						  </tr>
					</c:forEach>
					  
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

