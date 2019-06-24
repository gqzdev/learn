package com.gqz.learn.dao;

import com.gqz.learn.model.DiscussPost;
import com.gqz.learn.model.DiscussPostExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface DiscussPostMapper {
    int countByExample(DiscussPostExample example);

    int deleteByExample(DiscussPostExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(DiscussPost record);

    int insertSelective(DiscussPost record);

    List<DiscussPost> selectByExampleWithBLOBs(DiscussPostExample example);

    List<DiscussPost> selectByExample(DiscussPostExample example);

    DiscussPost selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") DiscussPost record, @Param("example") DiscussPostExample example);

    int updateByExampleWithBLOBs(@Param("record") DiscussPost record, @Param("example") DiscussPostExample example);

    int updateByExample(@Param("record") DiscussPost record, @Param("example") DiscussPostExample example);

    int updateByPrimaryKeySelective(DiscussPost record);

    int updateByPrimaryKeyWithBLOBs(DiscussPost record);

    int updateByPrimaryKey(DiscussPost record);
    
    ////////////////////
    void saveEntity(DiscussPost discussPost);
	
	List<DiscussPost> searchDiscussPost(Integer id);
}