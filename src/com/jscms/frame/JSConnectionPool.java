package com.jscms.frame;

import java.sql.Connection;

public interface JSConnectionPool {
	public Connection getConnection();
	public void shutdown();
}
