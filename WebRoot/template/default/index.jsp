<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${webInfo.title }</title>
<meta name="keywords" content="${webInfo.keywords }" />
<meta name="description" content="${webInfo.desc }" />
<link href="skin/default/style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var site_dir="${webInfo.url }";
</script>
<script type="text/javascript" src="skin/default/include/js/jsmain.js"></script>
<script src="skin/default/js/main.js" type="text/javascript"></script>
<script type="text/javascript" src="skin/default/js/product.js"></script>
</head>

<body>




<%@include file="head.jsp" %>






<div class="wpm">
  <div class="tab1 tab1b">
	<div id="top_banner" >
		 <ul class="slider" >
         	<sql:loop var="ads" table="js_ads" select="taid=1">
				<li><img src="${ads.adfile }"></li>
			</sql:loop>
		  </ul>
		  <ul class="num" >
			<li>1</li>
			<li>2</li>
			<li>3</li>
		  </ul>
	</div>
  </div>
  <div class="bannerb"></div>
</div>
<div class="wpm">
  <div class="tab495">
  	<div class="type">
    <p class="l"></p><p class="c f1">公司动态<span>Company News</span></p><p class="r"></p><a href="index.php?a=list&id=15"></a>
    </div>
	<div class="tab4 news">
	  <div class="l">
        <div id="new_banner" >
             <ul class="slider" >
             
                <li><img src="{$v['litpic']}"></li>
               
              </ul>
              <ul class="num" >
                <li>1</li>
                <li>2</li>
                <li>3</li>
              </ul>
        </div>
      </div>
      <ul class="r">
		<sql:loop var="aricle" table="js_aricle" select="sid=15">
			<li><a href="index.php?a=content&aid=${aricle.id}&id=15" target="_blank" >${aricle.title }</a></li>
		</sql:loop>
      </ul>
	</div>
	<div class="tab42"></div>
  </div>
  <div class="tab475">
  
  	<div class="type">
    <p class="l"></p><p class="c f1">关于我们<span>About Us</span></p><p class="r"></p><a href="index.php?a=list&id=18"></a>
    </div>
	<div class="tab5 about">
        <div class="l"><img src="{$v['litpic']}" width="180" height="150" /></div>
        <sql:loop var="about" table="js_section" select="id=18">
        	<div class="r">${about.about }<a href="index.php?a=list&id=18">[详细]</a></div>
        </sql:loop>
    </div>
	<div class="tab52"></div>
  
  </div>

  <div class="tab980">
  	<div class="type">
    <p class="l"></p><p class="c f1">商品中心<span>Product Center</span></p><p class="r"></p><a href="index.php?a=list&id=16"></a>
    </div>
	<div class="tab1 tab1b">
        <div class="product">
            <div class="wrapper">
              <ul>
				<sql:loop var="produce" table="js_produce" select="sid=16 and isshow=1" joinSql="join js_produce_field on js_produce.id=js_produce_field.cid">
				<li><a href="index.php?a=content&aid=${produce.id}&id=16" target="_blank" style=""><img src="${produce.litpic }" /><p>${produce.title }</p></a></li>
				</sql:loop>
              </ul>        
            </div>
        </div>
    </div>
	<div class="tab12"></div>
  </div>
  
  <div class="tab220">
  	<div class="type">
    <p class="l"></p><p class="c f1">联系我们<span>Contact Us</span></p><p class="r"></p><a href="index.php?a=list&id=19"></a>
    </div>
	<div class="tab3 contact">
		<div class="t"><img src="{$GLOBALS['skin']}images/cu.jpg" width="200" height="70" /></div>
        <ul class="b">
            <li><span>Tel :</span><p>18523922709</p></li>
            <li><span>Email :</span><p>hi@jscms.com</p></li>
            <li><span>QQ :</span><p>348052148</p></li>
        </ul>
    </div>
	<div class="tab32"></div>
  </div>
  <div class="tab750">
  	<div class="type">
    <p class="l"></p><p class="c f1">服务案例<span>Service Case</span></p><p class="r"></p><a href="index.php?a=list&id=17"></a>
    </div>
	<div class="tab2">
        <ul class="case">
			<sql:loop var="fuwu" table="js_aricle" select="sid=17">
				<li><a href="index.php?a=content&id=17&aid=${fuwu.id }" target="_blank" style=""><img src="{$v['litpic']}" /><p>${fuwu.title }</p></a></li>
			</sql:loop>
        </ul> 
    </div>
	<div class="tab22"></div>
  </div>

</div>
<div class="wp">
  <div class="links">友情链接：

<a href="{$v['gourl']}" target="_blank">{$v['name']}</a>

  </div>
</div>




<%@include file="bottom.jsp" %>

</body>
</html>
