<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>

<script type="text/javascript" src="bootstrap/js/jquery.min.js" ></script>

<script type="text/javascript" language="javascript">
/*
$(document).ready(function(){
        $(function() {
            $('#fileUp').change(function() {
                $('#uploadLog').html('开始上传中....');
                $('#formFile').submit();
            });
        });
        $("#frameFile").load(function(){
        	  var data = $(window.frames['frameFile'].document.body).find("textarea").html();
         	//若iframe携带返回数据，则显示在feedback中
        	        if(data != null){
        	        	//$("#imgShow").append(data.replace(/&lt;/g,'<').replace(/&gt;/g,'>'));
        	        	$('#imgShow').attr('src', data.replace(/&lt;/g,'<').replace(/&gt;/g,'>'));
        	        	$("#fileUp").val('');
        	      }
            });
});
        function uploadSuccess(msg) {
        	alert(msg);
            if (msg.split('|').length > 1) {
                $('#imgShow').attr('src', msg.split('|')[1]);
                $('#uploadLog').html(msg.split('|')[0]);
            } else {
                $('#uploadLog').html(msg);
            }
        }
        });
        */
        
        $(document).ready(function(){
        $("#file_upload").change(function(){
        		$('#uploadLog').html("正在上传");
        	     //创建FormData对象
        	     var data = new FormData();
        	      //为FormData对象添加数据
        	      //
        	     var inputData;
        	     $.each($('#file_upload')[0].files, function(i, file) {
        	    	 //alert(file);
        	           data.append('file_upload', file);
        	           
        	           inputData={
             	    		  'file_upload':file
             	      }
        	          
        	     });
        	      
        	       $.ajax({
        	          url:'http://msbox-pc:8080/JsCms/admin.php?c=upload&a=upload',
        	          type:'POST',
        	          data:data,
        	          cache: false,
        	          contentType: false,    //不可缺
        	          processData: false,    //不可缺
        	           success:function(data){
        	              $('#imgShow').css({"display":"block"});
        	              $('#imgShow').attr("src",data);
        	              $('#uploadLog').html("");
        	          }
        	       });
        	    });
        
        });
        /*
	        function openUpload(){  
	            var win = window.open("http://msbox-pc:8080/JsCms/admin/file.jsp","","dialogWidth:300px;dialogHeight:300px;scroll:no;status:no");  
	            if(win != null){  
	                document.getElementById("photo_id").value = win;  
	                document.getElementById("img_id").src = ""+win;  
	            }  
	        }*/
    </script>
    <!--  
	<form id='formFile' name='formFile' method="post" action="http://msbox-pc:8080/JsCms/admin.php?c=upload&a=upload" target='frameFile' enctype="multipart/form-data">
    <input type='file' id='fileUp' name='fileUp' />
    <div id='uploadLog'></div>
    <img width='200' src='' height='200' id='imgShow' alt='缩略图' />
    </form>
    <iframe id='frameFile' name='frameFile' style='display: none;'></iframe>
	-->	
	 
	 
   	<input type="file" name="file_upload"  id="file_upload"/>
   	<input type="hidden" id="" name="" value="" />
   	<div id='uploadLog'></div></br>
   	<img width='150' src='' height='150' id='imgShow' style="display: none;" alt='缩略图' />
   	
   	
   	
   	
   	
   	<!--
   	<input type="hidden" id="photo_id" name="photo" value="images/noimg.png"><input type="button" onclick="openUpload()" value="上传图片"/><br/>  
    <img id="img_id" alt="" src="/images/noimg.png" width="200px" height="200px"> -->