package com.gqz.dao;

import com.gqz.model.Discuss;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface DiscussMapper {

	void saveEntity(Discuss discuss);
	
	List<Discuss> searchEntity();
	
	List<Discuss> searchEntityByTerm(@Param("courseId") Integer courseId,@Param("teacherId") Integer teacherId);
	
	void deleteEntity(Integer id);
	
	void updateEntity(Discuss discuss);
	
	Discuss getEntityById(Integer id);
}