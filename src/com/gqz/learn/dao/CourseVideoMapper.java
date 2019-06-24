package com.gqz.learn.dao;

import com.gqz.learn.model.CourseVideo;
import com.gqz.learn.model.CourseVideoExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CourseVideoMapper {
    int countByExample(CourseVideoExample example);

    int deleteByExample(CourseVideoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CourseVideo record);

    int insertSelective(CourseVideo record);

    List<CourseVideo> selectByExample(CourseVideoExample example);

    CourseVideo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CourseVideo record, @Param("example") CourseVideoExample example);

    int updateByExample(@Param("record") CourseVideo record, @Param("example") CourseVideoExample example);

    int updateByPrimaryKeySelective(CourseVideo record);

    int updateByPrimaryKey(CourseVideo record);
    
    ///////////
    void saveEntity(CourseVideo collegeVideo);
	
    //查询指定的teacherId
	List<CourseVideo> searchEntityByTeacherId(int id);
	
	List<CourseVideo> searchAllEntity();
	
	CourseVideo getEntityById(Integer id);
	
	void deleteEntity(Integer id);
	//模糊名称查询
	List<CourseVideo> searchCourseVideoByName(String content);
	//模糊课程查询
	List<CourseVideo> searchCourseVideoByCourseId(int courseId);
	//模糊名称、课程查询
	List<CourseVideo> searchCourseVideoByTerm(@Param("courseId") int courseId,@Param("content") String content);

}