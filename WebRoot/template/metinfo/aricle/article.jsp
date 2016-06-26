<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>about</title>
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
				<h1>${type.name }</h1>
				<div class="met_position">
					${positions }
				</div>
			</section>

			<div class="met_clear"></div>

	        <div class="met_editor met_module1">
			    <div>
			    	<div>
			    	<span style="line-height: 2;">
			    		<img src="images/about_title.gif" style="width: 200px; height: 200px; margin: 15px; float: right;" alt="图片关键词">&nbsp; &nbsp; &nbsp; &nbsp;我们专注于网络信息化及网络营销领域，通过整合团队专业的市场营销理念与网络技术为客户提供优质的网络营销服务。
			    		</span>
			    	</div>
			    	<div>&nbsp;</div>
			    	<div>&nbsp; &nbsp; &nbsp; &nbsp;我们的主要业务包括：网站系统开发、网站建设、网站推广、空间域名以及网络营销策划与运行。</div>
			    	<div>&nbsp;</div>
			    	<div>&nbsp; &nbsp; &nbsp; &nbsp;我们主打产品——MetInfo企业网站管理系统采用PHP+Mysql架构，全站内置了SEO搜索引擎优化机制，支持用户自定义界面语言，拥有企业网站常用的模块功能（企业简介模块、新闻模块、产品模块、下载模块、图片模块、招聘模块、在线留言、反馈系统、在线交流、友情链接、会员与权限管理）。强大灵活的后台管理功能、静态页面生成功能、个性化模块添加功能、不同栏目自定义FLASH样式功能等可为企业打造出大气漂亮且具有营销力的精品网站。</div>
			    	<div>&nbsp;</div>
			    	<div>&nbsp; &nbsp; &nbsp; &nbsp;我们秉承“为合作伙伴创造价值”的核心价值观，并以“诚实、宽容、创新、服务”为企业精神，通过自主创新和真诚合作为电子商务及信息服务行业创造价值。</div>
			    	<div>&nbsp;</div>
			    	<div>
			    		<span style="line-height: 2;">&nbsp; &nbsp; &nbsp; &nbsp;</span>
			    		<strong><span style="font-size: 13px">关于“为合作伙伴创造价值”</span></strong>
			    	</div>
			    	<div>&nbsp; &nbsp; &nbsp; &nbsp;我们认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。</div>

				<div class="clear"></div>
			</div>

		</div>
    </article>
    <div class="met_clear"></div>
</section>

<%@include file="../bottom.jsp" %>

</body>
</html>