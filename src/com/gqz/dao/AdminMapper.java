package com.gqz.dao;

import java.util.Map;

import com.gqz.model.Admin;

public interface AdminMapper {
	Admin searchEntityByAccount(Map<String, String> map);
	
	Admin getEntityById(Integer id);
	
	void updateEntity(Admin admin);
}