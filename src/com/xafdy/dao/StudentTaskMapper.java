package com.xafdy.dao;

import java.util.List;

import com.xafdy.model.StudentTask;

public interface StudentTaskMapper {
	void saveEntity(StudentTask studentTask);
	
	List<StudentTask> searchEntity();
	
	List<StudentTask> searchEntityByStuId(Integer stuId);
}