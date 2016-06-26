package com.jscms.admin;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.model.AdminModel;
import com.jscms.admin.obj.User;
import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSUtils;

public class LoginController extends JSController {
	public LoginController(JSModule module){
		super(module);
	}
	/*��¼��ҳ*/
	public void actionIndex(HttpServletRequest req,HttpServletResponse res){
		//��ʼ������
		
		this.display("admin/login.jsp", false);
	}
	/*��¼����*/
	public void actionLogin(HttpServletRequest req,HttpServletResponse res){
		HashMap<String, Object> data = new HashMap<String, Object>();
		JSUtils.input4HashMap(req, data, "auser");
		JSUtils.input4HashMap(req, data, "apass");
		data.put("apass", JSUtils.MD5((String) data.get("apass")));
		//��֤
		AdminModel admin = new AdminModel();
		if(admin.exists(data)){
			User user = new User();
			user.setUserName((String)data.get("auser"));
			user.setUserPass((String)data.get("apass"));
			user.setLoginTim(JSUtils.getNowDate());
			req.getSession().setAttribute("user", user);
			this.jump("admin.php");
		}
		else{
			String errMsg = "�û��������ڻ��������";
			req.setAttribute("errMsg", errMsg);
			this.display("admin/login.jsp", false);
		}
	}
	/*�˳�����*/
	public void actionLogout(HttpServletRequest req,HttpServletResponse res){
		//
		req.getSession().removeAttribute("user");
		this.display("admin/login.jsp", false);
	}
}
