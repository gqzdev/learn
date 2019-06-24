package com.gqz.learn.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.gqz.learn.model.Discuss;
import com.gqz.learn.model.Teacher;
import com.gqz.learn.service.CourseService;
import com.gqz.learn.service.DiscussService;

/**
 * 
 * @ClassName:
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author ganquanzhong
 * @date 2019年2月23日 下午11:01:23
 */
@Controller
public class DiscussController {
	@Autowired
	private CourseService courseService;

	@Autowired
	private DiscussService discussService;

	@RequestMapping("/createDiscuss")
	public ModelAndView createDiscuss() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", courseService.searchCourse());
		mav.setViewName("createDiscuss");
		return mav;
	}

	@RequestMapping("/saveDiscuss")
	public ModelAndView saveDiscuss(Discuss discuss, HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		discuss.setRecordTime(new Date());
		discuss.setTeacherId(teacher.getId());
		discussService.saveDiscuss(discuss);

		return new ModelAndView("redirect:/searchDiscuss.html");
	}

	@RequestMapping("/searchDiscuss")
	public ModelAndView searchDiscuss() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("discusses", discussService.searchDiscuss());
		mav.setViewName("searchDiscuss");
		return mav;
	}

	@RequestMapping("/searchDiscussInfo")
	public ModelAndView searchDiscussInfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("discusses", discussService.searchDiscuss());
		mav.setViewName("searchDiscussInfo");
		return mav;
	}

	@RequestMapping("/deleteDiscuss/{id}")
	public ModelAndView deleteDiscuss(@PathVariable("id") Integer id) {
		discussService.deleteDiscuss(id);
		return new ModelAndView("redirect:/searchDiscuss.html");
	}

	@RequestMapping("/updateDiscuss/{id}")
	public ModelAndView updateDiscuss(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", courseService.searchCourse());
		mav.addObject("discuss", discussService.getDiscussById(id));
		mav.setViewName("updateDiscuss");
		return mav;
	}

	@RequestMapping("/editDiscuss/{id}")
	public ModelAndView editDiscuss(@PathVariable("id") Integer id,
			HttpSession session, Discuss discuss) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		discuss.setId(id);
		discuss.setRecordTime(new Date());
		discuss.setTeacherId(teacher.getId());
		discussService.updateDiscuss(discuss);
		return new ModelAndView("redirect:/searchDiscuss.html");
	}
	
	@RequestMapping("/discussListByPage")
	@ResponseBody()
	public PageInfo<Discuss> discussListByPage(int page, int pageSize,HttpSession session) {
		int role = (int)session.getAttribute("role");
		if (role==1) {
			Teacher user =(Teacher) session.getAttribute("user");
			return discussService.searchDiscussbyTeacherIdByPage(user.getId(), page, pageSize);
		}else{
			//学生和管理员 查询所有的
			return discussService.searchDiscussByPage(page,pageSize);
		}
	}
}
