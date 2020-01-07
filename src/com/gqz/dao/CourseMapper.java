package com.gqz.dao;

import com.gqz.model.Course;

import java.util.HashMap;
import java.util.List;

public interface CourseMapper {
	void saveEntity(Course course);
	
	List<Course> searchEntity();
	
	List<Course> searchEntityBySId(Integer sId);
	
	List<Course> searchEntityByTerm(HashMap<String, Object> map);
	
	List<Course> searchEntityInfoByTerm(HashMap<String, Object> map);
	
	void deleteEntity(Integer id);
	
	void updateEntity(Course course);
	
	Course getEntityById(Integer id);
}