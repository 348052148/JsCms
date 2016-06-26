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
		//��֤ģ��ֲ��
		validateChain = new ArrayList<HashMap<String,String>>();
		//this.validateChain.put("admin", v);
		this.Init();
	}
	//
	public JSController(JSModule module){
		this.module = module;
		//��֤ģ��ֲ��
		validateChain = new ArrayList<HashMap<String,String>>();
		//this.validateChain.put("admin", v);
		this.Init();
		systemInfo = new SystemInfo();
	}
	
	public JSModule getModule() {
		return module;
	}
	/*��ʼ����Ϣ*/
	public void Init(){
		
	}
	//����action ����֮ͨ�� �����ش˷�����ʵ��action֮ǰ�Ĺ���
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
	/*����*/
	public void producePosition(HttpServletRequest request){
		//����
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
	/*��ȡϵͳ������Ϣ*/
	public SystemInfo getSystemInfo(){
		return this.systemInfo;
	}
	/*���� �������ﵽֱ��ʹ�õ�Ŀ��*/
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
	/*������Ϣ��ջ*/
	public void setError(String key){
		if(this.error == null){
			this.error = new HashMap<String, String>();
		}
		this.error.put(key, "error");
	}
	
	/*��֤ ��ҵ��*/
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
