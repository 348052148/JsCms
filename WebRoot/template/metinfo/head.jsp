<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="sql" uri="http://www.jscms/mytag" %>
<header data-waypointsok="0">
		<div class="tem_inner tem_head">
			<h2>
				<a href="#" title="网站名称">
					<img src="skin/metinfo/images/logo.png" alt="网站名称" style="margin:20px 0px 0px 0px;" title="网站名称">
				</a>
			</h2>

			<nav>
				<ul>
					<li><a href="index.php" title="网站首页" class="navdown">网站首页</a></li>
				
				<sql:loop limit="7" table="js_section" var="section" select="pid=0">
					<li>
						<a href="index.php?a=list&id=${section.id }" title="关于我们">${section.name }</a>
					</li>
				</sql:loop>
					

				</ul>
			</nav>
		</div>

	</header>
	
