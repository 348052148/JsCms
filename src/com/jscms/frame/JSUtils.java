package com.jscms.frame;

import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.admin.obj.SystemInfo;
import com.sun.management.OperatingSystemMXBean;

import sun.jdbc.odbc.OdbcDef;

public class JSUtils {
	/*����ĸ��д*/
	public static String uppercase4Index(String str){
		String oldChar = str.charAt(0)+"";
		String newChar = str.toUpperCase().charAt(0)+"";
		str=newChar + str.substring(1);
		return str;
	}
	
	/*����Controllerȫ����*/
	public static String buildController(String controller){
		return uppercase4Index(controller)+"Controller";
	}
	
	/*����Actionȫ����*/
	public static String buildAction(String action){
		return "action"+uppercase4Index(action);
	}
	
	/*��վ·������*/
	public static void webAppPath(HttpServletRequest req){
		System.out.println(req.getLocalAddr());
		System.out.println(req.getLocalName());
		System.out.println(req.getQueryString());
		System.out.println(req.getRemoteAddr());
		System.out.println(req.getServletPath());
		System.out.println(req.getContextPath());
		System.out.println(req.getRequestURL());
		System.out.println(req.getPathTranslated());
	}
	/*��ȡģ��·��*/
	public static String reqWebModuld(HttpServletRequest req){
		return new String((StringBuffer)req.getAttribute("Module"));
	}
	/*��������·��*/
	public static String buildReqPath(HttpServletRequest req,String controller,String action){
		return reqWebModuld(req)+"?c="+controller+"&a="+action;
	}
	public static String buildReqPath(HttpServletRequest req,String controller,String action,String data){
		return reqWebModuld(req)+"?c="+controller+"&a="+action+data;
	}
	
	
	/*����ģ��ķ�ʽ��ȡ*/
	public static String buildReqRealPath(HttpServletRequest req,String controller,String action,String data){
		return req.getRequestURL()+"c="+controller+"&a="+action+data;
	}
	public static String buildReqRealPath(HttpServletRequest req,String controller,String action){
		return req.getRequestURL()+"c="+controller+"&a="+action;
	}
	/*��̬��Դ·��*/
	public static String staticAdminRsPath(HttpServletRequest req){
		return req.getContextPath()+"/admin/bootstrap/";
	}
	/*umeditor�༭����̬·��*/
	public static String staticUmEditRsPath(HttpServletRequest req){
		return req.getContextPath()+"/ueditor/";
	}
	/*������ҳ*/
	public static String buildFenYeSql(int page,int num){
		int pre=0+(page-1)*num;
		int limit = page*num;
		return "limit "+pre+","+limit;
	}
	/*�����ҳ����*/
	public static void setFenYeData(HttpServletRequest req,int num , int total,int page){
		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("pageNum", num);
		pageInfo.put("total", total);
		pageInfo.put("page", page);
		req.setAttribute("pageInfo", pageInfo);
	}
	/*������ҳ*/
	public static void buildFenYe(HttpServletRequest req,int num , int total,int page,String url){
		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		int totalf=1;
		if((total%num)==0)
			totalf=(int)(total/num);
		else
			totalf=(int)(total/num)+1;
		pageInfo.put("pageNum", num);
		pageInfo.put("total", totalf);
		pageInfo.put("page", page);
		pageInfo.put("url", url);
		req.setAttribute("pageInfo", pageInfo);
		
	}
	/*������������sql*/
	public static String buildInsertSql(String prefix,String tableName,HashMap<String, Object> data){
		String sql ="insert into "+prefix+"_"+tableName+" ";
		String key ="(";
		String val ="value(";
		Set<Entry<String, Object>> sets = data.entrySet();  
        for(Entry<String, Object> entry : sets) {  
            key+="`"+entry.getKey()+"`,";
            val+="'"+entry.getValue()+"',";
        }
        key=key.substring(0,key.length()-1)+") ";
        val=val.substring(0,val.length()-1)+")";
        sql=sql+key+val;
        return sql;
	}
	/*�����������*/
	public static String buildUpdateSql(String prefix,String tableName,HashMap<String, Object> data,String whereSql){
		String sql ="UPDATE "+prefix+"_"+tableName+" SET";
		String setVal="";
		Set<Entry<String, Object>> sets = data.entrySet();  
        for(Entry<String, Object> entry : sets) {  
        	setVal+="`"+entry.getKey()+"`='"+entry.getValue()+"',";
        }
        setVal=setVal.substring(0,setVal.length()-1);
        sql+=setVal+" ";
        if(whereSql!=null){
        	sql+=whereSql;
        }
		return sql;
	}
	/*������ѯ���*/
	public static String buildSelectSql(String prefix,String tableName,HashMap<String, Object> data,HashMap<String, Object> where){
		String sql ="SELECT ";
		if(data == null){
			sql+="* FROM "+prefix+"_"+tableName+" ";
		}else{
			
		}
		/*ֵ*/
		if(where == null){
			
		}else{
			String wheresql = "WHERE ";
			Set<Entry<String, Object>> sets = where.entrySet();  
	        for(Entry<String, Object> entry : sets) {  
	        	wheresql+="`"+entry.getKey()+"`='"+entry.getValue()+"' AND ";
	        }
	        wheresql=wheresql.substring(0,wheresql.length()-5);
	        sql+=wheresql;
		}
		return sql;
	}
	
