package com.gqz.learn.dao;

import com.gqz.learn.model.Teacher;
import com.gqz.learn.model.TeacherExample;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TeacherMapper {
    int countByExample(TeacherExample example);

    int deleteByExample(TeacherExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    List<Teacher> selectByExample(TeacherExample example);

    Teacher selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Teacher record, @Param("example") TeacherExample example);

    int updateByExample(@Param("record") Teacher record, @Param("example") TeacherExample example);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);
    
    //////////自定义接口
    void saveEntity(Teacher teacher);
	
	List<Teacher> searchEntity();
	
	void deleteEntity(Integer id);
	
	void updateEntity(Teacher teacher);
	
	Teacher getEntityById(Integer id);
	
	Teacher searchEntityByAccount(Map<String, String> map);
	
	// by name
	List<Teacher> searchTeacherByName(String name);
	
	//by collegeId
	List<Teacher> searchTeacherByCollegeId(int id);

	//by name && collegeId
	List<Teacher> searchTeacherByTerm(@Param("collegeId") int collegeId,@Param("name") String name);
	
	
}