package com.jscms.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.model.CommentModel;
import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSSqlCommand;
import com.jscms.frame.JSUtils;

public class CommentController extends JSController {
	public void Init(){
		this.isValidate=true;
	}
	public CommentController(JSModule module){
		super(module);
	}
	
	public void actionIndex(HttpServletRequest req,HttpServletResponse res){
		
		JSSqlCommand sqlCommand = new JSSqlCommand();
		ArrayList<Map<String, Object>> comments = sqlCommand.queryMultForMap(JSUtils.buildSelectSql("js", "comment", null, ""));
		req.setAttribute("comments", comments);
		
		this.display("admin/comment/commentlist.jsp", false);
	}
	
	public void actionEdit(HttpServletRequest req,HttpServletResponse res){
		
		String id = req.getParameter("id");
		CommentModel comment = new CommentModel();
		
		if(JSUtils.reqMethod(req)){
			HashMap<String, Object> comm = comment.findById(new Integer(id));
			req.setAttribute("comment", comm);
			
			HashMap<String, Object> um = new HashMap<String, Object>();
			um.put("bodyname", "content");
			um.put("bodycontent", comm.get("content"));
			req.setAttribute("um", um);
			um.put("stylewidth", "500px");
			um.put("styleheight", "200px");
			this.display("admin/comment/commentnew.jsp", false);
			return ;
		}else{
			HashMap<String, Object> data = new HashMap<String, Object>();
			JSUtils.input4HashMap(req, data, "content");
			JSUtils.authData(this, req, "isshow", JSUtils.AUTH_BOOL);
			JSUtils.input4HashMap(req, data, "isshow");
			comment.update(data, "where id="+id);
			this.jump("admin.php?c=comment&a=index");
		}
	}
	
	public void actionDelete(HttpServletRequest req,HttpServletResponse res){
		
		String id = req.getParameter("id");
		
		CommentModel comment = new CommentModel();
		
		comment.deleteById(new Integer(id));
		
		this.jump("admin.php?c=comment&a=index");
	}
}
