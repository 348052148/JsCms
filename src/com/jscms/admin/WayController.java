package com.jscms.admin;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.model.WayModel;
import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSSqlCommand;
import com.jscms.frame.JSUtils;

public class WayController extends JSController {
	public WayController(JSModule module){
		super(module);
	}
	public void Init(){
		this.isValidate=true;
	}
	public void actionIndex(HttpServletRequest req,HttpServletResponse res){
		//分页
		String page = req.getParameter("page");
		if(page==null){
			page="1";
		}
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		String molds = req.getParameter("mold");
		
		
		
		//获得当前的模型名称
		JSSqlCommand sqlCommand = new JSSqlCommand();
		HashMap<String, Object> moldData = sqlCommand.queryForMap("select moldname,listnum from js_molds where molds='"+molds+"'");
		data.put("mname", moldData.get("moldname"));
		data.put("mold", molds);
		
		
		//分页每页显示条数获取
		Integer num=(Integer) moldData.get("listnum");
		if(num == null || num == 0){
			num=10;
		}
		String pageSql = JSUtils.buildFenYeSql(new Integer(page), num);
		
		ArrayList<Map<String, Object>> list = sqlCommand.queryMultForMap("select * from js_"+molds+" "+pageSql, new String[]{"id","title","isshow","addtime","hits"});
		
		req.setAttribute("list", list);
		req.setAttribute("data", data);
		
		//
		
		ArrayList<Map<String, Object>> dataTotal = sqlCommand.queryMultForMap("select * from js_"+molds, new String[]{"id","title","isshow","addtime","hits"});
		
		JSUtils.buildFenYe(req, num, dataTotal.size(), new Integer(page), JSUtils.buildReqPath(req, "way", "index","&mold="+molds+"&page="));
		
		this.display("admin/way/waylist.jsp", false);
	}
	
