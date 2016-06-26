package com.jscms.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.model.AdminModel;
import com.jscms.admin.model.GroupModel;
import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSSqlCommand;
import com.jscms.frame.JSUtils;

public class AdminController extends JSController {
	public void Init(){
		this.isValidate=true;
	}
	public AdminController(JSModule module){
		super(module);
	}
	public void actionIndex(HttpServletRequest req,HttpServletResponse res){
		
		JSSqlCommand sqlCommand = new JSSqlCommand();
		
		ArrayList<Map<String, Object>> grouplist = sqlCommand.queryMultForMap("select * from js_admin_group", new String[]{"gid","name","perid"});
		
		req.setAttribute("grouplist", grouplist);
		
		String aid = req.getParameter("aid");
		ArrayList<Map<String, Object>> adminlist = sqlCommand.queryMultForMap("select * from js_admin_user", new String[]{"aid","aname","apass","auser","aemail","atel","gid"});
		req.setAttribute("adminlist", adminlist);
		if(aid !=null && !aid.equals("")){
			req.setAttribute("selectID", aid);
			this.display("admin/admin/adminlist.jsp", false);
			return ;
		}
		
		this.display("admin/admin/adminlist.jsp", false);
	}
	
	public void actionAddAdmin(HttpServletRequest req,HttpServletResponse res){
		AdminModel admin = new AdminModel();
		HashMap<String, Object> data = new HashMap<String, Object>();
		JSUtils.authData(this, req, "auser", JSUtils.AUTH_USER);
		JSUtils.input4HashMap(req, data, "auser");
		JSUtils.authData(this, req, "apass", JSUtils.AUTH_PASS);
		JSUtils.input4HashMap(req, data, "apass");
		JSUtils.authData(this, req, "aname", JSUtils.AUTH_STRING);
		JSUtils.input4HashMap(req, data, "aname");
		JSUtils.authData(this, req, "aemail", JSUtils.AUTH_EMAIL);
		JSUtils.input4HashMap(req, data, "aemail");
//		JSUtils.authData(this, req, "atel", JSUtils.AUTH_PHONE);
		JSUtils.input4HashMap(req, data, "atel");
		JSUtils.authData(this, req, "gid", JSUtils.AUTH_NUMBER);
		JSUtils.input4HashMap(req, data, "gid");
		data.put("apass", JSUtils.MD5((String) data.get("apass")));
		
		String aid = req.getParameter("aid");
		
		if(aid !=null && !aid.equals("")){
			admin.update(data, "where aid="+aid);
		}else{
			admin.save(data);
		}
		this.jump("admin.php?c=admin&a=index");
	}
	
	public void actionDeleteAdmin(HttpServletRequest req,HttpServletResponse res){
		AdminModel admin = new AdminModel();
		String id = req.getParameter("aid");
		admin.deleteById(new Integer(id));
		this.jump("admin.php?c=admin&a=index");
	}
	
	
	//ื้
	public void actionGroup(HttpServletRequest req,HttpServletResponse res){
		
		JSSqlCommand sqlCommand = new JSSqlCommand();
		ArrayList<Map<String, Object>> grouplist = sqlCommand.queryMultForMap("select * from js_admin_group", new String[]{"gid","name","perid"});
		
		req.setAttribute("grouplist", grouplist);
		String gid = req.getParameter("gid");
		if(gid !=null && !gid.equals("")){
			GroupModel adminGroup = new GroupModel();
			HashMap<String, Object> group = adminGroup.findById(new Integer(gid));
			req.setAttribute("group", group);
		}
		this.display("admin/admin/grouplist.jsp", false);
	}
	
	public void actionAddGroup(HttpServletRequest req,HttpServletResponse res){
		GroupModel adminGroup = new GroupModel();
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		String gid = req.getParameter("gid");
		
		JSUtils.input4HashMap(req, data, "name");
		if(gid !=null && !gid.equals("")){
			adminGroup.update(data, "where gid="+gid);
		}else{
			adminGroup.save(data);
		}
		this.jump("admin.php?c=admin&a=group");
	}
	public void actionDeleteGroup(HttpServletRequest req,HttpServletResponse res){
		GroupModel adminGroup = new GroupModel();
		String gid = req.getParameter("gid");
		adminGroup.deleteById(new Integer(gid));
		this.jump("admin.php?c=admin&a=group");
	}
}
