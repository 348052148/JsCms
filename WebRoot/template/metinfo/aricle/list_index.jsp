<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- saved from url=(0030)http://localhost/metinfo/news/ -->
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>news</title>
	<meta name="description" content="">
	<meta name="keywords" content="网站关键词">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">

	<link rel="stylesheet" type="text/css" href="skin/metinfo/css/metinfo.css">
	<!--[if IE]><script src="../public/js/html5.js" type="text/javascript"></script><![endif]-->
</head>
<body>
    
    <%@include file="../head.jsp" %>
    
	<div class="tem_banner">
	
		<div class="flash">
			<img src="skin/metinfo/images/about_banner.jpg" width="980" alt="示例图片三" height="300">
		</div>

	</div>

<section class="met_section  ">


    <%@include file="../left.jsp" %>

    <article>
		<div class="met_article">

			<section class="met_article_head">
				<h1>新闻资讯</h1>
				<div class="met_position">
					${positions }
				</div>
			</section>

			<div class="met_clear"></div>

	        <div class="met_module2_list">
				<ul>
				   <c:forEach begin="0" items="${lists }" var="content">
			       		<li class="list_1">					
							<h2>
								<a href="index.php?a=content&aid=${content.id}&id=${type.id}" title="标题" target="_self"><i class="fa fa-caret-right"></i>${content.title }</a>
							</h2>					
							<span class="time">${content.addtime }</span>
						</li>
			       </c:forEach>
				</ul>
				
			    <div class="met_pager">			
					<span class="PreSpan">上一页</span>				
				    <a href="news.htm" class="Ahover">1</a> 
			        <a href="#">2</a> 
			       	<a href="#" class="NextA">下一页</a>				
				    <span class="PageText">转至第</span>
				    <input type="text" id="metPageT" data-pageurl="#" value="1">
				    <input type="button" id="metPageB" value="页">
			    </div>
			</div>

		</div>
    </article>
    <div class="met_clear"></div>
</section>

<%@include file="../bottom.jsp" %>

</body>
</html>