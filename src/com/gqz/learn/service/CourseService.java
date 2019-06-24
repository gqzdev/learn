package com.gqz.learn.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.learn.dao.CourseMapper;
import com.gqz.learn.model.Course;
import com.gqz.learn.model.CourseExample;

@Service
public class CourseService {
	@Resource
	private CourseMapper courseMapper;

	// 添加课程
	public void saveCourse(Course course) {
		courseMapper.saveEntity(course);
	}

	// 查询所有课程
	public List<Course> searchCourse() {
		return courseMapper.searchEntity();
	}
	
	//JSON
	public List<Course> getCourseList() {
		CourseExample courseExample=new CourseExample();
		return courseMapper.selectByExample(courseExample);
	}

	// 删除为id的课程
	public void deleteCourse(Integer id) {
		courseMapper.deleteEntity(id);
	}

	// 更新课程
	public void updateCourse(Course course) {
		courseMapper.updateEntity(course);
	}

	// 查询为id的课程信息
	public Course getCourseById(Integer id) {
		return courseMapper.getEntityById(id);
	}

	public PageInfo<Course> searchCourseByPage(int page, int pageSize) {
		// 获取第1页，10条内容，默认查询总数count 物理分页
		PageHelper.startPage(page, pageSize);
		List<Course> list = courseMapper.searchEntity();
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<Course> pageInfo = new PageInfo<Course>(list);
		return pageInfo;
	}

	public PageInfo<Course> searchCourseByTerm(int page, int pageSize,	String content, int collegeId) {
		PageHelper.startPage(page, pageSize);
		List<Course> list ;
		if (collegeId==0) {
			//模糊姓名查询
			list = courseMapper.searchCourseByName(content);
		}else if (content==null||content==" ") {
			//模糊学院查询
			list = courseMapper.searchCourseByCollegeId(collegeId);
		}else {
			//模糊查询
			list = courseMapper.searchCourseByTerm(collegeId, content);
		}
		PageInfo<Course> pageInfo = new PageInfo<Course>(list);
		return pageInfo;
	}
}
