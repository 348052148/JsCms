package com.jscms.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.model.SectionModel;
import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSSqlCommand;
import com.jscms.frame.JSUtils;

public class SectionController extends JSController {
	public SectionController(JSModule module){
		super(module);
	}
	public void Init(){
		this.isValidate=true;
	}
	public void actionIndex(HttpServletRequest req,HttpServletResponse res){
		HashMap<String, Object> data = new HashMap<String, Object>();
		ArrayList<Object> sections = new ArrayList<Object>();
		JSUtils.sectionTree("0", sections,0,new String[]{"id","name","mid","molds","moldname"});
		JSUtils.output4HashMap(req, data, "sections", sections);
		req.setAttribute("data", data);
		
		this.display("admin/section/sectionlist.jsp", false);
	}
	//添加
	public void actionAddSection(HttpServletRequest req,HttpServletResponse res){
		System.out.println("---------------------------");
		JSUtils.webAppPath(req);
		System.out.println("---------------------------");
		if(JSUtils.reqMethod(req)){
			JSSqlCommand sqlCommand = new JSSqlCommand();
			ArrayList<Map<String, Object>> molds = sqlCommand.queryMultForMap("select mid,moldname,molds from js_molds where isshow=1", new String[]{"mid","moldname","molds"});
			HashMap<String, Object> data = new HashMap<String, Object>();
			//mold
			JSUtils.output4HashMap(req, data, "molds", molds);
			//构建上级目录请求集
			ArrayList<Object> sections = new ArrayList<Object>();
			JSUtils.sectionTree("0", sections,0);
			JSUtils.output4HashMap(req, data, "pid", req.getParameter("pid"));
			JSUtils.output4HashMap(req, data, "sections", sections);
			
			req.setAttribute("data", data);
		}else{
			HashMap<String, Object> input = new HashMap<String, Object>();
			SectionModel section = new SectionModel();
			JSUtils.input4HashMap2(req, input, "mid",new String[]{"mid","molds","moldname"});
			JSUtils.authData(this, req, "pid", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, input, "pid");
			JSUtils.authData(this, req, "name", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, input, "name");
			JSUtils.authData(this, req, "about", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, input, "about");
			JSUtils.authData(this, req, "dindex", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, input, "dindex");
			JSUtils.authData(this, req, "isshow", JSUtils.AUTH_BOOL);
			JSUtils.input4HashMap(req, input, "isshow");
			JSUtils.authData(this, req, "order", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, input, "order");
			section.save(input);
			this.jump("admin.php?c=section&a=index");
			return ;
		}
		
		this.display("admin/section/sectionnew.jsp", false);
	}
	//编辑
	public void actionEditSection(HttpServletRequest req,HttpServletResponse res){
		
		String id = req.getParameter("id");
		if(JSUtils.reqMethod(req)){
			
			JSSqlCommand sqlCommand = new JSSqlCommand();
			ArrayList<Map<String, Object>> molds = sqlCommand.queryMultForMap("select mid,moldname,molds from js_molds where isshow=1", new String[]{"mid","moldname","molds"});
			HashMap<String, Object> data = new HashMap<String, Object>();
			//mold
			JSUtils.output4HashMap(req, data, "molds", molds);
			//构建上级目录请求集
			ArrayList<Object> sections = new ArrayList<Object>();
			JSUtils.sectionTree("0", sections,0);
			JSUtils.output4HashMap(req, data, "sections", sections);
			
			req.setAttribute("data", data);
			System.out.println("edit--Section");
			SectionModel section = new SectionModel();
			HashMap<String, Object> edit = section.findById(new Integer(id));
			
			JSUtils.output4HashMap(req, data, "edit", edit);
			
			req.setAttribute("flag", true);
		}
		else{
			
			HashMap<String, Object> data =new HashMap<String, Object>();
			SectionModel section = new SectionModel();
			JSUtils.input4HashMap2(req, data, "mid",new String[]{"mid","molds","moldname"});
			JSUtils.authData(this, req, "pid", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "pid");
			JSUtils.authData(this, req, "name", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "name");
			JSUtils.authData(this, req, "about", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "about");
			JSUtils.authData(this, req, "dindex", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "dindex");
			JSUtils.authData(this, req, "isshow", JSUtils.AUTH_BOOL);
			JSUtils.input4HashMap(req, data, "isshow");
			JSUtils.authData(this, req, "order", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "order");
			section.update(data, "where id="+id);
			
			this.jump("admin.php?c=section&a=index");
			return ;
		}
		this.display("admin/section/sectionnew.jsp", false);
	}
	//删除
	public void actionDelteSection(HttpServletRequest req,HttpServletResponse res){
		String id = req.getParameter("id");
		SectionModel section = new SectionModel();
		section.deleteById(new Integer(id));
		this.jump("admin.php?c=section&a=index");
	}
	
}
