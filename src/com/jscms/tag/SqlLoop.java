package com.jscms.tag;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.jscms.frame.JSSqlCommand;

public class SqlLoop extends SimpleTagSupport {
	private int limit = 0;  
    
    public void setLimit(int limit){  
        this.limit = limit; 
    }
    
    private String table = "";  
    
    public void setTable(String table){  
        this.table = table; 
    }
    private String var="";
    
    public void setVar(String var){
    	this.var=var;
    }
    
    public String select = "";
    
    public void setSelect(String select) {
		this.select = select;
	}
    
    private String dselect="";
    
	public void setDselect(String dselect) {
		this.dselect = dselect;
	}
	
	private String joinSql="";
	
	

	public void setJoinSql(String joinSql) {
		this.joinSql = joinSql;
	}



	@Override  
    public void doTag() throws JspException, IOException {
    	JSSqlCommand sqlCommand = new JSSqlCommand();
        JspFragment jf = this.getJspBody();
        String limitSql="";
        if(limit > 0){
        	limitSql=" limit "+limit;
        }
        if(!select.equals("")){
        	select=" where "+select;
        }
        if(!joinSql.equals("")){
        	joinSql=" "+joinSql+" ";
        }
        System.out.println("select * from "+table+joinSql+select+limitSql);
        ArrayList<Map<String, Object>> dataList = sqlCommand.queryMultForMap("select * from "+table+joinSql+select+limitSql);
        if(dataList.size()==0){
        	if(!dselect.equals("")){
            	dselect=" where "+dselect;
            	dataList = sqlCommand.queryMultForMap("select * from "+table+joinSql+dselect+limitSql);
            }
        	
        }
        for(Map<String, Object> data : dataList){
        	 this.getJspContext().setAttribute(var, data);
        	 jf.invoke(null);
        }
    }  
}
