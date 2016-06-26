package com.jscms.frame;

import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.jscms.orm.Section;

import javassist.bytecode.Descriptor.Iterator;

public class JSSqlCommand {
	private JSDbConnection connection;
	public JSSqlCommand(){
		connection = new JSDbConnection();
	}
	/*单行查询结果集 以list*/
	public ArrayList<Object> queryForList(String sql,String[] args){
		ResultSet result = connection.query(sql);
		ArrayList<Object> resList = new ArrayList<Object>();
		try {
			if(result.next()){
				for(String arg : args){
					resList.add(result.getObject(arg));
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			connection.closeConn();
		}
		return resList;
	}
	/**/
	public ArrayList<Object> queryForList(String sql){
		ResultSet result = connection.query(sql);
		ArrayList<Object> resList = new ArrayList<Object>();
		ArrayList<String> columnList =  new ArrayList<String>();
		//构建表字段
		try{
		ResultSetMetaData metaData = result.getMetaData();
		int colCount = metaData.getColumnCount();
		for(int i=1;i<=colCount;i++){
			columnList.add(metaData.getColumnName(i));
		}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		try {
			if(result.next()){
				for(String arg : columnList){
					resList.add(result.getObject(arg));
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			connection.closeConn();
		}
		return resList;
	}
	/*以hashmap的方式返回一行数据*/
	public HashMap<String, Object> queryForMap(String sql){
		ResultSet result = connection.query(sql);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ArrayList<String> columnList = new ArrayList<String>();
		//构建表字段
		try{
		ResultSetMetaData metaData = result.getMetaData();
		int colCount = metaData.getColumnCount();
		for(int i=1;i<=colCount;i++){
			columnList.add(metaData.getColumnName(i));
		}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		try {
			if(result.next()){
				for(String arg : columnList){
					resultMap.put(arg, result.getObject(arg));
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			connection.closeConn();
		}
		return resultMap;
	}
	/*查询结果放入对象中*/
	public <T> ArrayList<T> queryForObject(String sql,String clasName){
		ResultSet result = connection.query(sql);

		ArrayList<String> columnList = new ArrayList<String>();
		//构建表字段
		try{
		ResultSetMetaData metaData = result.getMetaData();
		int colCount = metaData.getColumnCount();
		for(int i=1;i<=colCount;i++){
			columnList.add(metaData.getColumnName(i));
		}
		}catch (Exception e) {
			// TODO: handle exception
		}
		ArrayList<T> list = new ArrayList<T>();
		try {
			while(result.next()){
				Object OBJ=Class.forName(clasName).newInstance();
				for(String arg : columnList){
					Method me = OBJ.getClass().getMethod("set"+JSUtils.uppercase4Index(arg), Object.class);
					me.invoke(OBJ, result.getObject(arg));
				}
				list.add((T) OBJ);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			connection.closeConn();
		}
		return list;
	}
	/*返回多行查询结果集 以map方式*/
	public ArrayList<Map<String, Object>> queryMultForMap(String sql,String[] args){
		ResultSet result = connection.query(sql);
		ArrayList<Map<String, Object>> resList = new ArrayList<Map<String, Object>>();
		HashMap<String, Object> resMap=null;
		try {
			while(result.next()){
				resMap=new HashMap<String, Object>();
				for(String arg : args){
					resMap.put(new String(arg), result.getObject(arg));
				}
				resList.add(resMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			connection.closeConn();
		}
		return resList;
	}
	/*返回多行查询结果集 以map方式*/
	public ArrayList<Map<String, Object>> queryMultForMap(String sql){
		ResultSet result = connection.query(sql);
		ArrayList<Map<String, Object>> resList = new ArrayList<Map<String, Object>>();
		HashMap<String, Object> resMap=null;
		
		ArrayList<String> columnList = new ArrayList<String>();
		try{
		ResultSetMetaData metaData = result.getMetaData();
		int colCount = metaData.getColumnCount();
		for(int i=1;i<=colCount;i++){
			columnList.add(metaData.getColumnName(i));
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		try {
			while(result.next()){
				resMap=new HashMap<String, Object>();
				for(String arg : columnList){
					resMap.put(new String(arg), result.getObject(arg));
				}
				resList.add(resMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			connection.closeConn();
		}
		return resList;
	}
	/*更新sql操作*/
	public int updateSQL(String sql){
		System.out.println(sql);
		connection.closeConn();
		return connection.update(sql);
	}
	
	/*执行操作*/
	
	public void execute(String sql){
		connection.execute(sql);
		connection.closeConn();
	}
}
