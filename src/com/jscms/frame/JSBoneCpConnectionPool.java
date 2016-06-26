package com.jscms.frame;

import java.sql.Connection;
import java.sql.SQLException;

import com.jolbox.bonecp.BoneCP;
import com.jolbox.bonecp.BoneCPConfig;

public class JSBoneCpConnectionPool implements JSConnectionPool{
	private static JSBoneCpConnectionPool pool=null;
	private BoneCP connectionPool;

	public JSBoneCpConnectionPool(){
		try {
				Class.forName("com.mysql.jdbc.Driver");
	            //设置连接池配置信息 
	            BoneCPConfig config = new BoneCPConfig();  
	            //数据库的JDBC URL  
	            
	            config.setJdbcUrl("jdbc:mysql://disguise.top:3306/jscms");   
	            //数据库用户名  
	            config.setUsername("mysql");   
	            //数据库用户密码  
	            config.setPassword("123456");  
	            //数据库连接池的最小连接数  
	            config.setMinConnectionsPerPartition(10);  
	            //数据库连接池的最大连接数  
	            config.setMaxConnectionsPerPartition(20);  
	            //  
	            config.setPartitionCount(1);
	            
	            //设置数据库连接池  
	            connectionPool = new BoneCP(config);
			} catch (Exception e) {  
	            e.printStackTrace();  
	        }
	}
	
	public Connection getConnection(){
		Connection conn=null;
		try {
			conn = this.connectionPool.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		return conn;
	}
	//关闭连接池
	public void shutdown(){
		this.connectionPool.shutdown();
	}
	
}

