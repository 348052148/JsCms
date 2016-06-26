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
	<div class="" style="width:500px;">
	<ul class="nav nav-tabs nav-justified">
	  <c:choose>
	  	<c:when test="${requestScope.type=='base' }">
	  		<li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "system", "index") %>">站点设置</a></li>
	  	</c:when>
	  	<c:otherwise>
	  		<li role="presentation" ><a href="<%=JSUtils.buildReqPath(request, "system", "index") %>">站点设置</a></li>
	  	</c:otherwise>
	  </c:choose>
	  <c:choose>
	  	<c:when test="${requestScope.type=='upload' }">
	  		<li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "system", "upload") %>">上传设置</a></li>
	  	</c:when>
	  	<c:otherwise>
	  		<li role="presentation"><a href="<%=JSUtils.buildReqPath(request, "system", "upload") %>">上传设置</a></li>
	  	</c:otherwise>
	  </c:choose>
	  <c:choose>
	  	<c:when test="${requestScope.type=='cached' }">
	  		<li role="presentation" class="active" ><a href="<%=JSUtils.buildReqPath(request, "system", "cached") %>">缓存设置</a></li>
	  	</c:when>
	  	<c:otherwise>
	  		<li role="presentation"><a href="<%=JSUtils.buildReqPath(request, "system", "cached") %>">缓存设置</a></li>
	  	</c:otherwise>
	  </c:choose>
	  <c:choose>
	  	<c:when test="${requestScope.type=='email' }">
	  		<li role="presentation" class="active" ><a href="<%=JSUtils.buildReqPath(request, "system", "email") %>">邮件设置</a></li>
	  	</c:when>
	  	<c:otherwise>
	  		<li role="presentation"><a href="<%=JSUtils.buildReqPath(request, "system", "email") %>">邮件设置</a></li>
	  	</c:otherwise>
	  </c:choose>
    </ul>
	</div>
	
		<c:if test="${requestScope.type=='base' }">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">基本设置</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "system", "updateInfo") %>&type=base">
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">网站地址：</label>
						<div class="col-sm-3">
							<c:choose>
								<c:when test="${empty requestScope.sysInfo.siteUrl }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="siteUrl">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="siteUrl" value="${requestScope.sysInfo.siteUrl }">
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">网址名称：</label>
						<div class="col-sm-3">
							<c:choose>
								<c:when test="${requestScope.sysInfo.siteName }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="siteName">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="siteName" value="${requestScope.sysInfo.siteName }">
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">首页关键词：</label>
						<div class="col-sm-2">
							<c:choose>
								<c:when test="${empty requestScope.sysInfo.indexKey }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="indexKey">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="indexKey" value="${requestScope.sysInfo.indexKey }">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">首页简介：</label>
						<div class="col-sm-4">
							<c:choose>
								<c:when test="${empty requestScope.sysInfo.indexDes }">
									<textarea class="form-control" rows="4" name="indexDes"></textarea>
								</c:when>
								<c:otherwise>
									<textarea class="form-control" rows="4" name="indexDes"><c:out value="${requestScope.sysInfo.indexDes }" default="" /></textarea>
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">默认模板：</label>
						<div class="col-sm-1">
							<c:choose>
								<c:when test="${empty requestScope.sysInfo.defaltTemple }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="defaltTemple">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="defaltTemple" value="${requestScope.sysInfo.defaltTemple }">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">Gzip压缩：</label>
						<div class="col-sm-4">
							<c:choose>
								<c:when test="${requestScope.sysInfo.gzip=='yes' }">
									<label>
									<input type="radio" name="gzip" id="optionsRadios1" value="yes" checked>
									开启
								  </label>
								  <label>
									<input type="radio" name="gzip" id="optionsRadios1" value="no" >
									关闭
								  </label>
								</c:when>
								<c:otherwise>	
									<label>
									<input type="radio" name="gzip" id="optionsRadios1" value="yes" >
									开启
								  </label>
								  <label>
									<input type="radio" name="gzip" id="optionsRadios1" value="no" checked>
									关闭
								  </label>
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">调试模式：</label>
						<div class="col-sm-4">
							<c:choose>
								<c:when test="${requestScope.sysInfo.debug=='yes' }">
									<label>
									<input type="radio" name="debug" id="optionsRadios1" value="yes" checked>
									开启
								  </label>
								  <label>
									<input type="radio" name="debug" id="optionsRadios1" value="no" >
									关闭
								  </label>
								</c:when>
								<c:otherwise>
									<label>
									<input type="radio" name="debug" id="optionsRadios1" value="yes" >
									开启
								  </label>
								  <label>
									<input type="radio" name="debug" id="optionsRadios1" value="no" checked>
									关闭
								  </label>
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">异常日志：</label>
						<div class="col-sm-4">
							<c:choose>
								<c:when test="${requestScope.sysInfo.exceptLog=='yes' }">
									<label>
									<input type="radio" name="exceptLog" id="optionsRadios1" value="yes" checked>
									开启
								  </label>
								  <label>
									<input type="radio" name="exceptLog" id="optionsRadios1" value="no" >
									关闭
								  </label>
								</c:when>
								<c:otherwise>
									<label>
									<input type="radio" name="exceptLog" id="optionsRadios1" value="yes" >
									开启
								  </label>
								  <label>
									<input type="radio" name="exceptLog" id="optionsRadios1" value="no" checked>
									关闭
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
		</c:if>
		
		<c:if test="${requestScope.type=='upload' }">
			<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">基本设置</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "system", "updateInfo") %>&type=upload">
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">上传目录：</label>
						<div class="col-sm-3">
						<c:choose>
							<c:when test="${empty requestScope.sysInfo.uploadDir }">
								<input type="text" class="form-control" id="mode_index" placeholder="" name="uploadDir">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" id="mode_index" placeholder="" name="uploadDir" value="${requestScope.sysInfo.uploadDir }">
							</c:otherwise>
						</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">上传tmp目录：</label>
						<div class="col-sm-3">
						<c:choose>
							<c:when test="${empty requestScope.sysInfo.uploadTmpDir }">
								<input type="text" class="form-control" id="mode_index" placeholder="" name="uploadTmpDir">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" id="mode_index" placeholder="" name="uploadTmpDir" value="${requestScope.sysInfo.uploadTmpDir }">
							</c:otherwise>
						</c:choose>
						  
						</div>
					</div>
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">最大上传M：</label>
						<div class="col-sm-1">
						<c:choose>
							<c:when test="${empty requestScope.sysInfo.uploadMaxSize }">
								<input type="text" class="form-control" id="mode_index" placeholder="" name="uploadMaxSize">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" id="mode_index" placeholder="" name="uploadMaxSize" value="${requestScope.sysInfo.uploadMaxSize }">
							</c:otherwise>
						</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">开启日志：</label>
						<div class="col-sm-4">
						<c:choose>
							<c:when test="${empty requestScope.sysInfo.isUploadLog }">
								<label>
									<input type="radio" name="isUploadLog" id="optionsRadios1" value="1" checked>
									开启
								  </label>
								  <label>
									<input type="radio" name="isUploadLog" id="optionsRadios1" value="0" checked>
									关闭
								  </label>
							</c:when>
							<c:otherwise>
								<c:choose >
									<c:when test="${requestScope.sysInfo.isUploadLog==1 }">
										<label>
										<input type="radio" name="isUploadLog" id="optionsRadios1" value="1" checked>
										开启
									  </label>
									  <label>
										<input type="radio" name="isUploadLog" id="optionsRadios1" value="0" >
										关闭
									  </label>
									</c:when>
									<c:otherwise>
										<label>
										<input type="radio" name="isUploadLog" id="optionsRadios1" value="1" >
										开启
									  </label>
									  <label>
										<input type="radio" name="isUploadLog" id="optionsRadios1" value="0" checked>
										关闭
									  </label>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">上传日志路径：</label>
						<div class="col-sm-3">
						<c:choose>
							<c:when test="${empty requestScope.sysInfo.uploadLogPath }">
								<input type="text" class="form-control" id="mode_index" placeholder="" name="uploadLogPath">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" id="mode_index" placeholder="" name="uploadLogPath" value="${requestScope.sysInfo.uploadLogPath }">
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
		</c:if>
		
		<c:if test="${requestScope.type=='cached' }">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">缓存设置</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "system", "updateInfo") %>&type=cached" >
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">缓存服务器地址：</label>
						<div class="col-sm-3">
							<c:choose>
								<c:when test="${empty requestScope.sysInfo.cahceHost}">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="cahceHost">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="cahceHost" value="${requestScope.sysInfo.cahceHost }">
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">服务器用户：</label>
						<div class="col-sm-2">
							<c:choose>
								<c:when test="${empty requestScope.sysInfo.cacheUser }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="cacheUser">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="cacheUser" value="${requestScope.sysInfo.cacheUser }">
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">服务密码：</label>
						<div class="col-sm-2">
							<c:choose>
								<c:when test="${empty requestScope.sysInfo.cachePass }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="cachePass">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="cachePass" value="${requestScope.sysInfo.cachePass }" >
								</c:otherwise>
							</c:choose>
						 
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">全站缓存TTL：</label>
						<div class="col-sm-1">
							<c:choose>
								<c:when test="${empty requestScope.sysInfo.cacheTTL }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="cacheTTL">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="cacheTTL" value="${requestScope.sysInfo.cacheTTL }">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">是否开启：</label>
						<div class="col-sm-4">
							<c:choose>
								<c:when test="${requestScope.sysInfo.cached=='yes' }">
									<label>
									<input type="radio" name="cached" id="optionsRadios1" value="yes" checked>
									开启
								  </label>
								  <label>
									<input type="radio" name="cached" id="optionsRadios1" value="no" >
									关闭
								  </label>
								</c:when>
								<c:otherwise>
									<label>
									<input type="radio" name="cached" id="optionsRadios1" value="yes" >
									开启
								  </label>
								  <label>
									<input type="radio" name="cached" id="optionsRadios1" value="no" checked>
									关闭
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
		</c:if>
		
		<c:if test="${requestScope.type=='email' }">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">邮箱设置</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "system", "updateInfo") %>&type=email">
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">smtp地址：</label>
						<div class="col-sm-3">
							<c:choose>
								<c:when test="${empty requestScope.sysInfo.smtpHost }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="smtpHost">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="smtpHost" value="${requestScope.sysInfo.smtpHost }">
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">发信邮箱：</label>
						<div class="col-sm-2">
							<c:choose>
								<c:when test="${empty requestScope.sysInfo.email }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="email">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="email" value="${requestScope.sysInfo.email }">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">邮箱密码：</label>
						<div class="col-sm-2">
							<c:choose>
								<c:when test="${empty requestScope.sysInfo.emailPass }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="emailPass">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" value="${requestScope.sysInfo.emailPass }" name="emailPass">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">发信人：</label>
						<div class="col-sm-2">
							<c:choose>
								<c:when test="${empty requestScope.sysInfo.emailName }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="emailName">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" value="${requestScope.sysInfo.emailName }" name="emailName">
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
		</c:if>
		
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/bootstrap.min.js"></script>
  </body>
</html>