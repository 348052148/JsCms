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
	/*登录首页*/
	public void actionIndex(HttpServletRequest req,HttpServletResponse res){
		//初始化操作
		
		this.display("admin/login.jsp", false);
	}
	/*登录动作*/
	public void actionLogin(HttpServletRequest req,HttpServletResponse res){
		HashMap<String, Object> data = new HashMap<String, Object>();
		JSUtils.input4HashMap(req, data, "auser");
		JSUtils.input4HashMap(req, data, "apass");
		data.put("apass", JSUtils.MD5((String) data.get("apass")));
		//验证
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
			String errMsg = "用户名不存在或密码错误";
			req.setAttribute("errMsg", errMsg);
			this.display("admin/login.jsp", false);
		}
	}
	/*退出动作*/
	public void actionLogout(HttpServletRequest req,HttpServletResponse res){
		//
		req.getSession().removeAttribute("user");
		this.display("admin/login.jsp", false);
	}
}
