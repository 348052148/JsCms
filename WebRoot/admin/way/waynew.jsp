<%@page import="com.jscms.frame.JSUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="<%=JSUtils.staticAdminRsPath(request) %>css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=JSUtils.staticAdminRsPath(request) %>css/bootstrap-datetimepicker.min.css"/>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="<%=JSUtils.staticAdminRsPath(request) %>js/jquery.min.js"></script>
   
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
			  <li role="presentation" ><a href="<%=JSUtils.buildReqPath(request, "way", "index") %>&mold=${requestScope.data.mold}"><c:out value="${requestScope.data.mname }" />列表</a></li>
			  <li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "way", "addWay") %>&mold=${requestScope.data.mold}">新增<c:out value="${requestScope.data.mname }" /></a></li>
			</ul>
		</div>
	
		<div class="panel panel-default">
			<div class="">
				<div class="" style="width:300px;">
					
					<ul class="nav nav-tabs nav-justified">
					<c:choose>
						<c:when test="${empty requestScope.edit.id }">
							<c:choose>
								<c:when test="${empty requestScope.data.body }">
									<li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "way", "addWay") %>&mold=${requestScope.data.mold}">基本设置</a></li>
				      				<li role="presentation"><a href="<%=JSUtils.buildReqPath(request, "way", "addWay") %>&mold=${requestScope.data.mold}&body=1">内容编辑</a></li>
								</c:when>
								<c:otherwise>
									<li role="presentation" ><a href="<%=JSUtils.buildReqPath(request, "way", "addWay") %>&mold=${requestScope.data.mold}">基本设置</a></li>
				      				<li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "way", "addWay") %>&mold=${requestScope.data.mold}&body=1">内容编辑</a></li>
								</c:otherwise>
							</c:choose>
				      	
				    	</c:when>
				    	<c:otherwise>
				    	<c:choose>
				    		<c:when test="${empty requestScope.data.body }">
				    			<li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "way", "editWay") %>&mold=${requestScope.data.mold}&id=${requestScope.edit.id}">基本设置</a></li>
				      			<li role="presentation"><a href="<%=JSUtils.buildReqPath(request, "way", "editWay") %>&mold=${requestScope.data.mold}&body=1&id=${requestScope.edit.id}">内容编辑</a></li>
				    		</c:when>
				    		<c:otherwise>
				    			<li role="presentation" ><a href="<%=JSUtils.buildReqPath(request, "way", "editWay") %>&mold=${requestScope.data.mold}&id=${requestScope.edit.id}">基本设置</a></li>
				      			<li role="presentation" class="active"><a href="<%=JSUtils.buildReqPath(request, "way", "editWay") %>&mold=${requestScope.data.mold}&body=1&id=${requestScope.edit.id}">内容编辑</a></li>
				    		</c:otherwise>
				    	</c:choose>
				    	
				    	</c:otherwise>
				    </c:choose>
				    </ul>
			   </div>
			</div>
			
			
			<div class="panel-body">
			<c:choose>
				<c:when test="${empty requestScope.data.body }">
					<c:choose>
					<c:when test="${empty requestScope.edit.id }">
						<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "way", "addWayHandule") %>&mold=${requestScope.data.mold}" >
					</c:when>
					<c:otherwise>
						<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "way", "addWayHandule") %>&mold=${requestScope.data.mold}&id=${requestScope.edit.id}" >
					</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:choose>
					<c:when test="${empty requestScope.edit.id }">
						<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "way", "addWayBodyHandule") %>&mold=${requestScope.data.mold}" >
					</c:when>
					<c:otherwise>
						<form class="form-horizontal" method="post" action="<%=JSUtils.buildReqPath(request, "way", "addWayBodyHandule") %>&mold=${requestScope.data.mold}&id=${requestScope.edit.id}" >
					</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
				
				
				<c:choose>
					<c:when test="${empty requestScope.data.body }">
					
					
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">外部链接</label>
						<div class="col-sm-2">
						<c:choose>
							<c:when test="${empty requestScope.edit.url }">
								<input type="text" class="form-control" id="mode_index" placeholder="" name="url">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" id="mode_index" placeholder="" name="url" value="${requestScope.edit.url }">
							</c:otherwise>
						</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">关键词</label>
						<div class="col-sm-2">
						  <c:choose>
							<c:when test="${empty requestScope.edit.keyword }">
								<input type="text" class="form-control" id="mode_index" placeholder="" name="keyword">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" id="mode_index" placeholder="" name="keyword" value="${requestScope.edit.keyword }">
							</c:otherwise>
						 </c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">更新时间</label>
						<div class="col-sm-2 ">
							<c:choose>
								<c:when test="${empty requestScope.edit.modifytime }">
									<!--  <input type="text" class="form-control" id="mode_index" placeholder="" name="modifytime">-->
					                    <input class="form-control form_datetime" placeholder="" type="text" name="modifytime" value="" readonly>
								</c:when>
								<c:otherwise>
									<input class="form-control form_datetime" placeholder="" type="text" name="modifytime" value="${requestScope.edit.modifytime }" readonly>
									
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">点击次数</label>
						<div class="col-sm-1">
							<c:choose>
								<c:when test="${empty requestScope.edit.hits }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="hits">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="hits" value="${requestScope.edit.hits }">
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">简介</label>
						<div class="col-sm-3">
							<c:choose>
								<c:when test="${empty requestScope.edit.desc }">
									<textarea class="form-control" rows="4" name="desc"></textarea>
								</c:when>
								<c:otherwise>
									<textarea class="form-control" rows="4" name="desc" ><c:out value="${requestScope.edit.desc }" /></textarea>
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">审核</label>
						<c:choose>
							<c:when test="${empty requestScope.edit.isshow }">
								<div class="col-sm-4">
								  <label>
									<input type="radio" name="isshow" id="optionsRadios1" value="1" checked>
									已审
								  </label>
								  <label>
									<input type="radio" name="isshow" id="optionsRadios1" value="0" checked>
									未审
								  </label>
								</div>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${requestScope.edit.isshow==1 }">
										<div class="col-sm-4">
										  <label>
											<input type="radio" name="isshow" id="optionsRadios1" value="1" checked>
											已审
										  </label>
										  <label>
											<input type="radio" name="isshow" id="optionsRadios1" value="0" >
											未审
										  </label>
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-sm-4">
										  <label>
											<input type="radio" name="isshow" id="optionsRadios1" value="1" >
											已审
										  </label>
										  <label>
											<input type="radio" name="isshow" id="optionsRadios1" value="0" checked>
											未审
										  </label>
										</div>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">排序</label>
						<div class="col-sm-1">
							<c:choose>
								<c:when test="${empty requestScope.edit.order }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="order">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="order" value="${requestScope.edit.order }" >
								</c:otherwise>
							</c:choose>
						  
						</div>
					</div>
					</c:when>
					<c:otherwise>
						<div class="form-group">
						 <label for="mode_name" class="col-sm-1 control-label">所属栏目</label>
						<div class="col-sm-2">
							  <select class="form-control lanmu" name="sid" >
							  <c:choose>
							  	<c:when test="${empty requestScope.edit.sid }">
							  		<c:forEach begin="0" items="${requestScope.sectionList }" var="section" >
							  		
							  			<c:choose>
							  				<c:when test="${section.id==requestScope.sid }">
							  					<option value="${section.id }" selected="selected" ><c:out value="${section.name }" default="" /></option>
							  				</c:when>
							  				<c:otherwise>
							  					<option value="${section.id }" ><c:out value="${section.name }" default="" /></option>
							  				</c:otherwise>
							  			</c:choose>
								  		
								  	</c:forEach>
							  	</c:when>
							  	<c:otherwise>
							  		<c:forEach begin="0" items="${requestScope.sectionList }" var="section" >
							  			<c:choose>
							  				<c:when test="${section.id==requestScope.edit.sid }">
							  					<option value="${section.id }" selected="selected" ><c:out value="${section.name }" default="" /></option>
							  				</c:when>
							  				<c:otherwise>
							  					<c:choose>
							  					<c:when test="${section.id==requestScope.sid }">
							  						<option value="${section.id }" selected="selected"><c:out value="${section.name }" default="" /></option>
							  					</c:when>
							  					<c:otherwise>
							  						<option value="${section.id }" ><c:out value="${section.name }" default="" /></option>
							  					</c:otherwise>
							  					</c:choose>
							  				</c:otherwise>
							  			</c:choose>
								  		
								  	</c:forEach>
							  	</c:otherwise>
							  </c:choose>
							  
							  </select>
							</div>
						</div>
						<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">标题</label>
						<div class="col-sm-6">
							<c:choose>
								<c:when test="${empty requestScope.edit.title }">
									<input type="text" class="form-control" id="mode_index" placeholder="" name="title" >
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="mode_index" placeholder="" name="title" value="${requestScope.edit.title }" >
								</c:otherwise>
							</c:choose>
						  
						</div>
						</div>
						<input type="hidden" name="field_cid" value="${requestScope.edit.id }"/>
						<%--自定义字段 --%>
						<c:forEach begin="0" items="${requestScope.fieldList }" var="field">
						<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">${field.fieldname }</label>
						
						<c:choose>
							<c:when test="${field.fieldtype=='medText' }">
								<div class="col-sm-2">
								<textarea class="form-control" rows="4" name="field_${field.fields }" >${field.value }</textarea>
								</div>
							</c:when>
							<c:when test="${field.fieldtype=='bigText' }">
								<div class="col-sm-2">
									<jsp:include page="/admin/um.jsp"></jsp:include>
								</div>
							</c:when>
							<c:when test="${field.fieldtype=='Int' }">
								<div class="col-sm-1">
								<c:set var="fieldName" value="${field.fields }" scope="request"></c:set>
								<input type="text" class="form-control" id="mode_index" placeholder="" name="field_${field.fields }" value="<%=JSUtils.buildValueForHashMap(request, "edit", "fieldName") %>" >
								</div>
							</c:when>
							<c:when test="${field.fieldtype=='Curr' }">
								<div class="col-sm-2">
								<input type="text" class="form-control" id="mode_index" placeholder="" name="field_${field.fields }" value="" >
								</div>
							</c:when>
							<c:when test="${field.fieldtype=='Time' }">
								<div class="col-sm-3">
								<input class="form-control form_datetime" placeholder="" type="text" name="modifytime" value="" >
								</div>
							</c:when>
							<c:when test="${field.fieldtype=='Atta' }">
								<div class="col-sm-3">
								<!-- 
								<input type="file" class="form-control" id="mode_index" placeholder="" name="field_${field.fields }" value="" >
								 -->
								  <c:set var="fieldName" value="${field.fields }" scope="request"></c:set>
								  
								 <%=JSUtils.buildUploadHtml(request.getAttribute("fieldName").toString(),JSUtils.buildValueForHashMap(request, "edit", "fieldName"),true) %>
								 
								</div>
							</c:when>
							<c:when test="${field.fieldtype=='Radio' }">
								<div class="col-sm-2">
									<label>
									<input type="radio" name="field_${field.fields }" id="optionsRadios1" value="" >
									</label>
								</div>
							</c:when>
							<c:when test="${field.fieldtype=='Check' }">
								<div class="col-sm-2">
								<div class="checkbox">
									  <label>
									  <input type="checkbox" name="field_${field.fields }" value="">
									  </label>
								  </div>
								</div>
							</c:when>
						</c:choose>
						
						
						</div>
						</c:forEach>
						
						
						
						
						<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">内容</label>
						<div class="col-sm-2">
							<jsp:include page="/admin/um.jsp"></jsp:include>
						</div>
						</div>
					</c:otherwise>
					</c:choose>
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
    <script type="text/javascript" src="<%=JSUtils.staticAdminRsPath(request) %>js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="<%=JSUtils.staticAdminRsPath(request) %>js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
    <script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
    function jump(url){
    	alert('xxx');
    	window.location.href=url;
    }
    $('.lanmu').change(function(){
    	 var sid=$(this).val();
    	<c:choose>
 		<c:when test="${empty requestScope.edit.id }">
 		var str='<%=JSUtils.buildReqPath(request, "way", "addWay") %>&mold=${requestScope.data.mold}&body=1'+'&sid='+sid;
    	</c:when>
    	<c:otherwise>
    	 
    	 var str='<%=JSUtils.buildReqPath(request, "way", "editWay") %>&mold=${requestScope.data.mold}&body=1&id=${requestScope.edit.id}'+'&sid='+sid;
    	</c:otherwise>
    	</c:choose>
    	 window.location.href=str;
    });
	</script> 
  </body>
</html>
