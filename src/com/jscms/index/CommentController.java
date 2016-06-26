package com.jscms.index;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.model.CommentModel;
import com.jscms.admin.model.WayModel;
import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSSqlCommand;
import com.jscms.frame.JSUtils;

public class CommentController extends JSController {
	public CommentController(JSModule module){
		super(module);
	}
	public void Init(){
		this.isValidate=false;
	}
	
	public void actionAddComment(HttpServletRequest req,HttpServletResponse res) throws IOException{
		
		CommentModel comment = new CommentModel();
		HashMap<String, Object> data = new HashMap<String, Object>();
		JSUtils.input4HashMap(req, data, "content");
		JSUtils.input4HashMap(req, data, "tid");
		JSUtils.input4HashMap(req, data, "title");
		data.put("isshow", 0);
		data.put("pid", -1);
		data.put("atime", JSUtils.getNowDate());
		//栏目名称
		data.put("sname", JSUtils.getNowDate());
		//uid 根据session获取
		data.put("uid", -1);
		
		comment.save(data);
		JSUtils.webAppPath(req);
		res.setHeader("Content-Type", "text/html");
        res.getWriter().println("评价成功");
        res.getWriter().close();
	}
}
