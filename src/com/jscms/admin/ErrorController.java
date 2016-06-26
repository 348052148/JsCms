package com.jscms.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;

public class ErrorController extends JSController {
	public ErrorController(JSModule module){
		super(module);
	}
	public void Init(){
		this.isValidate=true;
	}
	public void actionIndex(HttpServletRequest req,HttpServletResponse res){
		
		this.display("admin/error.jsp", false);
	}
}
