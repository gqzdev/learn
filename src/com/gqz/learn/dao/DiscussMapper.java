package com.gqz.learn.dao;

import com.gqz.learn.model.Discuss;
import com.gqz.learn.model.DiscussExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface DiscussMapper {
    int countByExample(DiscussExample example);

    int deleteByExample(DiscussExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Discuss record);

    int insertSelective(Discuss record);

    List<Discuss> selectByExampleWithBLOBs(DiscussExample example);

    List<Discuss> selectByExample(DiscussExample example);

    Discuss selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Discuss record, @Param("example") DiscussExample example);

    int updateByExampleWithBLOBs(@Param("record") Discuss record, @Param("example") DiscussExample example);

    int updateByExample(@Param("record") Discuss record, @Param("example") DiscussExample example);

    int updateByPrimaryKeySelective(Discuss record);

    int updateByPrimaryKeyWithBLOBs(Discuss record);

    int updateByPrimaryKey(Discuss record);
    
    //////////////////////	
    void saveEntity(Discuss discuss);
	
	List<Discuss> searchEntity();
	
	void deleteEntity(Integer id);
	
	void updateEntity(Discuss discuss);
	
	Discuss getEntityById(Integer id);
    
	List<Discuss> searchDiscussByTeacherId(Integer id);
}