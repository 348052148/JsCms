package com.jscms.orm;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Set;
import com.jscms.frame.JSOrm;

public class Section extends JSOrm{
	
	public Section(){
		super();
	}
	public Section(int id, String className) {
		super(id, className);
	}

	private Object id;
	
	private Object mid;
	
	private Object molds;
	
	private Object pid;
	
	private Object name;
	
	private Object litpic;
	
	private Object keywords;
	
	private Object wurl;
	
	private Object listnum;
	
	private Object isshow;
	
	private Object about;
	
	private Object dindex;
	
	private Object moldname;
	
	private Object order;
	
	

	public Object getId() {
		return id;
	}

	public void setId(Object id) {
		this.id = id;
	}

	public Object getMid() {
		return mid;
	}

	public void setMid(Object mid) {
		this.mid = mid;
	}

	public Object getMolds() {
		return molds;
	}

	public void setMolds(Object molds) {
		this.molds = molds;
	}

	public Object getPid() {
		return pid;
	}

	public void setPid(Object pid) {
		this.pid = pid;
	}

	public Object getName() {
		return name;
	}

	public void setName(Object name) {
		this.name = name;
	}

	public Object getLitpic() {
		return litpic;
	}

	public void setLitpic(Object litpic) {
		this.litpic = litpic;
	}

	public Object getKeywords() {
		return keywords;
	}

	public void setKeywords(Object keywords) {
		this.keywords = keywords;
	}

	public Object getWurl() {
		return wurl;
	}

	public void setWurl(Object wurl) {
		this.wurl = wurl;
	}

	public Object getListnum() {
		return listnum;
	}

	public void setListnum(Object listnum) {
		this.listnum = listnum;
	}

	public Object getIsshow() {
		return isshow;
	}

	public void setIsshow(Object isshow) {
		this.isshow = isshow;
	}

	public Object getAbout() {
		return about;
	}

	public void setAbout(Object about) {
		this.about = about;
	}

	public Object getDindex() {
		return dindex;
	}

	public void setDindex(Object dindex) {
		this.dindex = dindex;
	}

	public Object getMoldname() {
		return moldname;
	}

	public void setMoldname(Object moldname) {
		this.moldname = moldname;
	}

	public Object getOrder() {
		return order;
	}

	public void setOrder(Object order) {
		this.order = order;
	}
	
	
}
