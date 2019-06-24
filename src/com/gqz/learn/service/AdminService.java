package com.gqz.learn.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gqz.learn.dao.AdminMapper;
import com.gqz.learn.model.Admin;

@Service
public class AdminService {
	@Resource
	private AdminMapper adminMapper;
	
	public Admin adminLogon(Map<String, String> map) {
		return adminMapper.searchEntityByAccount(map);
	}
	
}
