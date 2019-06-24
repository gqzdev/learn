package com.gqz.learn.dao;

import com.gqz.learn.model.Student;
import com.gqz.learn.model.StudentExample;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface StudentMapper {
    int countByExample(StudentExample example);

    int deleteByExample(StudentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectByExample(StudentExample example);

    Student selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
    
    
    ///////////
    //自定义接口  MyBatis动态代理
    void saveEntity(Student student);
	
	List<Student> searchEntity();
	
	//通过collegeId查询
	List<Student> searchStudentByCollegeId(Integer id);
	
	//by name
	List<Student> searchStudentByName(String name);
	
	//模糊查询
	List<Student> searchStudentByTerm(@Param("collegeId") int collegeId,@Param("name") String name);
	
	void deleteEntity(Integer id);
	
	void updateEntity(Student student);
	
	Student getEntityById(Integer id);
	
	Student searchEntityByAccount(Map<String, String> map);
    
}