	public static String buildSelectSql(String prefix,String tableName,HashMap<String, Object> data,String wheresql){
		String sql ="SELECT ";
		if(data == null){
			sql+="* FROM "+prefix+"_"+tableName+" ";
		}else{
			
		}
		/*ֵ*/
		if(wheresql == null){
			
		}else{
			sql+=wheresql;
		}
		return sql;
	}
	/*��req���ݷ���hashmap*/
	public static void input4HashMap(HttpServletRequest req,HashMap<String, Object> data,String key){
		String val = req.getParameter(key);
		if(val==null) val="";
		data.put(key, val);
	}
	//�Զ����ֶβ�ִ���
	public static HashMap<String, Object> input4Table(HttpServletRequest req){
		HashMap<String, Object> data = new HashMap<String, Object>();
		Enumeration<String> lns = req.getParameterNames();
		while(lns.hasMoreElements()){
			String fieldName=lns.nextElement();
			if(fieldName.matches("field_.*?")){
				data.put(fieldName.substring(6), req.getParameter(fieldName));
			}
		}
		return data;
	}
	
	//�������
	public static void input4HashMapMut(HttpServletRequest req,HashMap<String, Object> data,String key,String[] cloname){
		String[] values = req.getParameterValues(key);
		String v = new String();
		for(String value : values){
			data.put(key, v);
		}
		
	}
	/*��req�������� ���ݷ��벢����split ��ϳ�һ���ַ��� �����˽�β*/
	public static void input4HashMapSplit(HttpServletRequest req,HashMap<String, Object> data,String key,char split){
		String[] values = req.getParameterValues(key);
		if(values == null ){
			return ;
		}
		String v = new String();
		for(String value : values){
			v+=value+split;
		}
		v = v.substring(0,v.length()-1);
		data.put(key, v);
	}
	/*��req���ݷ���hashmap*/
	public static void input4HashMapEmpty(HttpServletRequest req,HashMap<String, Object> data,String key){
		String val = req.getParameter(key);
		if(val==null || val.equals("")) return ;
		System.out.println(val);
		data.put(key, val);
	}
	/**/
	public static void input4HashMap2(HttpServletRequest req,HashMap<String, Object> data,String key,String[] rkey){
		String val = req.getParameter(key);
		if(val==null) val="NULL";
		System.out.println(val);
		String[] sval = val.split(":");
		int index=0;
		for(String k : rkey){
			data.put(k, sval[index++]);
		}
	}
	/*������ݷ���hashmap*/
	public static void output4HashMap(HttpServletRequest req,HashMap<String, Object> data,String key,Object val){
		data.put(key,val);
	}
	
	/*��ȡ����*/
	public static boolean reqMethod(HttpServletRequest req){
		if(req.getMethod().equals("GET")){
			return true;
		}else{
			return false;
		}
	}
	
