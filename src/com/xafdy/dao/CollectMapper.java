package com.xafdy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xafdy.model.Collect;
import com.xafdy.model.Student;

public interface CollectMapper {
	void saveEntity(HashMap<String, Object> map);
	
	List<Collect> searchEntityBySId(Integer SId);	
	
	void deleteEntity(HashMap<String, Object> map);
}