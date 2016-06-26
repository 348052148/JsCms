package com.jscms.frame;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.obj.SystemInfo;

public class JSController {
	private JSView view;
	private HttpServletResponse res;
	private HttpServletRequest req;
	private ArrayList<HashMap<String, String>> validateChain;
	protected boolean isValidate=false;
	private JSModule module;
	private SystemInfo systemInfo;
	private HashMap<String, String> error = null; 
	public JSController(){
		//验证模块植入
		validateChain = new ArrayList<HashMap<String,String>>();
		//this.validateChain.put("admin", v);
		this.Init();
	}
	//
	public JSController(JSModule module){
		this.module = module;
		//验证模块植入
		validateChain = new ArrayList<HashMap<String,String>>();
		//this.validateChain.put("admin", v);
		this.Init();
		systemInfo = new SystemInfo();
	}
	
	public JSModule getModule() {
		return module;
	}
	/*初始化信息*/
	public void Init(){
		
	}
	//所以action 的流通之处 可重载此方法。实现action之前的过滤
	public void actions(String action,HttpServletRequest request,HttpServletResponse response){
		this.req = request;
		this.res = response;
		
		
		if(this.isValidate && !this.validate(request,response)){
			
			this.display("admin/login.jsp", false);
			return ;
		}
		this.producePosition(request);
		
		Class cls = this.getClass();
		Method method;
		try{
			Class[] args = new Class[2];
			args[0] = HttpServletRequest.class;
			args[1] = HttpServletResponse.class;
			method = cls.getDeclaredMethod(action,args);
			method.invoke(this, request,response);
		}catch (Exception e) {
			
		}
	}
	/*导航*/
	public void producePosition(HttpServletRequest request){
		//导航
		HashMap<String, String> position = new HashMap<String, String>();
		String controller = request.getParameter("c");
		if(controller == null) controller="index";
		System.out.println(controller);
		
		if(!controller.equals("index")){
			position.put("index", "admin.php?c=index&a=info");
			if(controller.equals("way")){
				position.put(controller, "admin.php?c="+controller+"&mold="+request.getParameter("mold"));
			}else{
				position.put(controller, "admin.php?c="+controller);
			}
		}
		
		request.setAttribute("position", JSUtils.buildPositionHtml(position));
	}
	/*获取系统配置信息*/
	public SystemInfo getSystemInfo(){
		return this.systemInfo;
	}
	/*设置 属性来达到直接使用的目的*/
	public void display(String Path,Boolean f){
		
		if(view == null){
			view = new JSView(this.res, this.req);
		}
		if(this.error != null){
			view.error("admin.php?c=error&a=index");
		}else{
			view.display(Path, f);
		}
	}
	
	public void jump(String local){
		if(view == null){
			view = new JSView(this.res, this.req);
		}
		if(this.error != null){
			view.error("admin.php?c=error&a=index");
		}else{
			view.jump(local);
		}
	}
	/*错误信息堆栈*/
	public void setError(String key){
		if(this.error == null){
			this.error = new HashMap<String, String>();
		}
		this.error.put(key, "error");
	}
	
	/*验证 产业链*/
	public boolean validate(HttpServletRequest req,HttpServletResponse res){
		boolean flag=false;

//		for(HashMap<String, String> validate : this.validateChain ){
//			Class clz;
//			try {
//				clz = Class.forName(validate.get("class"));
//				Object validateObj = clz.newInstance();
//				Method method;
//				Class[] args = new Class[2];
//				args[1] = HttpServletRequest.class;
//				args[2] = HttpServletResponse.class;
//				method = clz.getMethod("validate",args);
//				if(!(Boolean)method.invoke(validateObj, req,res)){
//					System.out.println("VALIDATE ERROR!!!!");
//				}
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//		}
		try {
		Class clz = Class.forName("com.jscms.admin.validate.AdminValidate");
		Object validate = clz.newInstance();
		
		Method method;
		
		Class[] args = new Class[2];
		args[0] = HttpServletRequest.class;
		args[1] = HttpServletResponse.class;
		
		method = clz.getMethod("validate",args);
		flag = (Boolean) method.invoke(validate, req,res);
		}catch(Exception e){
			
		}
		
        return flag;
	}
}
