package com.gqz.dao;

import java.util.List;

import com.gqz.model.StudentTask;

public interface StudentTaskMapper {
	void saveEntity(StudentTask studentTask);
	
	List<StudentTask> searchEntity();
	
	List<StudentTask> searchEntityByStuId(Integer stuId);
}