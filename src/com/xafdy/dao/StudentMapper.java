package com.xafdy.dao;

import com.xafdy.model.Student;

import java.util.List;
import java.util.Map;

public interface StudentMapper {
	void saveEntity(Student student);
	
	List<Student> searchEntity();
	
	void deleteEntity(Integer id);
	
	void updateEntity(Student student);
	
	Student getEntityById(Integer id);
	
	Student searchEntityByAccount(Map<String, String> map);
}