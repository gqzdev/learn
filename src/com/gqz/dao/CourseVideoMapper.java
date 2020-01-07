package com.gqz.dao;

import com.gqz.model.CourseVideo;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CourseVideoMapper {
	void saveEntity(CourseVideo collegeVideo);
	
	List<CourseVideo> searchEntity(int id);
	
	List<CourseVideo> searchAllEntity();
	
	List<CourseVideo> searchEntityByTerm(@Param("courseId") int courseId,@Param("teacherId") int teacherId);
	
	CourseVideo getEntityById(Integer id);
	
	void deleteEntity(Integer id);
}