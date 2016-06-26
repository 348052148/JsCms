<%@ page import="com.jscms.frame.JSUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="" style="width:300px;">
			<ul class="nav nav-pills nav-justified">
			  <li role="presentation" ><a href="<%=JSUtils.buildReqPath(request, "section", "index") %>">栏目列表</a></li>
			  <li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "section", "addSection") %>">新增栏目</a></li>
			</ul>
		</div>
		
		
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">新增栏目</h3>
			</div>
			<div class="panel-body">
			<c:choose>
				<c:when test="${empty requestScope.flag }">
				<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "section", "addSection") %>" >
				</c:when>
				<c:otherwise>
				<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "section", "editSection","&id=") %>${requestScope.data.edit.id }" >
				</c:otherwise>
			</c:choose>
					<div class="form-group">
						 <label for="mode_name" class="col-sm-1 control-label">所属频道</label>
						<div class="col-sm-1">
						  <select class="form-control" name="mid">
						  <c:forEach begin="0" items="${requestScope.data.molds }" var="mold" >
						  	<c:choose>
							<c:when test="${empty requestScope.flag }" >
							  <option value="${mold.mid }:${mold.molds }:${mold.moldname }"  ><c:out value="${mold.moldname }" default="" /></option>
						  	</c:when>
						  	<c:otherwise>
						  		<c:choose>
						  		<c:when test="${requestScope.data.edit.mid == mold.mid }">
						  			<option value="${mold.mid }:${mold.molds }:${mold.moldname }" selected="selected" ><c:out value="${mold.moldname }" default="" /></option>
						  		</c:when>
						  		<c:otherwise>
						  			<option value="${mold.mid }:${mold.molds }:${mold.moldname }"  ><c:out value="${mold.moldname }" default="" /></option>
						  		</c:otherwise>
						  		</c:choose>
						  	</c:otherwise>
						  	</c:choose>
						  </c:forEach>
						  </select>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_flag" class="col-sm-1 control-label">上级栏目</label>
						<div class="col-sm-2">
						  <select class="form-control" name="pid" >
							  <option value="0" >作为顶级栏目</option>
							  <c:forEach begin="0" items="${requestScope.data.sections }" var="section" >
							  <c:choose>
								<c:when test="${empty requestScope.flag }" >
									<c:choose>
										<c:when test="${empty requestScope.data.pid }">
											<option value="${section.id }" ><c:out value="${section.name }" default="" /></option>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${requestScope.data.pid==section.id }">
													<option value="${section.id }" selected="selected" ><c:out value="${section.name }" default="" /></option>	
												</c:when>
												<c:otherwise>
													<option value="${section.id }" ><c:out value="${section.name }" default="" /></option>
												</c:otherwise>
											</c:choose>
											
										</c:otherwise>
									</c:choose>
							  		
							  	</c:when>
							  	<c:otherwise>
							  		<c:choose>
							  		<c:when test="${section.id == requestScope.data.edit.pid }">
							  			<option value="${section.id }" selected="selected" ><c:out value="${section.name }"  default="" /></option>
							  		</c:when>
							  		<c:otherwise>
							  			<option value="${section.id }" ><c:out value="${section.name }" default="" /></option>
							  		</c:otherwise>
							  		</c:choose>
							  	</c:otherwise>
							  </c:choose>
							  </c:forEach>
						  </select>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">栏目名称</label>
						<div class="col-sm-2">
						  
						  <c:choose>
							<c:when test="${empty requestScope.flag }" >
						  		<input type="text" class="form-control" id="mode_index" placeholder="" name="name" >
						  	</c:when>
						  	<c:otherwise>
						  		<input type="text" class="form-control" id="mode_index" placeholder="" name="name" value="${requestScope.data.edit.name }" >
						  	</c:otherwise>
						  	</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">栏目简介</label>
						<div class="col-sm-3">
							<c:choose>
							<c:when test="${empty requestScope.flag }" >
						  		<textarea class="form-control" rows="4" name="about"></textarea>
						  	</c:when>
						  	<c:otherwise>
						  		<textarea class="form-control" rows="4" name="about" >${requestScope.data.edit.about }</textarea>
						  	</c:otherwise>
						  	</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">默认栏目首页</label>
						<div class="col-sm-4">
							<c:choose>
							<c:when test="${empty requestScope.flag }" >
								<input type="radio" name="dindex" id="optionsRadios1" value="1" checked>
								栏目列表(文字)(显示所有内容文字格式列表)<br/>
								<input type="radio" name="dindex" id="optionsRadios1" value="2" checked>
								栏目列表(图片)(显示所有内容图片格式列表)<br/>
								<input type="radio" name="dindex" id="optionsRadios1" value="3" checked>
								自定义首页(显示自定义的首页)
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${requestScope.data.edit.dindex == 1 }">
										<input type="radio" name="dindex" id="optionsRadios1" value="1" checked>
										栏目列表(文字)(显示所有内容文字格式列表)<br/>
										<input type="radio" name="dindex" id="optionsRadios1" value="2" >
										栏目列表(图片)(显示所有内容图片格式列表)<br/>
										<input type="radio" name="dindex" id="optionsRadios1" value="3" >
										自定义首页(显示自定义的首页)
									</c:when>
									<c:when test="${requestScope.data.edit.dindex == 2 }">
										<input type="radio" name="dindex" id="optionsRadios1" value="1" >
										栏目列表(文字)(显示所有内容文字格式列表)<br/>
										<input type="radio" name="dindex" id="optionsRadios1" value="2" checked>
										栏目列表(图片)(显示所有内容图片格式列表)<br/>
										<input type="radio" name="dindex" id="optionsRadios1" value="3" >
										自定义首页(显示自定义的首页)
									</c:when>
									<c:otherwise>
										<input type="radio" name="dindex" id="optionsRadios1" value="1" >
										栏目列表(文字)(显示所有内容文字格式列表)<br/>
										<input type="radio" name="dindex" id="optionsRadios1" value="2" >
										栏目列表(图片)(显示所有内容图片格式列表)<br/>
										<input type="radio" name="dindex" id="optionsRadios1" value="3" checked>
										自定义首页(显示自定义的首页)
									</c:otherwise>
								</c:choose>
							</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">是否菜单显示</label>
						<div class="col-sm-4">
						<c:choose>
							<c:when test="${empty requestScope.flag }" >
							  <label>
								<input type="radio" name="isshow" id="optionsRadios1" value="1" >
								是
							  </label>
							  <label>
								<input type="radio" name="isshow" id="optionsRadios1" value="0" checked>
								否
							  </label>
						  </c:when>
						  <c:otherwise>
						  	  <c:choose>
						  		<c:when test="${requestScope.data.edit.isshow ==1 }">
								  	<label>
									<input type="radio" name="isshow" id="optionsRadios1" value="1" checked >
									是
								  </label>
								  <label>
									<input type="radio" name="isshow" id="optionsRadios1" value="0" >
									否
								  </label>
								</c:when>
								<c:otherwise>
									<label>
									<input type="radio" name="isshow" id="optionsRadios1" value="1" >
									是
								  </label>
								  <label>
									<input type="radio" name="isshow" id="optionsRadios1" value="0" checked >
									否
								  </label>
								</c:otherwise>
							  </c:choose>
						  </c:otherwise>
						  </c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">排序</label>
						<div class="col-sm-1">
						<c:choose>
						<c:when test="${empty requestScope.flag }">
						  	<input type="text" class="form-control" id="mode_index" placeholder="" name="order" >
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control" id="mode_index" placeholder="" name="order" value="${requestScope.data.edit.order }" >
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
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/bootstrap.min.js"></script>
  </body>
</html>
