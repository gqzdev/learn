package com.xafdy.dao;

import com.xafdy.model.Course;
import java.util.List;

public interface CourseMapper {
	void saveEntity(Course course);
	
	List<Course> searchEntity();
	
	void deleteEntity(Integer id);
	
	void updateEntity(Course course);
	
	Course getEntityById(Integer id);
}