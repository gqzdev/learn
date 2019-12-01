package com.xafdy.dao;

import com.xafdy.model.Teacher;
import java.util.List;
import java.util.Map;

public interface TeacherMapper {
	void saveEntity(Teacher teacher);
	
	List<Teacher> searchEntity();
	
	void deleteEntity(Integer id);
	
	void updateEntity(Teacher teacher);
	
	Teacher getEntityById(Integer id);
	
	Teacher searchEntityByAccount(Map<String, String> map);
}