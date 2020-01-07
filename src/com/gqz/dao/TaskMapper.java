package com.gqz.dao;

import com.gqz.model.Task;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TaskMapper {
	void saveEntity(Task task);
	
	List<Task> searchEntity();
	
	List<Task> searchEntityByTerm(@Param("courseId") Integer courseId,@Param("teacherId") Integer teacherId);
	
	List<Task> searchEntityByTeacherId(@Param("teacherId") Integer teacherId);
	
	void deleteEntity(Integer id);
	
	void updateEntity(Task task);
	
	Task getEntityById(Integer id);
}