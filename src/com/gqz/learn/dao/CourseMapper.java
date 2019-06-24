package com.gqz.learn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gqz.learn.model.Course;
import com.gqz.learn.model.CourseExample;

public interface CourseMapper {
	int countByExample(CourseExample example);

	int deleteByExample(CourseExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(Course record);

	int insertSelective(Course record);

	List<Course> selectByExampleWithBLOBs(CourseExample example);

	List<Course> selectByExample(CourseExample example);

	Course selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") Course record,
			@Param("example") CourseExample example);

	int updateByExampleWithBLOBs(@Param("record") Course record,
			@Param("example") CourseExample example);

	int updateByExample(@Param("record") Course record,
			@Param("example") CourseExample example);

	int updateByPrimaryKeySelective(Course record);

	int updateByPrimaryKeyWithBLOBs(Course record);

	int updateByPrimaryKey(Course record);

	// /////////
	void saveEntity(Course course);

	List<Course> searchEntity();

	void deleteEntity(Integer id);

	void updateEntity(Course course);

	Course getEntityById(Integer id);

	// by name
	List<Course> searchCourseByName(String name);
	
	// 通过collegeId查询
	List<Course> searchCourseByCollegeId(Integer id);

	// 模糊查询
	List<Course> searchCourseByTerm(@Param("collegeId") int collegeId,@Param("name") String name);
}