	/*������Ŀ�㼶��*/
	public static void sectionTree(String pid,ArrayList<Object> list,int f){
		JSSqlCommand sqlCommand = new JSSqlCommand();
		ArrayList<Map<String, Object>> sections = sqlCommand.queryMultForMap("select id,pid,name from js_section where pid="+pid, new String[]{"id","pid","name"});
		
		for(Map<String, Object> section : sections){
			String oldname = (String) section.get("name");
			if(f>0){
				String preStr = "|";
				for(int i=0;i<f;i++){
					preStr+="��";
				}
				section.put("name", preStr+oldname);
			}
			
			list.add(section);
			
			Map<String, Object> exitse = sqlCommand.queryForMap("select id,pid,name from js_section where pid="+section.get("id"));
			if(!exitse.isEmpty()){
				sectionTree(section.get("id").toString(),list,f+1);
			}
		}
		
	}
	/*�ɶ���*/
	public static void sectionTree(String pid,ArrayList<Object> list,int f,String[] fields){
		JSSqlCommand sqlCommand = new JSSqlCommand();
		String sql="SELECT ";
		for(String field : fields){
			sql+="`"+field+"`,";
		}
		sql=sql.substring(0,sql.length()-1);
		sql+=" from js_section where `pid`="+pid;
		
		ArrayList<Map<String, Object>> sections = sqlCommand.queryMultForMap(sql,fields);
		
		for(Map<String, Object> section : sections){
			String oldname = (String) section.get("name");
			if(f>0){
				String preStr = "|";
				for(int i=0;i<f;i++){
					preStr+="��";
				}
				section.put("name", preStr+oldname);
			}
			section.put("level", f);
			list.add(section);
			
			Map<String, Object> exitse = sqlCommand.queryForMap("select id,pid,name from js_section where pid="+section.get("id"));
			if(!exitse.isEmpty()){
				sectionTree(section.get("id").toString(),list,f+1,fields);
			}
		}
		
	}
	
	/*����������sql*/
	public static String buildCreateTableSql(){
		return "";
	}
	//����
	/*��������ģ�͹����ֶα�sql*/
	public static String buildCreateCommonSql(String table){
		String sql ="CREATE TABLE `"+table+"` ("+
		  "`id` int(11) NOT NULL AUTO_INCREMENT,"+
		  "`sid` int(11) DEFAULT NULL COMMENT 'section_id',"+
		  "`isshow` char(255) DEFAULT NULL,"+
		  "`title` varchar(255) DEFAULT NULL,"+
		  "`url` varchar(255) DEFAULT NULL,"+
		  "`htmlfile` varchar(255) DEFAULT NULL,"+
		  "`addtime` varchar(50) DEFAULT NULL,"+
		  "`modifytime` varchar(50) DEFAULT NULL,"+
		  "`hits` int(11) DEFAULT NULL COMMENT '������',"+
		  "`order` int(11) DEFAULT NULL,"+
		  "`desc` tinytext,"+
		  "`body` text,"+
		  "`keyword` varchar(255) DEFAULT NULL,"+
		  "PRIMARY KEY (`id`)"+
		  ") ENGINE=InnoDB DEFAULT CHARSET=utf8;";
		
		return sql;
	}
	public static String buildCreateCommonFieldSql(String table){
		String sql ="CREATE TABLE `"+table+"` ("+
				  "`id` int(11) NOT NULL AUTO_INCREMENT,"+
				  "`cid` int(11) DEFAULT NULL,"+
				  "PRIMARY KEY (`id`)"+
				  ") ENGINE=InnoDB DEFAULT CHARSET=utf8;";
				
				return sql;
	}
	//����
	/*�����޸ı�ṹsql*/
	public static String buildAddFieldSql(String table,HashMap<String, Object> fieldInfo){
		String sql="alter table "+table+" add "+fieldInfo.get("fieldName")+" "+fieldInfo.get("fieldType")+"("+fieldInfo.get("fieldLong")+") not null default '';";
		return sql;
	}
	//����
	public static String buildModifyFieldSql(String table,HashMap<String, Object> fieldInfo){
		String sql="alter table "+table+" modify "+fieldInfo.get("fieldName")+" "+fieldInfo.get("fieldType")+"("+fieldInfo.get("fieldLong")+") not null default '';";
		return sql;
	}
	
	/*����ɾ����sql*/
	public static String buildDelTableSql(String table){
		String sql = "drop table "+table;
		return sql;
	}
	
