package com.jscms.admin;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.obj.SystemInfo;
import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSUtils;

public class SystemController extends JSController {
	public SystemController(JSModule module){
		super(module);
		sysInfo = new SystemInfo();
	}
	public void Init(){
		this.isValidate=true;
	}
	private SystemInfo sysInfo;
	public SystemController(){
		
	}
	
	//系统设置首页
	
	public void actionIndex(HttpServletRequest req,HttpServletResponse res){
		req.setAttribute("type", "base");
		req.setAttribute("sysInfo", sysInfo);
		this.display("admin/sys/sys.jsp", false);
	}
	
	public void actionUpload(HttpServletRequest req,HttpServletResponse res){
		req.setAttribute("type", "upload");
		req.setAttribute("sysInfo", sysInfo);
		this.display("admin/sys/sys.jsp", false);
	}
	
	public void actionCached(HttpServletRequest req,HttpServletResponse res){
		req.setAttribute("type", "cached");
		req.setAttribute("sysInfo", sysInfo);
		this.display("admin/sys/sys.jsp", false);
	}
	
	public void actionEmail(HttpServletRequest req,HttpServletResponse res){
		req.setAttribute("type", "email");
		req.setAttribute("sysInfo", sysInfo);
		this.display("admin/sys/sys.jsp", false);
	}
	
	public void actionUpdateInfo(HttpServletRequest req,HttpServletResponse res){
		HashMap<String, Object> data = new HashMap<String, Object>();
		/*
		private String siteUrl;
		private String siteName;
		private String indexKey;
		private String indexDes;
		private String defaltTemple;
		private String gzip;
		private String debug;
		private String exceptLog;
		
		private String cahceHost;
		private String cacheUser;
		private String cachePass;
		private String cacheTTL;
		private String cached;
		
		private String smtpHost;
		private String email;
		private String emailPass;
		private String emailName;
		*/
		JSUtils.input4HashMapEmpty(req, data, "siteUrl");
		JSUtils.input4HashMapEmpty(req, data, "siteName");
		JSUtils.input4HashMapEmpty(req, data, "indexKey");
		JSUtils.input4HashMapEmpty(req, data, "indexDes");
		JSUtils.input4HashMapEmpty(req, data, "defaltTemple");
		JSUtils.input4HashMapEmpty(req, data, "gzip");
		JSUtils.input4HashMapEmpty(req, data, "debug");
		JSUtils.input4HashMapEmpty(req, data, "exceptLog");
		
		JSUtils.input4HashMapEmpty(req, data, "uploadDir");
		JSUtils.input4HashMapEmpty(req, data, "uploadTmpDir");
		JSUtils.input4HashMapEmpty(req, data, "uploadMaxSize");
		JSUtils.input4HashMapEmpty(req, data, "isUploadLog");
		JSUtils.input4HashMapEmpty(req, data, "uploadLogPath");
		
		JSUtils.input4HashMapEmpty(req, data, "cahceHost");
		JSUtils.input4HashMapEmpty(req, data, "cacheUser");
		JSUtils.input4HashMapEmpty(req, data, "cachePass");
		JSUtils.input4HashMapEmpty(req, data, "cacheTTL");
		JSUtils.input4HashMapEmpty(req, data, "cached");
		
		JSUtils.input4HashMapEmpty(req, data, "smtpHost");
		JSUtils.input4HashMapEmpty(req, data, "email");
		JSUtils.input4HashMapEmpty(req, data, "emailPass");
		JSUtils.input4HashMapEmpty(req, data, "emailName");
		
		JSUtils.pushSysProperties(data, sysInfo);
		
		String type = req.getParameter("type");
		if(type.equals("base")){
			this.jump("admin.php?c=system&a=index");
		}else if(type.equals("upload")){
			this.jump("admin.php?c=system&a=upload");
		}else if(type.equals("cached")){
			this.jump("admin.php?c=system&a=cached");
		}else if(type.equals("email")){
			this.jump("admin.php?c=system&a=email");
		}else{
			
		}
		
	}
}
