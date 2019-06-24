package com.gqz.learn.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.learn.dao.StudentMapper;
import com.gqz.learn.model.Student;
import com.gqz.learn.model.StudentExample;

@Service
public class StudentService {
	@Resource
	private StudentMapper studentMapper;

	public Student studentLogon(Map<String, String> map) {
		return studentMapper.searchEntityByAccount(map);
	}

	public void saveStudent(Student student) {
		studentMapper.saveEntity(student);
	}

	// ///使用MyBatis逆向工程
	public void addStudent(Student student) {
		studentMapper.insertSelective(student);
	}

	public List<Student> searchStudent() {
		return studentMapper.searchEntity();
	}

	public void deleteStudent(Integer id) {
		studentMapper.deleteEntity(id);
	}

	public void updateStudent(Student student) {
		studentMapper.updateEntity(student);
	}

	public Student getStudentById(Integer id) {
		return studentMapper.getEntityById(id);
	}

	// 查询所有的student
	public List<Student> getStudentList() {
		StudentExample studentExample = new StudentExample();
		List<Student> list = studentMapper.selectByExample(studentExample);
		return list;
	}

	public PageInfo<Student> getStudentListByPage(int page, int pageSize) {
		// 获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(page, pageSize);
		StudentExample studentExample = new StudentExample();
		List<Student> list = studentMapper.selectByExample(studentExample);
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<Student> pageInfo = new PageInfo<Student>(list);
		return pageInfo;
	}

	public PageInfo<Student> searchStudentByPage(int page, int pageSize) {
		// 获取第1页，10条内容，默认查询总数count 物理分页
		PageHelper.startPage(page, pageSize);
		List<Student> list = studentMapper.searchEntity();
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<Student> pageInfo = new PageInfo<Student>(list);
		return pageInfo;
	}

	// 条件查询
	public PageInfo<Student> searchStudentByTerm(int page, int pageSize,String content, int collegeId) {
		PageHelper.startPage(page, pageSize);
		List<Student> list ;
		if (collegeId==0) {
			//模糊姓名查询
			list = studentMapper.searchStudentByName(content);
		}else if (content==null||content==" ") {
			//模糊学院查询
			list = studentMapper.searchStudentByCollegeId(collegeId);
		}else {
			//模糊查询
			list = studentMapper.searchStudentByTerm(collegeId, content);
		}
		PageInfo<Student> pageInfo = new PageInfo<Student>(list);
		return pageInfo;
	}

}
