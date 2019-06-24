package com.gqz.learn.dao;

import com.gqz.learn.model.Task;
import com.gqz.learn.model.TaskExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TaskMapper {
    int countByExample(TaskExample example);

    int deleteByExample(TaskExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Task record);

    int insertSelective(Task record);

    List<Task> selectByExample(TaskExample example);

    Task selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Task record, @Param("example") TaskExample example);

    int updateByExample(@Param("record") Task record, @Param("example") TaskExample example);

    int updateByPrimaryKeySelective(Task record);

    int updateByPrimaryKey(Task record);
    
    ///////自定义接口
    void saveEntity(Task task);
	
	List<Task> searchEntity();
	
	//通过teacherId查询
	List<Task> getTaskByteacherId(Integer id);
	
	void deleteEntity(Integer id);
	
	void updateEntity(Task task);
	
	Task getEntityById(Integer id);
}