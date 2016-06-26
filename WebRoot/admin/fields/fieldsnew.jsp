<%@page import="com.jscms.frame.JSUtils"%>
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
			  <li role="presentation" ><a href="<%=JSUtils.buildReqPath(request, "fields", "index") %>&molds=${requestScope.molds}">字段列表</a></li>
			  <li role="presentation" class="active" ><a href="<%=JSUtils.buildReqPath(request, "fields", "addFields") %>&molds=${requestScope.molds}">新增字段</a></li>
			</ul>
		</div>
		
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">新增栏目</h3>
			</div>
			<div class="panel-body">
			<c:choose>
				<c:when test="${empty requestScope.edit}">
					<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "fields", "addFields") %>&molds=${requestScope.molds}" >
				</c:when>
				<c:otherwise>
					<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "fields", "editFields") %>&molds=${requestScope.molds}&fid=${requestScope.fid}" >
				</c:otherwise>
			</c:choose>
				
					<div class="form-group">
						 <label for="mode_name" class="col-sm-1 control-label">开启栏目</label>
						<div class="col-sm-1">
							<c:forEach begin="0" items="${requestScope.sectionList }" var="section">
								<div class="checkbox">
								  <label>
								  	<c:choose>
								  		<c:when test="${empty requestScope.fields.include }">
								  			<input type="checkbox" name="include" value="${section.id }">
											<c:out value="${section.name }" />
								  		</c:when>
								  		<c:otherwise>
								  			
								  			<input type="checkbox" name="include" value="${section.id }" ${section.msg }>
											<c:out value="${section.name }" />
								  		</c:otherwise>
								  	</c:choose>
									
								  </label>
							    </div>
							</c:forEach>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">字段名称</label>
						<div class="col-sm-2">
							<c:choose>
								<c:when test="${empty requestScope.fields.fieldname }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="fieldname">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="fieldname" value="${requestScope.fields.fieldname }">
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">字段标识</label>
						<div class="col-sm-2">
							<c:choose>
								<c:when test="${empty requestScope.fields.fields }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="fields">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="fields" value="${requestScope.fields.fields }">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">字段类型</label>
						<div class="col-sm-2">
						  <label>
						  <c:choose>
						  	<c:when test="${requestScope.fields.fieldtype=='medText' }">
						  		<input type="radio" name="fieldtype" id="optionsRadios1" value="medText" checked>
								中小型文本varchar
						  	</c:when>
						  	<c:otherwise>
						  		<input type="radio" name="fieldtype" id="optionsRadios1" value="medText" >
								中小型文本varchar
						  	</c:otherwise>
						  </c:choose>
							
						  </label></br>
						  <label>
						  	<c:choose>
						  		<c:when test="${requestScope.fields.fieldtype=='bigText' }">
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="bigText" checked>
									大型文本
						  		</c:when>
						  		<c:otherwise>
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="bigText" >
									大型文本
						  		</c:otherwise>
						  	</c:choose>
							
						  </label></br>
						  <label>
						  	<c:choose>
						  		<c:when test="${requestScope.fields.fieldtype=='Int' }">
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="Int" checked>
									整数类型
						  		</c:when>
						  		<c:otherwise>
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="Int" >
									整数类型
						  		</c:otherwise>
						  	</c:choose>
						  </label></br>
						  <label>
						  	<c:choose>
						  		<c:when test="${requestScope.fields.fieldtype=='Curr' }">
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="Curr" checked>
									货币
						  		</c:when>
						  		<c:otherwise>
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="Curr" >
									货币
						  		</c:otherwise>
						  	</c:choose>
							
						  </label></br>
						  <label>
						  	<c:choose>
						  		<c:when test="${requestScope.fields.fieldtype=='Time' }">
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="Time" checked>
									时间
						  		</c:when>
						  		<c:otherwise>
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="Time" >
									时间
						  		</c:otherwise>
						  	</c:choose>
							
						  </label></br>
						  <label>
						  	<c:choose>
						  		<c:when test="${requestScope.fields.fieldtype=='Atta' }">
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="Atta" checked>
									附件
						  		</c:when>
						  		<c:otherwise>
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="Atta" >
									附件
						  		</c:otherwise>
						  	</c:choose>
							
						  </label></br>
						  <label>
						  	<c:choose>
						  		<c:when test="${requestScope.fields.fieldtype=='Radio' }">
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="Radio" checked>
									单选
						  		</c:when>
						  		<c:otherwise>
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="Radio" >
									单选
						  		</c:otherwise>
						  	</c:choose>
							
						  </label></br>
						  <label>
						  	<c:choose>
						  		<c:when test="${requestScope.fields.fieldtype=='Check' }">
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="Check" checked>
									多选
						  		</c:when>
						  		<c:otherwise>
						  			<input type="radio" name="fieldtype" id="optionsRadios1" value="Check" >
									多选
						  		</c:otherwise>
						  	</c:choose>
							
						  </label></br>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">是否开启</label>
						<div class="col-sm-4">
						<c:choose>
								<c:when test="${requestScope.fields.isshow==1 }">
									<label>
										<input type="radio" name="isshow" id="optionsRadios1" value="1" checked>
										开启
									  </label>
									  <label>
										<input type="radio" name="isshow" id="optionsRadios1" value="0" >
										关闭
									  </label>
								</c:when>
								<c:otherwise>
									<label>
										<input type="radio" name="isshow" id="optionsRadios1" value="1" >
										开启
									  </label>
									  <label>
										<input type="radio" name="isshow" id="optionsRadios1" value="0" checked>
										关闭
									  </label>
								</c:otherwise>
						</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">字段长度</label>
						<div class="col-sm-1">
							<c:choose>
								<c:when test="${empty requestScope.fields.longs }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="longs">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="longs" value="${requestScope.fields.longs }">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">排序</label>
						<div class="col-sm-1">
							<c:choose>
								<c:when test="${empty requestScope.fields.order }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="order">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="order" value="${requestScope.fields.order }">
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