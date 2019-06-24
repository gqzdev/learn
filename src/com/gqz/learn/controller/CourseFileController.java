package com.gqz.learn.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.gqz.learn.model.CourseFile;
import com.gqz.learn.model.Teacher;
import com.gqz.learn.service.CourseFileService;
import com.gqz.learn.service.CourseService;

/**
 * 
 * @ClassName:
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author ganquanzhong
 * @date 2019年2月23日 下午11:01:23
 */
@Controller
public class CourseFileController {

	@Autowired
	private CourseFileService courseFileService;

	@Autowired
	private CourseService courseService;

	// 添加课件
	@RequestMapping("/createCollegeFile")
	public ModelAndView createCollegeFile() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", courseService.searchCourse());
		mav.setViewName("createCourseFile");
		return mav;
	}

	// 上传课程文档 "E://upload/learn/"
	@RequestMapping("/addCourseFile")
	public ModelAndView addCourseFile(
			@RequestParam("file") MultipartFile multipartFile,
			HttpSession session, HttpServletRequest request)
			throws IllegalStateException, IOException {
		Teacher teacher = (Teacher) session.getAttribute("user"); // 获取session中的用户信息
		Integer id = Integer.parseInt(request.getParameter("courseId"));
		String fileName = multipartFile.getOriginalFilename();
		String fileDir = "E://upload/learn/" + fileName;// 文件上传路径
		multipartFile.transferTo(new File(fileDir));// 将内存中的数据写入磁盘
		CourseFile courseFile = new CourseFile();
		courseFile.setTeacherId(teacher.getId());
		courseFile.setCourseId(id);
		courseFile.setPath(fileName);
		courseFile.setRecordTime(new Date());
		courseFileService.saveCourseFile(courseFile);
		return new ModelAndView("redirect:/searchCollegeFile.html");
	}

	@RequestMapping("/deleteCollegeFile/{id}")
	public ModelAndView deleteCollegeFile(@PathVariable("id") Integer id) {
		courseFileService.deleteCourseFile(id);

		return new ModelAndView("redirect:/searchCollegeFile.html");
	}

	// 查询课程文档[管理员]
	@RequestMapping("/adminSearchCourseFile")
	public ModelAndView adminSearchCourseFile(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("searchCollegeFile");
		return mav;
	}

	// 查询课程文档[教师]
	@RequestMapping("/searchCollegeFile")
	public ModelAndView searchCollegeFile(HttpSession session) {
		int role = (int) session.getAttribute("role");
		ModelAndView mav = new ModelAndView();
		if (role == 1) {
			Teacher teacher = (Teacher) session.getAttribute("user");
			mav.addObject("files",
					courseFileService.searchCourseFile(teacher.getId()));
		}
		mav.setViewName("searchCollegeFile");
		return mav;
	}

	// 查询课程文档信息[学生]
	@RequestMapping("/searchCollegeFileInfo")
	public ModelAndView searchCollegeFileInfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("files", courseFileService.searchAllCourseFile());
		mav.setViewName("searchCollegeFileInfo");
		return mav;
	}

	// 课程文档下载
	@RequestMapping("/downFile/{id}")
	public ModelAndView downFile(@PathVariable("id") Integer id) {
		CourseFile file = courseFileService.getCourseFileById(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", "location.href='/upload/learn/" + file.getPath()
				+ "'");
		mav.setViewName("downFile");
		return mav;
	}

	@RequestMapping("/courseFileListByPage")
	@ResponseBody()
	public PageInfo<CourseFile> courseFileListByPage(int page, int pageSize,
			HttpSession session) {
		int role = (int) session.getAttribute("role");
		if (role == 1) {
			Teacher user = (Teacher) session.getAttribute("user");
			return courseFileService.searchCourseFilebyTeacherIdByPage(
					user.getId(), page, pageSize);
		} else {
			// 学生和管理员 查询所有的
			return courseFileService.searchCourseFileByPage(page, pageSize);
		}
	}

	// 有条件查询
	@RequestMapping("/courseFileListByTerm")
	@ResponseBody()
	public PageInfo<CourseFile> courseFileListByTerm(int page, int pageSize, String content, int courseId) {
		return courseFileService.searchCourseFileByTerm(page, pageSize, content,courseId);
	}
}
