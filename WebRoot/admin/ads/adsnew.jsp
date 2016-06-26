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
		
		
		<div class="" style="width:600px;">
			<ul class="nav nav-pills nav-justified">
			  <li role="presentation" ><a href="<%=JSUtils.buildReqPath(request, "ads", "adstype") %>">广告位列表</a></li>
			  <li role="presentation" ><a href="<%=JSUtils.buildReqPath(request, "ads", "addAdstype") %>">新增广告位</a></li>
			  <li role="presentation"><a href="<%=JSUtils.buildReqPath(request, "ads", "ads") %>">广告列表</a></li>
			  <li role="presentation"  class="active" ><a href="<%=JSUtils.buildReqPath(request, "ads", "addAds") %>">新增广告</a></li>
			</ul>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">新增广告</h3>
			</div>
			<div class="panel-body">
			
				<form class="form-horizontal" action="<%=JSUtils.reqWebModuld(request) %>?c=ads&a=${empty ads ? 'addAds' : 'editAds&id=' }${empty ads ? '' : ads.id }" method="post">
				
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">广告名称</label>
						<div class="col-sm-2">
						  <input type="text" class="form-control" id="mode_index" placeholder="" name="name" value="${empty ads.name ? '' : ads.name }">
						</div>
					</div>
					
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">广告位</label>
						<div class="col-sm-2">
						 <select class="form-control lanmu" name="taid" >
						 	<c:forEach begin="0" items="${adstypeList }" var="adstype">
						 		<option value="${adstype.taid }" ${adstype.taid == ads.taid ? 'selected="selected"' : '' } >${adstype.name }</option>
						 	</c:forEach>
						 </select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">广告尺寸</label>
						<div class="col-sm-1">
						<label>宽：<input type="text" class="form-control" id="mode_index" placeholder="" name="adsw" value="${empty ads.adsw ? '' : ads.adsw }"></label>
						<label>高：<input type="text" class="form-control" id="mode_index" placeholder="" name="adsh" value="${empty ads.adsh ? '' : ads.adsh }"></label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">广告类型</label>
						<div class="col-sm-2">
						 <select class="form-control lanmu" name="type" >
						 	<option value="1" ${ads.type==1 ? 'selected="selected"' : '' } >flash</option>
						 	<option value="2" ${ads.type==2 ? 'selected="selected"' : '' } >图片</option>
						 	<option value="3" ${ads.type==3 ? 'selected="selected"' : '' } >视频</option>
						 	<option value="4" ${ads.type==4 ? 'selected="selected"' : '' } >自定义代码</option>
						 </select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">上传文件</label>
						<div class="col-sm-2">
							<%=JSUtils.buildValueForHashMap(request, "ads", "adfile") %>
							<%=JSUtils.buildUploadHtml("adfile",JSUtils.buildHashMap4Value(request, "ads", "adfile"),false) %>
						</div>
					</div>
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">链接地址</label>
						<div class="col-sm-2">
						  <input type="text" class="form-control" id="mode_index" placeholder="" name="gourl" value="${empty ads.gourl ? '' : ads.gourl }">
						</div>
					</div>
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">状态</label>
						<div class="col-sm-4">
						  <label>
							<input type="radio" name="isshow" id="optionsRadios1" value="1" ${ads.isshow==1 ? 'checked' : '' }>
							显示
						  </label>
						  <label>
							<input type="radio" name="isshow" id="optionsRadios1" value="0" ${ads.isshow==0 ? 'checked' : '' }>
							关闭
						  </label>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">排序</label>
						<div class="col-sm-1">
						  <input type="text" class="form-control" id="mode_index" placeholder="" name="order" value="${empty ads.order ? '' : ads.order }">
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
