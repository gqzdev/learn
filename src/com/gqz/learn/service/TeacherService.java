package com.gqz.learn.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.learn.dao.TeacherMapper;
import com.gqz.learn.model.Teacher;

@Service
public class TeacherService {
	@Resource
	private TeacherMapper teacherMapper;

	public Teacher teacherLogon(Map<String, String> map) {
		return teacherMapper.searchEntityByAccount(map);
	}

	public void saveTeacher(Teacher teacher) {
		teacherMapper.saveEntity(teacher);
	}

	public List<Teacher> searchTeacher() {
		return teacherMapper.searchEntity();
	}

	public void deleteTeacher(Integer id) {
		teacherMapper.deleteEntity(id);
	}

	public void updateTeacher(Teacher teacher) {
		teacherMapper.updateEntity(teacher);
	}

	public Teacher getTeacherById(Integer id) {
		return teacherMapper.getEntityById(id);
	}

	public PageInfo<Teacher> searchTeacherByPage(int page, int pageSize) {
		// 获取第1页，10条内容，默认查询总数count 物理分页
		PageHelper.startPage(page, pageSize);
		List<Teacher> list = teacherMapper.searchEntity();
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<Teacher> pageInfo = new PageInfo<Teacher>(list);
		return pageInfo;
	}

	public PageInfo<Teacher> searchTeacherByTerm(int page, int pageSize,String content, int collegeId) {
		// TODO Auto-generated method stub
		// 获取第1页，10条内容，默认查询总数count 物理分页
		PageHelper.startPage(page, pageSize);
		List<Teacher> list;
		if (collegeId == 0) {
			// 模糊姓名查询
			list = teacherMapper.searchTeacherByName(content);
		} else if (content == null || content == " ") {
			// 模糊学院查询
			list = teacherMapper.searchTeacherByCollegeId(collegeId);
		} else {
			// 模糊查询
			list = teacherMapper.searchTeacherByTerm(collegeId, content);
		}
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<Teacher> pageInfo = new PageInfo<Teacher>(list);
		return pageInfo;
	}
}
