package com.jscms.frame;

public class JSConnectionPoolFactor {
	private static JSConnectionPool pool=null;
	private JSConnectionPoolFactor(){}
	public static JSConnectionPool getConnectionPool(){
		if(pool==null){
			pool = new JSBoneCpConnectionPool();
		}
		return pool;
	}
}
