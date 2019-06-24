package com.gqz.learn.dao;

import com.gqz.learn.model.CourseFile;
import com.gqz.learn.model.CourseFileExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CourseFileMapper {
    int countByExample(CourseFileExample example);

    int deleteByExample(CourseFileExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CourseFile record);

    int insertSelective(CourseFile record);

    List<CourseFile> selectByExample(CourseFileExample example);

    CourseFile selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CourseFile record, @Param("example") CourseFileExample example);

    int updateByExample(@Param("record") CourseFile record, @Param("example") CourseFileExample example);

    int updateByPrimaryKeySelective(CourseFile record);

    int updateByPrimaryKey(CourseFile record);
    
    ////////////////
	void saveEntity(CourseFile collegeFile);
	
	//查询teacherId教师上传的文档
	List<CourseFile> searchCourseFileByTeacherId(int id);
	
	CourseFile searchEntityById(int id);
	
	List<CourseFile> searchAllEntity();
	
	void deleteEntity(Integer id);
    //select by name
	List<CourseFile> searchCourseFileByName(String content);

	//select by courseId
	List<CourseFile> searchCourseFileByCourseId(int courseId);
	
    //select by name && courseId
	List<CourseFile> searchCourseFileByTerm(@Param("courseId") int courseId,@Param("content") String content);
}