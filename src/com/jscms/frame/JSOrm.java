package com.jscms.frame;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Set;
import java.util.Map.Entry;

import com.jscms.orm.Section;

public class JSOrm {
	public JSOrm(){}
	public JSOrm(int id,String className){
		
		HashMap<String, Object> sectionData=null;
		try {
			Class clz = Class.forName("com.jscms.admin.model."+className);
			Object obj = clz.newInstance();
			Method findById = clz.getMethod("findById", int.class);
			sectionData = (HashMap<String, Object>) findById.invoke(obj, id);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Set<Entry<String, Object>> sets = sectionData.entrySet();  
        for(Entry<String, Object> entry : sets) {
        	try {
				Method setMethod = Section.class.getMethod("set"+JSUtils.uppercase4Index(entry.getKey()),Object.class);
				setMethod.invoke(this, entry.getValue());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
        }
	}
}
