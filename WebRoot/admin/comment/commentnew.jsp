<%@page import="com.jscms.frame.JSUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ʏ˶3ٶmetaҪǩ*Ҙѫ*؅՚خǰĦìɎێǤ̻Śɝּ*Ҙѫ*ٺ̦Ǥ۳á -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="<%=JSUtils.staticAdminRsPath(request) %>css/bootstrap.min.css" rel="stylesheet">
	<script src="<%=JSUtils.staticAdminRsPath(request) %>js/jquery.min.js"></script>
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
		
		
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">编辑评论</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" action="<%=JSUtils.buildReqPath(request, "comment", "edit") %>&id=${comment.id}" method="post">
				
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">标题</label>
						<div class="col-sm-3">
						  <input type="text" class="form-control" id="mode_index" placeholder="" value="${comment.title }" readonly="readonly">
						</div>
					</div>
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">用户</label>
						<div class="col-sm-1">
							<c:choose>
							<c:when test="${comment.uid >0 }">
						  		<input type="text" class="form-control" id="mode_index" placeholder="" value="${comment.uid }" readonly="readonly">
						  	</c:when>
						  	<c:otherwise>
						  		<input type="text" class="form-control" id="mode_index" placeholder="" value="游客" readonly="readonly">
						  	</c:otherwise>
						  	</c:choose>
						</div>
					</div>
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">内容</label>
						<div class="col-sm-2">
						  <jsp:include page="/admin/um.jsp"></jsp:include>
						</div>
					</div>
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">状态</label>
						<div class="col-sm-4">
						<c:choose>
							<c:when test="${comment.isshow==1 }">
								<label>
									<input type="radio" name="isshow" id="optionsRadios1" value="1" checked>
									已审
								  </label>
								  <label>
									<input type="radio" name="isshow" id="optionsRadios1" value="0" >
									未审
								  </label>
							</c:when>
							<c:otherwise>
								<label>
									<input type="radio" name="isshow" id="optionsRadios1" value="1" >
									已审
								  </label>
								  <label>
									<input type="radio" name="isshow" id="optionsRadios1" value=0 checked>
									未审
								  </label>
							</c:otherwise>
						</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
					<div class="col-sm-1"></div>
					<button type="submit" class="btn btn-default">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/bootstrap.min.js"></script>
  </body>
</html>
