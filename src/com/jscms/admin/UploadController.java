package com.jscms.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSUtils;

public class UploadController extends JSController {
	private String uploadPath = "eShop/upload/"; // 上传文件的目录  
    private String tempPath = "eShop/uploadtmp/"; // 临时文件目录  
    private String serverPath = null;  
    private String[] fileType = new String[]{".jpg",".gif",".bmp",".png",".jpeg",".ico"};
    private int sizeMax=30;
    private String isUploadLog;
    private String uploadLogPath;
	public UploadController(JSModule module){
		super(module);
		if(module.getSystemInfo().getUploadMaxSize().equals("")){
			sizeMax=-1;
		}else{
			sizeMax=new Integer(module.getSystemInfo().getUploadMaxSize()) * 1024 * 1024;
		}
		uploadPath = module.getSystemInfo().getUploadDir();
		tempPath = module.getSystemInfo().getUploadTmpDir();
		isUploadLog = module.getSystemInfo().getIsUploadLog();
		uploadLogPath = module.getSystemInfo().getUploadLogPath();
	}
	public void Init(){
		this.isValidate=false;
	}
	public void actionUpload(HttpServletRequest req,HttpServletResponse res) throws IOException{
		serverPath = this.getModule().getServletContext().getRealPath("/").replace("\\", "/"); 
		if(!new File(serverPath+uploadPath).isDirectory()){  
            new File(serverPath+uploadPath).mkdirs();  
        }  
        if(!new File(serverPath+tempPath).isDirectory()){  
            new File(serverPath+tempPath).mkdirs();  
        }
        
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024*1024); //最大缓存  
        factory.setRepository(new File(serverPath+tempPath));//临时文件目录
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(sizeMax);//文件最大上限
        
        String filePath = null;
        
        try {
			List<FileItem> items = upload.parseRequest(req);
			System.out.println(items.size());
			for (FileItem item : items) {
				if(!item.isFormField()){
					String fileName = item.getName().toLowerCase();
					if(fileName.endsWith(fileType[0])||fileName.endsWith(fileType[1])||fileName.endsWith(fileType[2])||fileName.endsWith(fileType[3])||fileName.endsWith(fileType[4])||fileName.endsWith(fileType[5])){
						String uuid = UUID.randomUUID().toString();
						String fileName1=uuid+fileName.substring(fileName.lastIndexOf("."));
                        filePath = serverPath+uploadPath+fileName1;
                        
                        item.write(new File(filePath));
                        
                        res.setHeader("Content-Type", "text/html");
                        res.getWriter().print(uploadPath+fileName1);
                        res.getWriter().close();
                        outLog("上传成功");
					}else{
						outLog("上传失败1");
					}
				}else{
					outLog("上传失败2");
				}
			}
		} catch (Exception e) {
			outLog("上传异常");
		}

	}
	
	public void outLog(String msg){
		if(isUploadLog.equals("1")){
			System.out.println(msg);
		}
	}
}
