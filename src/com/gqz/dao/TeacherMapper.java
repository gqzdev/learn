package com.gqz.dao;

import com.gqz.model.Teacher;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface TeacherMapper {
	void saveEntity(Teacher teacher);
	
	List<Teacher> searchEntity();
	
	List<Teacher> searchEntityByTerm(HashMap<String, Object> map);
	
	void deleteEntity(Integer id);
	
	void updateEntity(Teacher teacher);
	
	Teacher getEntityById(Integer id);
	
	Teacher searchEntityByAccount(Map<String, String> map);
}