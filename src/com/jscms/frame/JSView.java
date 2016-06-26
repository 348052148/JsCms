package com.jscms.frame;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JSView {
	private HttpServletResponse res;
	private HttpServletRequest req;
	public JSView(HttpServletResponse res,HttpServletRequest req){
		this.res = res;
		this.req = req;
	}
	/*页面转发*/
	public void display(String Path,Boolean f){
		try {
			RequestDispatcher dispatcher = this.req.getRequestDispatcher(Path);
			if(!f){
				dispatcher.forward(this.req, this.res);
			}else{
				dispatcher.include(this.req, this.res);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*错误跳转*/
	public void error(String location){
		try {
			this.res.sendRedirect(location);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*页面跳转*/
	public void jump(String location){
		try {
			this.res.sendRedirect(location);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**/
	
}
