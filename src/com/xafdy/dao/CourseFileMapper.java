package com.xafdy.dao;

import com.xafdy.model.CourseFile;
import java.util.List;

public interface CourseFileMapper {
	void saveEntity(CourseFile collegeFile);
	
	List<CourseFile> searchEntity(int id);
	
	CourseFile searchEntityById(int id);
	
	List<CourseFile> searchAllEntity();
	
	void deleteEntity(Integer id);
}