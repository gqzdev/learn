package com.gqz.learn.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gqz.learn.model.Admin;
import com.gqz.learn.model.Student;
import com.gqz.learn.model.Teacher;
import com.gqz.learn.service.AdminService;
import com.gqz.learn.service.StudentService;
import com.gqz.learn.service.TeacherService;

/**
 * 
 * @ClassName:
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author ganquanzhong
 * @date 2019年2月23日 下午11:01:23
 */
@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private TeacherService teacherService;

	// 用户登录
	@RequestMapping("/login")
	public ModelAndView login(String account, String password,Integer role,	String verifyCode, HttpSession session) {
		Map<String, String> map = new HashMap<>();
		map.put("account", account);
		map.put("password", password);
		String vCode = (String) session.getAttribute("vCode");
		ModelAndView mav = new ModelAndView();	
		if (verifyCode.equalsIgnoreCase(vCode)) {  // 验证码正确时   分角色登录 role
			if (role == 0) {
				// 管理员登录
				Admin admin = adminService.adminLogon(map);
				if (admin == null) {
					mav.addObject("info", "[管理员登录]用户名或密码错误！！！");
					mav.setViewName("login");
					return mav;
				} else {
					session.setAttribute("user", admin);
					session.setAttribute("role", 0);
					return new ModelAndView("redirect:/index.html");
				}
			} else if (role == 1) {
				// 教师登录
				Teacher teacher = teacherService.teacherLogon(map);
				if (teacher == null) {
					mav.addObject("info", "[教师登录]用户名或密码错误！！！");
					mav.setViewName("login");
					return mav;
				} else {
					session.setAttribute("user", teacher);
					session.setAttribute("role", 1);
					return new ModelAndView("redirect:/teacherIndex.html");
				}
			} else {
				// 学生登录
				Student student = studentService.studentLogon(map);
				if (student == null) {
					mav.addObject("info", "[学生登录]用户名或密码错误！！！");
					mav.setViewName("login");
					return mav;
				} else {
					session.setAttribute("user", student);
					session.setAttribute("role", 2);
					return new ModelAndView("redirect:/studentIndex.html");
				}
			}
		}else{
			//验证码错误
			mav.addObject("info", "！！！验证码错误！！！");
			mav.setViewName("login");
			return mav;
		}
	}

	// 管理员主页
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	// 退出系统
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.setAttribute("user", null);
		return new ModelAndView("redirect:/preLogin.html");
	}
	
	//login
	@RequestMapping("/preLogin")
	public ModelAndView preLogin() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", "请登录");
		mav.setViewName("login"); 
		return mav;
	}

}
