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
	            //�������ӳ�������Ϣ 
	            BoneCPConfig config = new BoneCPConfig();  
	            //���ݿ��JDBC URL  
	            
	            config.setJdbcUrl("jdbc:mysql://disguise.top:3306/jscms");   
	            //���ݿ��û���  
	            config.setUsername("mysql");   
	            //���ݿ��û�����  
	            config.setPassword("123456");  
	            //���ݿ����ӳص���С������  
	            config.setMinConnectionsPerPartition(10);  
	            //���ݿ����ӳص����������  
	            config.setMaxConnectionsPerPartition(20);  
	            //  
	            config.setPartitionCount(1);
	            
	            //�������ݿ����ӳ�  
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
	//�ر����ӳ�
	public void shutdown(){
		this.connectionPool.shutdown();
	}
	
}

