<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://www.jscms/mytag" %>
<aside>
		<section class="met_aside">
			<h2>${type.name }</h2>
			<div class="met_aside_list">
				<sql:loop select="pid=${type.id }" limit="" var="section" table="js_section" dselect="pid=0">
				<dl class="list-none navnow">
					<dt id="part2_4" class="${section.id == type.id ? 'on' : ''}">
						<a href="index.php?a=list&id=${section.id }" title="${section.name }" class="zm"><span>${section.name }</span></a>
					</dt>
					<sql:loop select="pid=${section.id }" limit="" var="subsec" table="js_section" >
					<dd class="sub">
						<h4 id="part3_14">
							<a href="index.php?a=list&id=${subsec.id }" title="${subsec.name }" class="nav"><span>${subsec.name }</span></a>
						</h4>
					</dd>
					</sql:loop>
					
				</dl>
				</sql:loop>
				<div class="met_clear"></div>
			</div>
		</section>
    </aside>
