<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">  
        <meta http-equiv="pragma" content="no-cache" />  
        <span style="color: #ff0000;"><base target="_self"></span>  
        <title>书籍图片上传</title>  
    </head>  
    <body>  
        <h5>图片上传</h5><hr/>  
        <p style="color: red"></p>  
        <form id="form1" name="form1" action="http://msbox-pc:8080/JsCms/admin.php?c=upload&a=upload" method="post" enctype="multipart/form-data">  
            <div>注:图片大小最大不能超过3M!</div>  
            <div><input type="file" name="file_upload"/></div>  
            <div><input type="submit" value="上传"/></div>  
        </form>  
    </body>  
</html>  