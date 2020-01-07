package com.gqz.dao;

import java.util.HashMap;
import java.util.List;

import com.gqz.model.Collect;

public interface CollectMapper {
	void saveEntity(HashMap<String, Object> map);
	
	List<Collect> searchEntityBySId(Integer SId);	
	
	void deleteEntity(HashMap<String, Object> map);
}