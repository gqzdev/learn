package com.gqz.learn.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.learn.dao.CourseFileMapper;
import com.gqz.learn.model.CourseFile;

/**
 * 
 * @ClassName: CourseFileService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author ganquanzhong
 * @date 2019年2月23日 下午9:05:07
 */

@Service
public class CourseFileService {

	@Resource
	private CourseFileMapper courseFileMapper;

	// 查询所有的课程文档
	public List<CourseFile> searchAllCourseFile() {
		return courseFileMapper.searchAllEntity();
	}

	// 查询为id的课程文档
	public CourseFile getCourseFileById(Integer id) {
		return courseFileMapper.searchEntityById(id);
	}

	// 添加的课程文档
	public void saveCourseFile(CourseFile collegeFile) {
		courseFileMapper.saveEntity(collegeFile);
	}

	public List<CourseFile> searchCourseFile(int id) {
		return courseFileMapper.searchCourseFileByTeacherId(id);
	}

	// 删除课程文档
	public void deleteCourseFile(Integer id) {
		courseFileMapper.deleteEntity(id);
	}

	public PageInfo<CourseFile> searchCourseFileByPage(int page, int pageSize) {
		// 获取第1页，10条内容，默认查询总数count 物理分页
		PageHelper.startPage(page, pageSize);
		List<CourseFile> list = courseFileMapper.searchAllEntity();
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<CourseFile> pageInfo = new PageInfo<CourseFile>(list);
		return pageInfo;
	}

	public PageInfo<CourseFile> searchCourseFilebyTeacherIdByPage(Integer id,int page, int pageSize) {
		// 获取第1页，10条内容，默认查询总数count 物理分页
		PageHelper.startPage(page, pageSize);
		List<CourseFile> list = courseFileMapper.searchCourseFileByTeacherId(id);
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<CourseFile> pageInfo = new PageInfo<CourseFile>(list);
		return pageInfo;
	}

	public PageInfo<CourseFile> searchCourseFileByTerm(int page, int pageSize,String content, int courseId) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, pageSize);
		List<CourseFile> list ;
		if (courseId==0) {
			//模糊姓名查询
			list = courseFileMapper.searchCourseFileByName(content);
		}else if (content==null||content==" ") {
			//模糊课程查询
			list = courseFileMapper.searchCourseFileByCourseId(courseId);
		}else {
			//模糊查询
			list = courseFileMapper.searchCourseFileByTerm(courseId, content);
		}
		PageInfo<CourseFile> pageInfo = new PageInfo<CourseFile>(list);
		return pageInfo;
	}
}
