<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${page.title}</title>
<meta name="keywords" content="${page.keywords} " />
<meta name="description" content="${page.desc}" />
<link href="skin/default/style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var site_dir="${page.url}";
</script>
<script type="text/javascript" src="skin/default/include/js/jsmain.js"></script>
<script src="skin/default/js/main.js" type="text/javascript"></script>
<script type="text/javascript" src="skin/default/js/product.js"></script>
</head>

<body>
<%@include file="../head.jsp" %>
<div class="wpm list">
  <div class="tab11"></div>
  <div class="tab1 tab1b main">
    <div class="l">
      <div class="columnc"><h2>${type.name }</h2></div>
      <div class="columncl">
      <sql:loop select="pid=${type.id }" limit="" var="section" table="js_section" dselect="pid=0">
      <a href="index.php?a=list&id=${section.id }" class="c">${section.name } </a>
      </sql:loop>
      </div>
    </div>
    <div class="r">
    <div class="content">
       <div class="position">当前位置：${positions }</div>
       <div class="c f2">${type.about }</div>
    </div>
    </div>
  </div>
  <div class="tab12 mban"></div>
</div>
<%@include file="../bottom.jsp" %>
</body>
</html>