	public void actionAddWay(HttpServletRequest req,HttpServletResponse res){
		//String molds = req.getParameter("mold");
		String molds = req.getParameter("mold");
		//栏目id
		String sid = req.getParameter("sid");
		
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		JSUtils.input4HashMap(req, data, "mold");
		JSSqlCommand sqlCommand = new JSSqlCommand();
		HashMap<String, Object> moldData = sqlCommand.queryForMap("select moldname from js_molds where molds='"+molds+"'");
		data.put("mname", moldData.get("moldname"));
		req.setAttribute("data", data);
		String body = req.getParameter("body");
		if(body != null){
			//所属栏目
			ArrayList<Map<String, Object>> sectionlist = sqlCommand.queryMultForMap("select * from js_section where molds='"+molds+"'", new String[]{"id","name"});
			req.setAttribute("sectionList", sectionlist);
			//默认栏目
			if(sid==null || sid.equals("")) sid = sectionlist.get(0).get("id").toString();
			//自定义字段显示
			ArrayList<Map<String, Object>> fieldlist = sqlCommand.queryMultForMap("select * from js_fields where isshow=1 and molds='"+molds+"' and include like '%"+sid+"%'", new String[]{"fieldname","fields","fieldtype","longs"});
			req.setAttribute("fieldList", fieldlist);
			//
			req.setAttribute("sid", sid);
			
			JSUtils.input4HashMap(req, data, "body");
			
			
			HashMap<String, Object> um = new HashMap<String, Object>();
			um.put("bodyname", "body");
			um.put("bodycontent", "请输入内容！");
			um.put("stylewidth", "1000px");
			um.put("styleheight", "400px");
			req.setAttribute("um", um);
			
			this.display("admin/way/waynew.jsp", false);
			return ;
		}
		this.display("admin/way/waynew.jsp", false);
	}
	//编辑界面
	public void actionEditWay(HttpServletRequest req,HttpServletResponse res){
		//String molds = req.getParameter("mold");
		String molds = req.getParameter("mold");
		//栏目id
		String sid = req.getParameter("sid");
		
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		JSUtils.input4HashMap(req, data, "mold");
		JSSqlCommand sqlCommand = new JSSqlCommand();
		HashMap<String, Object> moldData = sqlCommand.queryForMap("select moldname from js_molds where molds='"+molds+"'");
		data.put("mname", moldData.get("moldname"));
		
		
		req.setAttribute("data", data);
		
		//查询数据
		String id = req.getParameter("id");
		WayModel wayModel = new WayModel(molds);
		HashMap<String, Object> edit = wayModel.findById(new Integer(id));
		
		//栏目默认
		if(sid==null || sid.equals("")) sid = edit.get("sid").toString();
		
		String body = req.getParameter("body");
		if(body != null){
			//所属栏目
			ArrayList<Map<String, Object>> sectionlist = sqlCommand.queryMultForMap("select * from js_section where molds='"+molds+"'", new String[]{"id","name"});
			req.setAttribute("sectionList", sectionlist);
			//自定义字段显示
			ArrayList<Map<String, Object>> fieldlist = sqlCommand.queryMultForMap("select * from js_fields where isshow=1 and molds='"+molds+"' and include like '%"+sid+"%'", new String[]{"fieldname","fields","fieldtype","longs"});
			req.setAttribute("fieldList", fieldlist);
			//获取字段值
//			String[] vals = new String[fieldlist.size()];
//			int i=0;
//			for(Map<String,Object> BJ : fieldlist){
//				vals[i++] = BJ.get("fields").toString();
//			}
//			HashMap<String, Object> fieldvalues = sqlCommand.queryForMap("select * from js_"+molds+"_field where cid="+id);
//			int j=0;
//			for(j=0;j<fieldlist.size();j++){
//				HashMap<String, Object> tmp = (HashMap<String, Object>) fieldlist.get(j);
//				tmp.put("value", fieldvalues.get(tmp.get("fields")));
//			}
			System.out.println("SELECT * from js_"+molds+" a LEFT JOIN js_"+molds+"_field f on a.id=f.cid WHERE a.id="+id);
			HashMap<String, Object> edit1 = sqlCommand.queryForMap("SELECT * from js_"+molds+" a LEFT JOIN js_"+molds+"_field f on a.id=f.cid WHERE a.id="+id);
			req.setAttribute("edit", edit1);
			req.setAttribute("sid", sid);
			
			JSUtils.input4HashMap(req, data, "body");
			
			HashMap<String, Object> um = new HashMap<String, Object>();
			um.put("bodyname", "body");
			um.put("bodycontent", edit.get("body"));
			um.put("stylewidth", "1000px");
			um.put("styleheight", "400px");
			req.setAttribute("um", um);
			
			this.display("admin/way/waynew.jsp", false);
			return ;
		}
		req.setAttribute("edit", edit);
		this.display("admin/way/waynew.jsp", false);
	}
	//添加处理
	public void actionAddWayHandule(HttpServletRequest req,HttpServletResponse res){
		String molds = req.getParameter("mold");
		WayModel wayModel = new WayModel(molds);
		HashMap<String, Object> data = new HashMap<String, Object>();
		JSUtils.authData(this, req, "url", JSUtils.AUTH_URL);
		JSUtils.input4HashMapEmpty(req, data, "url");
		JSUtils.authData(this, req, "keyword", JSUtils.AUTH_STRING);
		JSUtils.input4HashMapEmpty(req, data, "keyword");
		JSUtils.authData(this, req, "modifytime", JSUtils.AUTH_STRING);
		JSUtils.input4HashMapEmpty(req, data, "modifytime");
		JSUtils.authData(this, req, "hits", JSUtils.AUTH_INT);
		JSUtils.input4HashMapEmpty(req, data, "hits");
		JSUtils.authData(this, req, "desc", JSUtils.AUTH_STRING);
		JSUtils.input4HashMapEmpty(req, data, "desc");
		JSUtils.authData(this, req, "isshow", JSUtils.AUTH_BOOL);
		JSUtils.input4HashMapEmpty(req, data, "isshow");
		JSUtils.authData(this, req, "order", JSUtils.AUTH_INT);
		JSUtils.input4HashMapEmpty(req, data, "order");
		data.put("addtime", JSUtils.getNowDate());
		String id = req.getParameter("id");
		if(id != null && !id.equals("")){
			wayModel.update(data, "where id="+id);
		}else{
			wayModel.save(data);
		}
		this.jump("admin.php?c=way&a=index&mold="+molds);
	}
	//body添加处理
	public void actionAddWayBodyHandule(HttpServletRequest req,HttpServletResponse res){
		String molds = req.getParameter("mold");
		WayModel wayModel = new WayModel(molds);
		HashMap<String, Object> data = new HashMap<String, Object>();
		JSUtils.input4HashMap(req, data, "title");
		JSUtils.input4HashMap(req, data, "sid");
		//
		JSSqlCommand sqlCommand = new JSSqlCommand();
		HashMap<String, Object> fieldsData = JSUtils.input4Table(req);
		//
		String id = req.getParameter("id");
		JSUtils.input4HashMap(req, data, "body");
		
		data.put("addtime", JSUtils.getNowDate());
		if(id != null && !id.equals("")){
			if(sqlCommand.updateSQL(JSUtils.buildUpdateSql("js", molds+"_field", fieldsData, "where cid="+fieldsData.get("cid")))<0){
				System.out.println("UPDATE ERR");
			}
			wayModel.update(data, "where id="+id);
		}else{
			wayModel.save(data);
			fieldsData.put("cid", wayModel.findID(data));
			sqlCommand.execute(JSUtils.buildInsertSql("js", molds+"_field", fieldsData));
			
		}
		this.jump("admin.php?c=way&a=index&mold="+molds);
	}
	//
	public void actionDeleteWay(HttpServletRequest req,HttpServletResponse res){
		String molds = req.getParameter("mold");
		String id = req.getParameter("id");
		WayModel wayModel = new WayModel(molds);
		wayModel.deleteById(new Integer(id));
		this.jump("admin.php?c=way&a=index&mold="+molds);
	}
}
