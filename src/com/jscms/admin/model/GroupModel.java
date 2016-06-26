package com.jscms.admin.model;

import com.jscms.frame.JSModel;

public class GroupModel extends JSModel {
	public void Init(){
		this.primaryKey="gid";
		this.tableName="admin_group";
	}
}
