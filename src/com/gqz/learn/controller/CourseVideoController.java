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
import com.gqz.learn.model.CourseVideo;
import com.gqz.learn.model.Teacher;
import com.gqz.learn.service.CourseService;
import com.gqz.learn.service.CourseVideoService;

/**
 * 
 * @ClassName:
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author ganquanzhong
 * @date 2019年2月23日 下午11:01:23
 */
@Controller
public class CourseVideoController {
	@Autowired
	private CourseService courseService;

	@Autowired
	private CourseVideoService courseVideoService;

	@RequestMapping("/createCollegeVideo")
	public ModelAndView createCollegeVideo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", courseService.searchCourse());
		mav.setViewName("createCourseVideo");
		return mav;
	}

	// 上传课程视频 "E://upload/learn/"
	@RequestMapping("/addCourseVideo")
	public ModelAndView addCourseVideo(
			@RequestParam("file") MultipartFile multipartFile,
			HttpSession session, HttpServletRequest request)
			throws IllegalStateException, IOException {
		Teacher teacher = (Teacher) session.getAttribute("user");// 获取session中的用户信息
		Integer id = Integer.parseInt(request.getParameter("courseId"));
		String fileName = multipartFile.getOriginalFilename();// 获取文件名
		// 设置视频上传的路径
		String fileDir = "E://upload/learn/" + fileName;
		// 将内存中的数据写入磁盘
		multipartFile.transferTo(new File(fileDir));
		CourseVideo courseVideo = new CourseVideo();
		courseVideo.setTeacherId(teacher.getId());
		courseVideo.setCourseId(id);
		courseVideo.setPath(fileName);
		courseVideo.setRecordTime(new Date());
		courseVideoService.addCourseVideo(courseVideo);
		return new ModelAndView("redirect:/searchCollegeVideo.html");
	}

	// 删除课程视频
	@RequestMapping("/deleteCollegeVideo/{id}")
	public ModelAndView deleteCollegeVideo(@PathVariable("id") Integer id) {
		courseVideoService.deleteCourseVideo(id);

		return new ModelAndView("redirect:/searchCollegeVideo.html");
	}

	// 查询当前用户[教师]上传的视频
	@RequestMapping("/searchCollegeVideo")
	public ModelAndView searchCollegeVideo(HttpSession session) {
		int role = (int) session.getAttribute("role");
		ModelAndView mav = new ModelAndView();
		if (role == 1) {
			Teacher teacher = (Teacher) session.getAttribute("user");
			mav.addObject("videos",
					courseVideoService.searchCourseVideo(teacher.getId()));
			mav.setViewName("searchCollegeVideo");
		}
		return mav;
	}

	@RequestMapping("/searchCollegeVideoInfo")
	public ModelAndView searchCollegeVideoInfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("videos", courseVideoService.searchAllCourseVideo());
		mav.setViewName("searchCollegeVideoInfo");
		return mav;
	}

	// 查询视频的path
	@RequestMapping("/watchVideo/{id}")
	public ModelAndView watchVideo(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("video", courseVideoService.getCourseVideoById(id));
		mav.setViewName("watchVideo");
		return mav;
	}

	@RequestMapping("/adminSearchCourseVideo")
	public ModelAndView searchCourseVideo(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("searchCollegeVideo");
		return mav;
	}

	@RequestMapping("/courseVideoListByPage")
	@ResponseBody()
	public PageInfo<CourseVideo> courseVideoListByPage(int page, int pageSize,
			HttpSession session) {
		int role = (int) session.getAttribute("role");
		if (role == 1) {
			Teacher user = (Teacher) session.getAttribute("user");
			return courseVideoService.searchCourseVideobyTeacherIdByPage(
					user.getId(), page, pageSize);
		} else {
			// 学生和管理员 查询所有的
			return courseVideoService.searchCourseVideoByPage(page, pageSize);
		}
	}

	// 有条件查询
	@RequestMapping("/courseVideoListByTerm")
	@ResponseBody()
	public PageInfo<CourseVideo> courseVideoListByTerm(int page, int pageSize,String content, int courseId) {
		return courseVideoService.searchCourseFileByTerm(page, pageSize,	content, courseId);
	}
}
