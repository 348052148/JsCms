package com.jscms.frame;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Set;
import java.util.Map.Entry;

import javax.mail.Flags.Flag;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.obj.SystemInfo;

public class JSModule extends HttpServlet {

	private HttpServletResponse res;
	private HttpServletRequest req;
	private String defaultAction="actionIndex";
	private String defaultController="IndexController";
	private String controllrPackage="";
	private SystemInfo systemInfo;
	public JSModule() {
		super();
		systemInfo = new SystemInfo();
	}
	
	public SystemInfo getSystemInfo() {
		return systemInfo;
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	protected void service(HttpServletRequest request, HttpServletResponse response){
		
		this.req = request;
		this.res = response;
		/*编码转换*/
		try {
			this.req.setCharacterEncoding("utf8");
			this.res.setCharacterEncoding("utf8");
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		/*请求模块封装*/
		this.req.setAttribute("Module", this.req.getRequestURL());
		/*构建action*/
		String acts = request.getParameter("a");
		String control = request.getParameter("c"); //可以定制
		String action;
		if(acts == null || acts == ""){
			action = defaultAction;
		}else{
			action = JSUtils.buildAction(acts);
		}
		String controller;
		if(control == null || control == ""){
			controller = defaultController;
		}else{
			controller = JSUtils.buildController(control);
		}
		/*利用反射*/
		/*controller*/
		Class controllerClass=null;
		Object controllerObj=null;
		try {
			controllerClass = Class.forName(controllrPackage+"."+controller);
//			Class[] parameterTypes =  new Class[1];
//			parameterTypes[0] = JSModule.class;
			Constructor contructor = controllerClass.getConstructor(JSModule.class);
			controllerObj = contructor.newInstance(this);
//			controllerObj = controllerClass.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*action*/
		Method method;
		try {
			Class[] args = new Class[3];
			args[1] = HttpServletRequest.class;
			args[2] = HttpServletResponse.class;
			args[0] = String.class;
			method = controllerClass.getMethod("actions",args);
			method.invoke(controllerObj, action,request,response);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	
	//初始化模块信息
	public void init() throws ServletException {
		defaultAction = JSUtils.buildAction((this.getInitParameter("defaultAction")));
		defaultController = JSUtils.buildController(this.getInitParameter("defaultController"));
		String cpackage = this.getInitParameter("controllerPackage");
		if(cpackage == null || cpackage == ""){
			controllrPackage = this.getClass().getPackage().getName();
		}else{
			controllrPackage = cpackage;
		}
		
	}

}
