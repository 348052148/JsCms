<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${requestScope.opc == 'edit'}" >
		<form class="form-horizontal" action="?c=mold&a=addMold&op=update" method="post">
					<input type="hidden" name="mid" value="${requestScope.data.mid}" />
					<div class="form-group">
						 <label for="mode_name" class="col-sm-1 control-label">模型名称</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" id="mode_name" name="moldname" placeholder="" value="<c:out value="${requestScope.data.moldname}" default="" />">
						</div>
					</div>
					<div class="form-group">
						<label for="mode_flag" class="col-sm-1 control-label">模型标识</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" id="mode_flag" name="molds" placeholder="" value="<c:out value="${requestScope.data.molds }" default="" />">
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">自定义模板</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" id="mode_index" name="j_index" placeholder="" value="<c:out value="${requestScope.data.j_index }" default="" />">
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">列表模板(文字)</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" id="mode_index" name="j_list" placeholder="" value="<c:out value="${requestScope.data.j_list }" default="" />">
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">列表模板(图片)</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" id="mode_index" name="j_imglist" placeholder="" value="<c:out value="${requestScope.data.j_imglist }" default="" />" >
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">内容模板</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" id="mode_index" name="j_content" placeholder="" value="<c:out value="${requestScope.data.j_content }" default="" />" >
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">模型状态</label>
						<div class="col-sm-6">
						<c:choose>
							  <c:when test="${requestScope.data.isshow ==1}" >
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
						<label for="mode_index" class="col-sm-1 control-label">分页条数</label>
						<div class="col-sm-1">
						  <input type="text" class="form-control" id="mode_index" name="listnum" placeholder="" value="<c:out value="${requestScope.data.listnum}" default="" />">
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">排序</label>
						<div class="col-sm-1">
						  <input type="text" class="form-control" id="mode_index" name="order" placeholder="" value="<c:out value="${requestScope.data.order}" default="" />">
						</div>
					</div>
					<div class="form-group">
					<div class="col-sm-1"></div>
					<button type="submit" class="btn btn-default">提交</button>
					</div>
				</form>
		</c:when>
		<c:otherwise>
			<form class="form-horizontal" action="?c=mold&a=addMold&op=add" method="post">
					<div class="form-group">
						 <label for="mode_name" class="col-sm-1 control-label">模型名称</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" id="mode_name" name="moldname" placeholder="" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="mode_flag" class="col-sm-1 control-label">模型标识</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" id="mode_flag" name="molds" placeholder="" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">自定义模板</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" id="mode_index" name="j_index" placeholder="" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">列表模板(文字)</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" id="mode_index" name="j_list" placeholder="" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">列表模板(图片)</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" id="mode_index" name="j_imglist" placeholder="" value="" >
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">内容模板</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" id="mode_index" name="j_content" placeholder="" value="" >
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">模型状态</label>
						<div class="col-sm-6">
						
							  	  <label>
									<input type="radio" name="isshow" id="optionsRadios1" value="1" >
									开启
								  </label>
								  <label>
									<input type="radio" name="isshow" id="optionsRadios1" value="0" checked>
									关闭
								  </label>
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">分页条数</label>
						<div class="col-sm-1">
						  <input type="text" class="form-control" id="mode_index" name="listnum" placeholder="" >
						</div>
					</div>
					<div class="form-group">
						<label for="mode_index" class="col-sm-1 control-label">排序</label>
						<div class="col-sm-1">
						  <input type="text" class="form-control" id="mode_index" name="order" placeholder="" value="">
						</div>
					</div>
					<div class="form-group">
					<div class="col-sm-1"></div>
					<button type="submit" class="btn btn-default">提交</button>
					</div>
				</form>
		</c:otherwise>
</c:choose>