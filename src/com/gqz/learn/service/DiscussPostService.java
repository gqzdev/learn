package com.gqz.learn.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gqz.learn.dao.DiscussPostMapper;
import com.gqz.learn.model.DiscussPost;

@Service
public class DiscussPostService {
	@Resource
	private DiscussPostMapper discussPostMapper;
	
	public void saveDiscussPost(DiscussPost discussPost) {
		discussPostMapper.saveEntity(discussPost);
	}
	
	public List<DiscussPost> searchDiscussPost(Integer id) {
		return discussPostMapper.searchDiscussPost(id);
	}

	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return discussPostMapper.deleteByPrimaryKey(id);
	}
}
