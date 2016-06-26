<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
				  <ul class="pagination">
				  <%--上一页 --%>
				  	<c:choose>
				  		<c:when test="${requestScope.pageInfo.page == 1}">
				  			<li class="disabled"><a href="${requestScope.pageInfo.url}${requestScope.pageInfo.page-1}" aria-label="Previous"><span aria-hidden="true"><</span></a></li>
				  		</c:when>
				  		<c:otherwise>
				  			<li ><a href="${requestScope.pageInfo.url}${requestScope.pageInfo.page-1}" aria-label="Previous"><span aria-hidden="true"><</span></a></li>
				  		</c:otherwise>
				  	</c:choose>
					<%--数字 --%>
					<c:forEach begin="1" end="${requestScope.pageInfo.total}" varStatus="stat" >
						<c:choose>
						<c:when test="${requestScope.pageInfo.page == stat.count}">
							<li class="active"><a href="${requestScope.pageInfo.url}${stat.count}"><c:out value="${stat.count}" /><span class="sr-only">(current)</span></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${requestScope.pageInfo.url}${stat.count}"><c:out value="${stat.count}" /></a></li>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					<%-- 下一页--%>
				 	<c:choose>
				  		<c:when test="${requestScope.pageInfo.page >= requestScope.pageInfo.total}">
				  			<li class="disabled"><a href="${requestScope.pageInfo.url}${requestScope.pageInfo.page+1}" aria-label="Next"><span aria-hidden="true">></span></a></li>
				  		</c:when>
				  		<c:otherwise>
				  			<li><a href="${requestScope.pageInfo.url}${requestScope.pageInfo.page+1}" aria-label="Next"><span aria-hidden="true">></span></a></li>
				  		</c:otherwise>
				  	</c:choose>
				 </ul>
			   </nav>
