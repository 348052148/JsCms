<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://www.jscms/mytag" %>
<div class="wpa head">
  <div class="wp">
    <dl class="a"><img src="skin/default/images/logo.jpg" /></dl><dl class="b"></dl>
    <dl class="c">
    <script type="text/javascript">member_login('member_login','member/ajax_login.html');</script>
      <p class="i" id="member_login"></p>
      <form action="{$GLOBALS['WWW']}index.php" method="get">
      <input name="a" type="hidden" value="search" />
      <p class="s"><span class="ll"><select name="c">
        <option value="article" selected="selected">文章</option>
        <option value="product">产品</option>
      </select></span><span class="l"><input type="text" name="word" /></span><span class="r"><input type="submit" value=""/></span></p>
      </form>
    </dl>
  </div>
  <div class="wp menu f1">
  <a href="index.php" class="c">首 页</a>
  <sql:loop limit="7" table="js_section" var="section" select="pid=0">
	<a href="index.php?a=list&id=${section.id }">${section.name }</a>
  </sql:loop>
  
  </div>
</div>
