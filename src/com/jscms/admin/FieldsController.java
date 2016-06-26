package com.jscms.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.model.FieldsModel;
import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSSqlCommand;
import com.jscms.frame.JSUtils;

public class FieldsController extends JSController {
	public void Init(){
		this.isValidate=true;
	}
	public FieldsController(JSModule module){
		super(module);
	}
	public void actionIndex(HttpServletRequest req,HttpServletResponse res){
		String molds = req.getParameter("molds");
		JSSqlCommand sqlCommand = new JSSqlCommand();
		ArrayList<Map<String, Object>> fieldsList = sqlCommand.queryMultForMap("select * from js_fields where molds='"+molds+"'", new String[]{"fid","fieldname","fields","fieldtype","isshow","longs","molds"});
		req.setAttribute("molds", molds);
		req.setAttribute("fieldsList", fieldsList);
		this.display("admin/fields/fieldslist.jsp", false);
	}
	
	public void actionAddFields(HttpServletRequest req,HttpServletResponse res){
		String molds = req.getParameter("molds");
		JSSqlCommand sqlCommand = new JSSqlCommand();
		if(JSUtils.reqMethod(req)){
			
			ArrayList<Map<String, Object>> sectionList = sqlCommand.queryMultForMap("select * from js_section where molds='"+molds+"'", new String[]{"id","name"});
			req.setAttribute("sectionList", sectionList);
			req.setAttribute("molds", molds);
			this.display("admin/fields/fieldsnew.jsp", false);
			return ;
		}else{
			HashMap<String, Object> data = new HashMap<String, Object>();
			JSUtils.authData(this, req, "fieldname", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "fieldname");
			JSUtils.authData(this, req, "molds", JSUtils.AUTH_CHAR);
			JSUtils.input4HashMap(req, data, "molds");
			JSUtils.authData(this, req, "fieldtype", JSUtils.AUTH_CHAR);
			JSUtils.input4HashMap(req, data, "fieldtype");
			JSUtils.authData(this, req, "fields", JSUtils.AUTH_CHAR);
			JSUtils.input4HashMap(req, data, "fields");
			JSUtils.authData(this, req, "isshow", JSUtils.AUTH_BOOL);
			JSUtils.input4HashMap(req, data, "isshow");
			JSUtils.authData(this, req, "order", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "order");
			JSUtils.authData(this, req, "longs", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "longs");
			JSUtils.input4HashMapSplit(req, data, "include", ':');
			/*
			 * select
			 * mid
			 * long
			 * */
			/*相关表字段增加操作*/
			HashMap<String, Object> fieldInfo =new HashMap<String, Object>();
			fieldInfo.put("fieldName", data.get("fields"));
			fieldInfo.put("fieldLong", data.get("longs"));
			fieldInfo.put("fieldType", "varchar");
			System.out.println(JSUtils.buildAddFieldSql("js_"+molds+"_field", fieldInfo));
			sqlCommand.execute(JSUtils.buildAddFieldSql("js_"+molds+"_field", fieldInfo));
			/**/
			FieldsModel fields = new FieldsModel();
			fields.save(data);
			
		}
		
		this.jump("admin.php?c=fields&a=index&molds="+molds);
	}
	
	public void actionEditFields(HttpServletRequest req,HttpServletResponse res){
		String fid = req.getParameter("fid");
		String molds = req.getParameter("molds");
		req.setAttribute("molds", molds);
		JSSqlCommand sqlCommand = new JSSqlCommand();
		if(JSUtils.reqMethod(req)){
			req.setAttribute("edit", "edit");
			FieldsModel fields = new FieldsModel();
			HashMap<String, Object> field= fields.findById(new Integer(fid));
			
			
			ArrayList<Map<String, Object>> sectionList = sqlCommand.queryMultForMap("select * from js_section where molds='"+molds+"'", new String[]{"id","name"});
			req.setAttribute("sectionList", sectionList);
			
			/*栏目选择*/
			String inc = (String) field.get("include");
			if(inc != null && !inc.equals("")){
				String[] ars = inc.split(":");
				for(int i=0;i<sectionList.size();i++){
					if(JSUtils.exists4Array(ars, sectionList.get(i).get("id").toString())){
						sectionList.get(i).put("msg", "checked=checked");
					}else{
						sectionList.get(i).put("msg", "");
					}
				}
			}
			
			req.setAttribute("fields", field);
			req.setAttribute("fid", fid);
			
			this.display("admin/fields/fieldsnew.jsp", false);
			return ;
		}else{
			HashMap<String, Object> data = new HashMap<String, Object>();
			JSUtils.input4HashMapSplit(req, data, "include", ':');
			JSUtils.authData(this, req, "fieldname", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "fieldname");
			JSUtils.authData(this, req, "molds", JSUtils.AUTH_CHAR);
			JSUtils.input4HashMap(req, data, "molds");
			JSUtils.authData(this, req, "fields", JSUtils.AUTH_CHAR);
			JSUtils.input4HashMap(req, data, "fields");
			JSUtils.authData(this, req, "fieldtype", JSUtils.AUTH_CHAR);
			JSUtils.input4HashMap(req, data, "fieldtype");
			JSUtils.authData(this, req, "isshow", JSUtils.AUTH_BOOL);
			JSUtils.input4HashMap(req, data, "isshow");
			JSUtils.authData(this, req, "order", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "order");
			JSUtils.authData(this, req, "longs", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "longs");
			/*
			 * select
			 * mid
			 * long
			 * */
			/*相关表字段修改操作*/
			HashMap<String, Object> fieldInfo =new HashMap<String, Object>();
			fieldInfo.put("fieldName", data.get("fields"));
			fieldInfo.put("fieldLong", data.get("longs"));
			fieldInfo.put("fieldType", "varchar");
			System.out.println(JSUtils.buildModifyFieldSql("js_"+molds+"_field", fieldInfo));
			sqlCommand.execute(JSUtils.buildModifyFieldSql("js_"+molds+"_field", fieldInfo));
			/**/
			FieldsModel fields = new FieldsModel();
			fields.update(data, "where fid="+fid);
		}
		this.jump("admin.php?c=fields&a=index&molds="+molds);
	}
	
	public void actionDeleteFields(HttpServletRequest req,HttpServletResponse res){
			String fid = req.getParameter("fid");
			String molds = req.getParameter("molds");
			FieldsModel field = new FieldsModel();
			field.deleteById(new Integer(fid));
			this.jump("admin.php?c=fields&a=index&molds="+molds);
	}
}
