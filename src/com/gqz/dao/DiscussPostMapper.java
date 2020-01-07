package com.gqz.dao;

import java.util.List;

import com.gqz.model.DiscussPost;

public interface DiscussPostMapper {
	void saveEntity(DiscussPost discussPost);
	List<DiscussPost> searchEntity(Integer id);
}