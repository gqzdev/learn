package com.xafdy.dao;

import com.xafdy.model.Task;
import java.util.List;

public interface TaskMapper {
	void saveEntity(Task task);
	
	List<Task> searchEntity();
	
	void deleteEntity(Integer id);
	
	void updateEntity(Task task);
	
	Task getEntityById(Integer id);
}