<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="sql" uri="http://www.jscms/mytag" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<div class="comment">
         <div class="t c">文章评论</div>
         <div class="i c">
         

         <form method="post" action="" name="comment" >
         <input name="tid" type="hidden" value="${content.id }" />
         <input name="title" type="hidden" value="${content.title }" />
         <input name="sname" type="hidden" value="${type.name }" />
         <dl><dt>内容:</dt><dd><textarea name="content" id="content" style="width:500px; height:50px;" class="inp"></textarea></dd></dl>
         <dl>
         
         <dt>&nbsp;</dt>
         
         <dd><button  value="提交" class="btnmini" onclick="ajax_comment_insert('comment')" ></button></dd></dl>
         </form>
         </div>
         <script type="text/javascript">
         	function ajax_comment_insert(id){
         		var content = $("#content").val();
        		$.ajax({
        			url: 'index.php?a=addComment&c=comment',type: 'post',
        			cache: false,
        			data: "tid="+"${content.id }"+"&title="+"${content.title }"+"&sname="+"${type.name }"+"&content="+content,
        			success: function(data){
        				alert(data);
        				// location.reload();
        			}
        		});
        	}
         </script>
         <div id="comment">
         	
         	<div class="list">
			<sql:loop var="comment" table="js_comment" select="tid=${content.id } and isshow=1">
			<dl><dt>
			<c:choose>
							<c:when test="${comment.uid >0 }">
						  		<label >用户：</label><a class="info" ><c:out value="${comment.uid }" default=""/></a>
						  	</c:when>
						  	<c:otherwise>
						  		<label >用户：</label><a class="info" ><c:out value="游客" default=""/></a>
						  	</c:otherwise>
			</c:choose>
			 在 ${comment.atime } 评论：</dt>
			<dd>${comment.content }<br /></dd></dl>
			</sql:loop>
			</div>
			<ul class="c pages"></ul>
			
         </div>
       </div>
