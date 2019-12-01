package com.xafdy.dao;

import java.util.Map;

import com.xafdy.model.Admin;
import com.xafdy.model.Student;

public interface AdminMapper {
	Admin searchEntityByAccount(Map<String, String> map);
	
	Admin getEntityById(Integer id);
	
	void updateEntity(Admin admin);
}