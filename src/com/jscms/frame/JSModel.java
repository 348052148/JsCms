package com.jscms.frame;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Set;

/*一个模型代表整个表*/
public class JSModel {
	private HashMap<String, Object> attribute=new HashMap<String, Object>();
	public String tableName;
	private String prefix;
	private JSSqlCommand sqlCommand;
	public String primaryKey="id";
	
	public JSModel(){
		prefix="js";
		String name=this.getClass().getName();
		tableName=name.substring(0,name.length()-5);
		sqlCommand = new JSSqlCommand();
		Init();
	}
	public JSModel(String table){
		tableName=table;
		prefix="js";
		sqlCommand = new JSSqlCommand();
	}
	public JSModel(String table,String prefix){
		tableName=table;
		this.prefix=prefix;
	}
	public void Init(){
		
	}
	/*返回一个查询到的数据集*/
	public HashMap<String,Object> findById(int id){
		return sqlCommand.queryForMap("select * from "+prefix+"_"+tableName+" where "+primaryKey+"="+id);
	}
	
	/*获取表名称*/
	public String getTableName(){
		return tableName;
	}
	
	/*保存数据*/
	public int save(HashMap<String, Object> data){
		//构建查询字符串
		String sql = JSUtils.buildInsertSql(prefix, tableName, data);
        
		return sqlCommand.updateSQL(sql);
	}
	/*更新数据*/
	public int update(HashMap<String, Object> data,String whereSql){
		String sql = JSUtils.buildUpdateSql(prefix, tableName, data, whereSql);
		return sqlCommand.updateSQL(sql);
//		return 0;
	}
	/*删除数据*/
	public void deleteById(int id){
		sqlCommand.execute("delete from "+prefix+"_"+tableName+" where "+primaryKey+"="+id);
	}
	/*判断是否存在*/
	public boolean exists(HashMap<String, Object> where){
		ArrayList<Object> s=sqlCommand.queryForList(JSUtils.buildSelectSql(prefix, tableName, null, where));
		return !s.isEmpty();
	}
	public String findID(HashMap<String, Object> where){
		HashMap<String, Object> s = sqlCommand.queryForMap(JSUtils.buildSelectSql(prefix, tableName, null, where));
		return s.get(primaryKey).toString();
	}
	public boolean exists(String wheresql){
		ArrayList<Object> s=sqlCommand.queryForList(JSUtils.buildSelectSql(prefix, tableName, null, wheresql));
		return !s.isEmpty();
	}
}
