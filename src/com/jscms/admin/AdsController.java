package com.jscms.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.model.AdsModel;
import com.jscms.admin.model.AdsTypeModel;
import com.jscms.frame.JSController;
import com.jscms.frame.JSModule;
import com.jscms.frame.JSSqlCommand;
import com.jscms.frame.JSUtils;

public class AdsController extends JSController {
	public void Init(){
		this.isValidate=true;
	}
	public AdsController(JSModule module){
		super(module);
	}
	
	public void actionIndex(HttpServletRequest req,HttpServletResponse res){
			
		actionAdstype(req, res);
		
	}
	public void actionAds(HttpServletRequest req,HttpServletResponse res){
		JSSqlCommand sqlCommand = new JSSqlCommand();
		ArrayList<Map<String, Object>> adslist = sqlCommand.queryMultForMap("SELECT a.adsh,a.adsw,a.`name`,a.type,a.id,a.taid,j.`name` as adstype FROM js_ads a JOIN js_adstype j on a.taid=j.taid",new String[]{
				"adsh","adsw","type","id","taid","adstype","name"
		});
		req.setAttribute("adsList", adslist);
		
		this.display("admin/ads/adslist.jsp", false);
	}
	public void actionAdstype(HttpServletRequest req,HttpServletResponse res){
		JSSqlCommand sqlCommand = new JSSqlCommand();
		ArrayList<Map<String, Object>> adstypeList = sqlCommand.queryMultForMap("SELECT * FROM js_adstype");
		req.setAttribute("adstypeList", adstypeList);
		
		this.display("admin/ads/adstypelist.jsp", false);
	}
	
	public void actionEditAdstype(HttpServletRequest req,HttpServletResponse res){
		String id = req.getParameter("id");
		AdsTypeModel adsType = new AdsTypeModel();
		if(JSUtils.reqMethod(req)){
			HashMap<String, Object> adstype = adsType.findById(new Integer(id));
			req.setAttribute("adstype", adstype);
		}else{
			
			HashMap<String, Object> data = new HashMap<String, Object>();
			JSUtils.authData(this, req, "name", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "name");
			JSUtils.authData(this, req, "adsw", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "adsw");
			JSUtils.authData(this, req, "adsh", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "adsh");
			adsType.update(data, "where taid="+id);
			this.jump("admin.php?c=ads&a=adstype");
			return ;
		}
		
		this.display("admin/ads/adstypenew.jsp", false);
	}
	public void actionDeleteAdstype(HttpServletRequest req,HttpServletResponse res){
		String id = req.getParameter("id");
		AdsTypeModel adsType = new AdsTypeModel();
		adsType.deleteById(new Integer(id));
		this.jump("admin.php?c=ads&a=adstype");
	}
	public void actionAddAdstype(HttpServletRequest req,HttpServletResponse res){
		
		if(JSUtils.reqMethod(req)){
			
		}else{
			AdsTypeModel adsType = new AdsTypeModel();
			HashMap<String, Object> data = new HashMap<String, Object>();
			JSUtils.authData(this, req, "name", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "name");
			JSUtils.authData(this, req, "adsw", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "adsw");
			JSUtils.authData(this, req, "adsh", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "adsh");
			adsType.save(data);
			this.jump("admin.php?c=ads&a=ads");
			return ;
		}
	
		this.display("admin/ads/adstypenew.jsp", false);
	}
	
	
	
	
	
	
	public void actionEditAds(HttpServletRequest req,HttpServletResponse res){
		
		String id = req.getParameter("id");
		AdsModel adsModel =  new AdsModel();
		

		JSSqlCommand sqlCommand = new JSSqlCommand();
		ArrayList<Map<String, Object>> adstypeList = sqlCommand.queryMultForMap("SELECT * FROM js_adstype");
		req.setAttribute("adstypeList", adstypeList);
		
		if(JSUtils.reqMethod(req)){
			HashMap<String, Object> ads = adsModel.findById(new Integer(id));
			req.setAttribute("ads", ads);
		}else{
			
			HashMap<String, Object> data = new HashMap<String, Object>();
			JSUtils.authData(this, req, "name", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "name");
			JSUtils.authData(this, req, "adsw", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "adsw");
			JSUtils.authData(this, req, "adsh", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "adsh");
			JSUtils.authData(this, req, "type", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "type");
			JSUtils.authData(this, req, "adfile", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "adfile");
			JSUtils.authData(this, req, "gourl", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "gourl");
			JSUtils.authData(this, req, "isshow", JSUtils.AUTH_BOOL);
			JSUtils.input4HashMap(req, data, "isshow");
			JSUtils.authData(this, req, "order", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "order");
			JSUtils.authData(this, req, "taid", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "taid");
			adsModel.update(data, "where id="+id);
			this.jump("admin.php?c=ads&a=ads");
			return ;
		}
		
		this.display("admin/ads/adsnew.jsp", false);
	}
	
	public void actionAddAds(HttpServletRequest req,HttpServletResponse res){
		JSSqlCommand sqlCommand = new JSSqlCommand();
		ArrayList<Map<String, Object>> adstypeList = sqlCommand.queryMultForMap("SELECT * FROM js_adstype");
		req.setAttribute("adstypeList", adstypeList);
		if(JSUtils.reqMethod(req)){
			
		}else{
			AdsModel adsModel =  new AdsModel();
			HashMap<String, Object> data = new HashMap<String, Object>();
			JSUtils.authData(this, req, "name", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "name");
			JSUtils.authData(this, req, "adsw", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "adsw");
			JSUtils.authData(this, req, "adsh", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "adsh");
			JSUtils.authData(this, req, "type", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "type");
			JSUtils.authData(this, req, "adfile", JSUtils.AUTH_STRING);
			JSUtils.input4HashMap(req, data, "adfile");
			JSUtils.authData(this, req, "gourl", JSUtils.AUTH_URL);
			JSUtils.input4HashMap(req, data, "gourl");
			JSUtils.authData(this, req, "isshow", JSUtils.AUTH_BOOL);
			JSUtils.input4HashMap(req, data, "isshow");
			JSUtils.authData(this, req, "order", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "order");
			JSUtils.authData(this, req, "taid", JSUtils.AUTH_INT);
			JSUtils.input4HashMap(req, data, "taid");
			adsModel.save(data);
			this.jump("admin.php?c=ads&a=index");
			return ;
		}
	
		this.display("admin/ads/adsnew.jsp", false);
	}
	
	public void actionDeleteAds(HttpServletRequest req,HttpServletResponse res){
		String id = req.getParameter("id");
		AdsModel adsModel =  new AdsModel();
		adsModel.deleteById(new Integer(id));
		this.jump("admin.php?c=ads&a=index");
	}
}
