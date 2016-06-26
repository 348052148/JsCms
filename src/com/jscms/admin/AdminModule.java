package com.jscms.admin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jscms.frame.JSModule;
import com.jscms.frame.JSDbConnection;

public class AdminModule extends JSModule{
	
	public AdminModule(){}
	
	public void actionIndex(HttpServletRequest req,HttpServletResponse res) throws IOException{
		
		JSDbConnection conn = new JSDbConnection();
		ResultSet result = conn.query("select url from js_link where id=1");
		try {
			while(result.next())
				System.out.println(result.getString("url"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//this.display("admin/index.jsp", false);
	}
	
	
}
