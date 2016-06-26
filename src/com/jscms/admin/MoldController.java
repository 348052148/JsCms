package com.jscms.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.model.MoldsModel;
import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSSqlCommand;
import com.jscms.frame.JSUtils;

public class MoldController extends JSController{
	public MoldController(JSModule module){
		super(module);
	}
	public void Init(){
		this.isValidate=true;
	}
	public void actionIndex(HttpServletRequest req,HttpServletResponse res){
		String page = req.getParameter("page");
		if(page==null){
			page="1";
		}
		//分页处理
		int num = 4;
		String pageSql = JSUtils.buildFenYeSql(new Integer(page), num);
		JSSqlCommand sqlCommand = new JSSqlCommand();
		ArrayList<Map<String, Object>> dataList = sqlCommand.queryMultForMap("select * from js_molds "+pageSql, new String[]{"mid","molds","moldname","molddb","order","isshow"});
		ArrayList<Map<String, Object>> dataTotal = sqlCommand.queryMultForMap("select * from js_molds ", new String[]{"mid","molds","moldname","molddb","order","isshow"});
		req.setAttribute("dataList", dataList);
		
		JSUtils.buildFenYe(req, num, dataTotal.size(), new Integer(page), JSUtils.buildReqPath(req, "mold", "index","&page="));
		this.display("admin/mold/moldlist.jsp", false);
	}
	public void actionAddMold(HttpServletRequest req,HttpServletResponse res){
		JSSqlCommand sqlCommand = new JSSqlCommand();
		String op = req.getParameter("op");
		if(op == null && op == "" ) op="";
		if(op !=null &&op.equals("add")){
			HashMap<String, Object> data =new HashMap<String, Object>();
			JSUtils.authData(this, req, "moldname", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "moldname");
			JSUtils.authData(this, req, "molds", JSUtils.AUTH_CHAR);
			JSUtils.input4HashMap(req, data, "molds");
			JSUtils.authData(this, req, "j_index", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "j_index");
			JSUtils.authData(this, req, "j_list", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "j_list");
			JSUtils.authData(this, req, "j_imglist", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "j_imglist");
			JSUtils.authData(this, req, "j_content", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "j_content");
			JSUtils.authData(this, req, "isshow", JSUtils.AUTH_BOOL);
			JSUtils.input4HashMap(req, data, "isshow");
			JSUtils.authData(this, req, "order", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "order");
			JSUtils.authData(this, req, "listnum", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "listnum");
			String sql = JSUtils.buildInsertSql("js", "molds", data);
			sqlCommand.execute(sql);
			//创建表
			sqlCommand.execute(JSUtils.buildCreateCommonSql("js_"+data.get("molds")));
			sqlCommand.execute(JSUtils.buildCreateCommonFieldSql("js_"+data.get("molds")+"_field"));
			
			this.jump("admin.php?c=mold&a=index");
			return ;
		}else if(op !=null&&op.equals("edit")){
			MoldsModel molds = new MoldsModel();
			Integer mid = new Integer(req.getParameter("mid"));
			HashMap<String, Object> data = molds.findById(mid);
			req.setAttribute("data", data);
		}else if(op != null && op.equals("del")){
			Integer mid = new Integer(req.getParameter("mid"));
			MoldsModel molds = new MoldsModel();
			molds.deleteById(mid);
			this.jump("admin.php?c=mold&a=index");
			return ;
		}else if(op != null && op.equals("update")){
			MoldsModel molds = new MoldsModel();
			Integer mid = new Integer(req.getParameter("mid"));
			HashMap<String, Object> data =new HashMap<String, Object>();
			JSUtils.authData(this, req, "moldname", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "moldname");
			JSUtils.authData(this, req, "molds", JSUtils.AUTH_CHAR);
			JSUtils.input4HashMap(req, data, "molds");
			JSUtils.authData(this, req, "j_index", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "j_index");
			JSUtils.authData(this, req, "j_list", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "j_list");
			JSUtils.authData(this, req, "j_imglist", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "j_imglist");
			JSUtils.authData(this, req, "j_content", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "j_content");
			JSUtils.authData(this, req, "isshow", JSUtils.AUTH_BOOL);
			JSUtils.input4HashMap(req, data, "isshow");
			JSUtils.authData(this, req, "order", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "order");
			JSUtils.authData(this, req, "listnum", JSUtils.AUTH_INT);
			molds.update(data,"where mid="+mid);
			this.jump("admin.php?c=mold&a=index");
			return ;
		}
		//决定新增或者更新
		req.setAttribute("opc", op);
		this.display("admin/mold/moldnew.jsp", false);
	}
}
