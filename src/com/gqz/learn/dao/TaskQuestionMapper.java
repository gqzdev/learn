package com.gqz.learn.dao;

import com.gqz.learn.model.TaskQuestion;
import com.gqz.learn.model.TaskQuestionExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TaskQuestionMapper {
    int countByExample(TaskQuestionExample example);

    int deleteByExample(TaskQuestionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TaskQuestion record);

    int insertSelective(TaskQuestion record);

    List<TaskQuestion> selectByExample(TaskQuestionExample example);

    TaskQuestion selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TaskQuestion record, @Param("example") TaskQuestionExample example);

    int updateByExample(@Param("record") TaskQuestion record, @Param("example") TaskQuestionExample example);

    int updateByPrimaryKeySelective(TaskQuestion record);

    int updateByPrimaryKey(TaskQuestion record);
    
    //////自定义接口
    void saveEntity(TaskQuestion taskQuestion);
	
	List<TaskQuestion> searchEntity(Integer taskId);
	
	void deleteEntity(Integer id);
	
	void updateEntity(TaskQuestion taskQuestion);
	
	TaskQuestion getEntityById(Integer id);
}