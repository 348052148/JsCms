package com.jscms.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.jscms.frame.JSSqlCommand;
import com.jscms.orm.Section;

public class HeadService {
	public static JSSqlCommand sqlCommand = new JSSqlCommand();
	
	//获取栏目按order排序
	public static ArrayList<Section> getSectionList(){
		
		
		ArrayList<Section> sectionList = sqlCommand.queryForObject("SELECT * from js_section ORDER BY `order` limit 10", "com.jscms.orm.Section");
		
		return sectionList;
	}
	
	//
}
