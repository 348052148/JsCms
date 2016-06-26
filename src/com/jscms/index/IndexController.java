package com.jscms.index;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSSqlCommand;
import com.jscms.frame.JSUtils;
import com.jscms.orm.Section;
import com.jscms.service.HeadService;

public class IndexController extends JSController {
	public IndexController(JSModule module){
		super(module);
	}
	public void Init(){
		this.isValidate=false;
	}
	//���˼·   ǰ����Ϊһ������ȶ���״̬���������ÿ���������һЩ��������  ������Ӧ�ķ������ﵽʵ����Ӧ�Ĺ��ܡ�
	/**
	 * ��ҳ
	 */
	public void actionIndex(HttpServletRequest req,HttpServletResponse res){
		JSSqlCommand sqlCommand = new JSSqlCommand();
		//��Ŀ
		ArrayList<Map<String, Object>> sectionList = sqlCommand.queryMultForMap("SELECT * from js_section ORDER BY `order` limit 10");
		req.setAttribute("sectionList", sectionList);
		//��ȡģ��·��
		String templatePath = this.getSystemInfo().getDefaltTemple();
		//��վ��Ϣ
		HashMap<String, String> webInfo = new HashMap<String, String>();
		webInfo.put("title", this.getModule().getSystemInfo().getSiteName());
		webInfo.put("url", this.getModule().getSystemInfo().getSiteUrl());
		webInfo.put("keywords", this.getModule().getSystemInfo().getIndexKey());
		webInfo.put("desc", this.getModule().getSystemInfo().getIndexDes());
		req.setAttribute("webInfo", webInfo);
		this.display("template/"+templatePath+"/index.jsp", false);
	}
	/*
	 * ��ҳ��ʾ
	 * */
	public void actionList(HttpServletRequest req,HttpServletResponse res){
		String id = req.getParameter("id");
		JSSqlCommand sqlCommand = new JSSqlCommand();
		
		//��ȡ��ǰ��Ŀ��Ϣ
		HashMap<String, Object> type = sqlCommand.queryForMap(JSUtils.buildSelectSql("js", "section", null, "where id="+id));
		req.setAttribute("type", type);
		
		//seo
		HashMap<String, Object> page = new HashMap<String, Object>();
		page.put("title", type.get("name"));
		page.put("url", this.getModule().getSystemInfo().getSiteUrl());
		page.put("keywords", type.get("keywords"));
		page.put("desc", type.get("about"));
		req.setAttribute("page", page);
		
		String molds = type.get("molds").toString();
		//��ȡ��ǰ��Ŀ���б���Ϣ
		String listSql = "SELECT * from js_"+molds+" a LEFT JOIN js_"+molds+"_field f on  a.id=f.cid WHERE isshow=1 and sid="+type.get("id").toString();
		ArrayList<Map<String, Object>> lists = sqlCommand.queryMultForMap(listSql);
		req.setAttribute("lists", lists);
		//���м����
		String positions="<a href='index.php' >��ҳ</a> > <a href='index.php?a=list&id="+id+"'>"+type.get("name").toString()+"</a>";
		req.setAttribute("positions", positions);
		//ģ��dindex ��ȡģ��
		String dindex = type.get("dindex").toString();
		if(dindex.equals("1")){
			dindex="j_list";
		}
		if(dindex.equals("2")){
			dindex="j_imglist";
		}
		if(dindex.equals("3")){
			dindex="j_index";
		}
		HashMap<String, Object> mold = sqlCommand.queryForMap(JSUtils.buildSelectSql("js", "molds", null, "where molds='"+molds+"'"));
		String template = mold.get(dindex).toString();
		//��ȡģ��·��
		String templatePath = this.getSystemInfo().getDefaltTemple();
		
		this.display("template/"+templatePath+"/"+template, false);
	}
	/*
	 *��������ҳ��
	 **/
	public void actionContent(HttpServletRequest req,HttpServletResponse res){
		
		JSSqlCommand sqlCommand = new JSSqlCommand();
		String id = req.getParameter("id");
		String aid = req.getParameter("aid");
		
		//��ȡ��ǰ��Ŀ��Ϣ
		HashMap<String, Object> type = sqlCommand.queryForMap(JSUtils.buildSelectSql("js", "section", null, "where id="+id));
		req.setAttribute("type", type);
		
		String molds = type.get("molds").toString();
		//��ȡ����������Ϣ
		HashMap<String, Object> content = sqlCommand.queryForMap(JSUtils.buildSelectSql("js", molds, null, "where id="+aid));
		req.setAttribute("content",content);
		//���м����
		String positions="<a href='index.php' >��ҳ</a> > <a href='index.php?a=list&id="+id+"'>"+type.get("name").toString()+"</a>";
		req.setAttribute("positions", positions);
		//��ȡ��һƪ������Ϣ
		HashMap<String, Object> aprev = sqlCommand.queryForMap("select * from js_"+molds+" where id = (select id from js_"+molds+" where id < "+aid+" order by id asc limit 1)");
		req.setAttribute("aprev", aprev);
		//��ȡ��һƪ������Ϣ
		HashMap<String, Object> anext = sqlCommand.queryForMap("select * from js_"+molds+" where id = (select id from js_"+molds+" where id > "+aid+" order by id asc limit 1)");
		req.setAttribute("anext", anext);
		//ģ��dindex ��ȡģ��
		HashMap<String, Object> mold = sqlCommand.queryForMap(JSUtils.buildSelectSql("js", "molds", null, "where molds='"+molds+"'"));
		String template = mold.get("j_content").toString();
		//��ȡģ��·��
		String templatePath = this.getSystemInfo().getDefaltTemple();
		
		
		//seo
		HashMap<String, Object> page = new HashMap<String, Object>();
		page.put("title", type.get("name")+"-"+content.get("title"));
		page.put("url", this.getModule().getSystemInfo().getSiteUrl());
		page.put("keywords", content.get("keyword"));
		page.put("desc", content.get("desc"));
		req.setAttribute("page", page);
		
		this.display("template/"+templatePath+"/"+template, false);
	}
	public void actionSearch(HttpServletRequest req,HttpServletResponse res){
		
		this.display("template/default/aricle/search.jsp", false);
	}
}
