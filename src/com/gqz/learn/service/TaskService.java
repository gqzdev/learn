package com.gqz.learn.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.learn.dao.TaskMapper;
import com.gqz.learn.model.Task;

@Service
public class TaskService {
	@Resource
	private TaskMapper taskMapper;
	
	public void saveTask(Task task) {
		taskMapper.saveEntity(task);
	}
	
	public List<Task> searchTask() {
		return taskMapper.searchEntity();
	}
	
	public void deleteTask(Integer id) {
		taskMapper.deleteEntity(id);
	}
	
	public void updateTask(Task task) {
		taskMapper.updateEntity(task);
	}
	
	public Task getTaskById(Integer id) {
		return taskMapper.getEntityById(id);
	}

	public PageInfo<Task> searchTaskByPage(int page, int pageSize) {
		// TODO Auto-generated method stub
		// 获取第1页，10条内容，默认查询总数count 物理分页
		PageHelper.startPage(page, pageSize);
		List<Task> list = taskMapper.searchEntity();
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<Task> pageInfo = new PageInfo<Task>(list);
		return pageInfo;
	}

	public PageInfo<Task> searchTaskbyTeacherIdByPage(int tid,int page, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, pageSize);
		List<Task> list = taskMapper.getTaskByteacherId(tid);
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<Task> pageInfo = new PageInfo<Task>(list);
		return pageInfo;
	}
}
