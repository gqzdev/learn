package com.gqz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gqz.model.Student;

public interface StudentMapper {
	void saveEntity(Student student);
	
	List<Student> searchEntity();
	
	List<Student> searchEntityByTerm(HashMap<String, Object> map);
	
	void deleteEntity(Integer id);
	
	void updateEntity(Student student);
	
	Student getEntityById(Integer id);
	
	Student searchEntityByAccount(Map<String, String> map);
}