	/*��ȡ��ǰʱ��*/
	public static String getNowDate(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Object time=null;
		try {
			time = sdf.format(new Date());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return time.toString();
	}
	
	/*ϵͳ��Ϣ*/
	public static HashMap<String, Object> getSystemInfo(){
		OperatingSystemMXBean osmb = (OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
		String memory = "ϵͳ�����ڴ��ܼƣ�" + osmb.getTotalPhysicalMemorySize() / 1024/1024 + "MB";
		String free = "ϵͳ��������ڴ��ܼƣ�" + osmb.getFreePhysicalMemorySize() / 1024/1024 + "MB";
		long use = (Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory())/(1024*1024);
		String useMemory = "ϵͳʹ���ڴ��ܼ�"+new Long(use) +"MB";
		
		String javaVersion = System.getProperty("java.version");  
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("total", memory);
		data.put("free", free);
		data.put("use", useMemory);
		data.put("Jdkversion", javaVersion);
		return data;
	}
	
	/*push���ݵ������ļ�*/
	public static void pushSysProperties(HashMap<String, Object> data,SystemInfo sysInfo){
		Class sysClz = sysInfo.getClass();
		Set<Entry<String, Object>> sets = data.entrySet();  
        for(Entry<String, Object> entry : sets) {
        	Class[] args = new Class[1];
        	args[0] = String.class;
        	Method setMethod;
        	try {
        		setMethod=sysClz.getMethod("set"+uppercase4Index(entry.getKey()), args);
        		setMethod.invoke(sysInfo, entry.getValue());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        sysInfo.store();
	}
	
	public  static String MD5(String inStr){
		MessageDigest md5 = null;  
        try{  
            md5 = MessageDigest.getInstance("MD5");  
        }catch (Exception e){  
            System.out.println(e.toString());  
            e.printStackTrace();  
            return "";  
        }  
        char[] charArray = inStr.toCharArray();  
        byte[] byteArray = new byte[charArray.length];  
  
        for (int i = 0; i < charArray.length; i++)  
            byteArray[i] = (byte) charArray[i];  
        byte[] md5Bytes = md5.digest(byteArray);  
        StringBuffer hexValue = new StringBuffer();  
        for (int i = 0; i < md5Bytes.length; i++){  
            int val = ((int) md5Bytes[i]) & 0xff;  
            if (val < 16)  
                hexValue.append("0");  
            hexValue.append(Integer.toHexString(val));  
        }  
        return hexValue.toString();
	}
	
	//
	public static boolean exists4Array(String[] arr,String s){
		boolean bResult = false;
		for(String e:arr){
			System.out.println("SEARCH:"+e);
		}
		for(String temp:arr){
			 if(temp.equals(s)){
				 bResult = true;
				 
				 break;
			 }
		}
		return bResult;
	}
	
	//����uuid
	public static String UUIDS(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
	
	public static void createUMEdit(HttpServletRequest req,HttpServletResponse res){
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("um.jsp");
		try {
			reqDispatcher.include(req, res);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//����ģ�������
	public static void loadServiceModule(HttpServletRequest req,HashMap<String, String> service){
		HashMap<String, Object> data = new HashMap<String, Object>();
		Set<Entry<String, String>> sets = service.entrySet();  
        for(Entry<String, String> entry : sets) {
        	try {
				Class clz = Class.forName(entry.getValue());
				Method[] method = clz.getDeclaredMethods();
				for(Method m : method){
					data.put(m.getName(), m.invoke(null, null));
				}
				req.setAttribute(entry.getKey(), data);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
		
	}
	
	//���÷���ģ�鷽��
	
	
	//�����ϴ����
	public static String buildUploadHtml(String name,String value,boolean fields){
		String hostUrl = "/"+getSystemPath()+"/admin.php";
		if(fields)
			name="field_"+name;
		String script="<script type='text/javascript' language='javascript'>"+
		"$(document).ready(function(){"+
		"$('#file_upload"+name+"').change(function(){"+
		"alert('xxxx');"+
		"$('#uploadLog"+name+"').html('�����ϴ�');"+
		"var data = new FormData();"+
		"$.each($('#file_upload"+name+"')[0].files, function(i, file) { data.append('file_upload"+name+"', file);});"+
		"$.ajax({url:'"+hostUrl+"?c=upload&a=upload',type:'POST',data:data,cache: false,contentType: false,processData: false,success:function(data){$('#imgShow"+name+"').css({'display':'block'});$('#imgShow"+name+"').attr('src',data);$('#uploadLog"+name+"').html('');$('#"+name+"').val(data);}});"+
		"});});</script>";
		
		String html="<input type='file' name='file_upload"+name+"'  id='file_upload"+name+"'/>"+
					"<input type='hidden' id='"+name+"' name='"+name+"' value='"+value+"' />"+
					"<div id='uploadLog"+name+"'></div></br>";
					if(value==null || value.equals("")){
						html+="<img width='150' src='"+value+"' height='150' id='imgShow"+name+"' style='display: none;' alt='����ͼ' />";
					}else{
						html+="<img width='150' src='"+value+"' height='150' id='imgShow"+name+"' style='' alt='����ͼ' />";
					}
		
		return script+html;
	}
	//��keyȡ��ֵ
	public static String buildValueForHashMap(HttpServletRequest req,String data,String key){
		if(req.getAttribute(data)==null || req.getAttribute(key)==null){
			return "";
		}
		key = req.getAttribute(key).toString();
		HashMap<String, Object> datas = (HashMap<String, Object>) req.getAttribute(data);
		return datas.get(key).toString();
	}
	
	//����ʽȡֵ
	public static String buildHashMap4Value(HttpServletRequest req,String data,String key){
		if(req.getAttribute(data)==null){
			return "";
		}
		HashMap<String, Object> datas = (HashMap<String, Object>) req.getAttribute(data);
		return datas.get(key).toString();
	}
	//��ֵ֤
	public static int AUTH_INT=1;
	public static int AUTH_BOOL=2;
	public static int AUTH_STRING=3;
	public static int AUTH_EMAIL=4;
	public static int AUTH_USER=5;
	public static int AUTH_PASS=6;
	public static int AUTH_COIN=7;
	public static int AUTH_PHONE=8;
	public static int AUTH_NUMBER=9;
	public static int AUTH_CHAR=10;
	public static int AUTH_URL=11;
	//������֤
	public static boolean authData(JSController controller,HttpServletRequest req,String key,int method){
		String pattern ="";
		switch (method) {
		case 1:
			pattern = "\\d*";
			break;
		case 2:
			pattern = "[0|1]";
			break;
		case 3:
			pattern = ".{0,255}";
			break;
		case 4:
			pattern = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
			break;
		case 5:
			pattern = "\\w{4,20}";
			break;
		case 6:
			pattern = "\\w{6,20}";
			break;
		case 7:
			pattern = ".{1}";
			break;
		case 8:
			pattern = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
			break;
		case 9:
			pattern = "[-|\\d]\\d*";
			break;
		case 10:
			pattern = "\\w{1,100}";
			break;
		case 11:
			pattern = "^http(s)?://w.*[.com|.com\\.cn].\\w*";
			break;
		default:
			break;
		}
		//\\b((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\b ip
		//^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$ �ֻ� [-|\\d]\\d*
		//http(s)?\:\/\/.*?\.{jpg|jpeg|gif|png}$
		//^http(s)?://w.*[.com|.com\\.cn].\\w*
		Pattern r = Pattern.compile(pattern);
		Matcher matcher = r.matcher(req.getParameter(key));
		if(!matcher.matches()){
			//δƥ����Ϣ
			System.out.println(key+":===>");
			controller.setError(key);
			return false;
		}
		return true;
	}
	
	public static String buildPositionHtml(HashMap<String, String> data){
		String position = 	"<ol class=\"breadcrumb\">";
		
		position += "<li><a href=\""+data.get("index")+"\">��ҳ</a></li>";
		Set<Entry<String, String>> sets = data.entrySet();  
        for(Entry<String, String> entry : sets) {
        	if(!entry.getKey().equals("index")){
        		String controller=entry.getKey();
        		String controlName ="";
        		if(controller.equals("section")) controlName="��Ŀ����";
        		if(controller.equals("ads")) controlName="������";
        		if(controller.equals("comment")) controlName="���۹���";
        		if(controller.equals("fields")) controlName="�ֶι���";
        		if(controller.equals("mold")) controlName="ģ�͹���";
        		if(controller.equals("system")) controlName="ϵͳ����";
        		if(controller.equals("way")) controlName="���ݹ���";
        		if(controller.equals("admin")) controlName="����Ա����";
        		position += "<li><a href=\""+entry.getValue()+"\">"+controlName+"</a></li>";
        	}
        }
        position += "</ol>";
		return position;
	}
	public static String getSystemPath(){
		return "JsCms";
	}
	
}
