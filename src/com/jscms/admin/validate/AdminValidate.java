package com.jscms.admin.validate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.obj.User;
import com.jscms.frame.JSValidate;

public class AdminValidate extends JSValidate {
	
	//验证接口
	public boolean validate(HttpServletRequest req,HttpServletResponse res){
		User user = (User) req.getSession().getAttribute("user");
		if(user !=null ){
			return true;
		}
		return false;
	}
}
