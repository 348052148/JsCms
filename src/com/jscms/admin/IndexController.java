package com.jscms.admin;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.frame.JSController;
import com.jscms.frame.JSDbConnection;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSSqlCommand;
import com.jscms.frame.JSUtils;

public class IndexController extends JSController{
	public IndexController(JSModule module){
		super(module);
	}
	public void Init(){
		this.isValidate=true;
	}
	public void actionIndex(HttpServletRequest req,HttpServletResponse res) throws IOException{
		JSUtils.webAppPath(req);
		JSSqlCommand sqlComman = new JSSqlCommand();
		ArrayList<Object> list = sqlComman.queryForList("select url from js_link", new String[]{"url"});
		System.out.println(list.get(0));
		this.display("admin/index.jsp", false);
	}
	
	public void actionLeft(HttpServletRequest req,HttpServletResponse res){
		JSSqlCommand sqlCommand = new JSSqlCommand();
		ArrayList<Map<String, Object>> dataList = sqlCommand.queryMultForMap("select * from js_molds where isshow=1 order by `order`", new String[]{"mid","molds","moldname"});
		req.setAttribute("moldList", dataList);
		System.out.println("ds-->"+JSUtils.reqWebModuld(req));
		this.display("admin/left.jsp", false);
	}
	
	public void actionHead(HttpServletRequest req,HttpServletResponse res){
		this.display("admin/head.jsp", false);
	}
	
	public void actionInfo(HttpServletRequest req,HttpServletResponse res){
		req.setAttribute("info", JSUtils.getSystemInfo());
		req.setAttribute("position", " ");
		this.display("admin/info.jsp", false);
	}
	
}
