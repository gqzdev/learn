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
import com.gqz.learn.model.Task;
import com.gqz.learn.model.Teacher;
import com.gqz.learn.service.CourseService;
import com.gqz.learn.service.TaskService;

/**
 * 
 * @ClassName:
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author ganquanzhong
 * @date 2019年2月23日 下午11:01:23
 */
@Controller
public class TaskController {

	@Autowired
	private CourseService courseService;

	@Autowired
	private TaskService taskService;

	@RequestMapping("/createTask")
	public ModelAndView createTask() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", courseService.searchCourse());
		mav.setViewName("createTask");
		return mav;
	}

	@RequestMapping("/saveTask")
	public ModelAndView saveTask(Task task, HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		task.setRecordTime(new Date());
		task.setTeacherId(teacher.getId());
		taskService.saveTask(task);
		return new ModelAndView("redirect:/createTask.html");
	}

	@RequestMapping("/searchTask")
	public ModelAndView searchTask() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("tasks", taskService.searchTask());
		mav.setViewName("searchTask");
		return mav;
	}

	@RequestMapping("/searchTaskInfo")
	public ModelAndView searchTaskInfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("tasks", taskService.searchTask());
		mav.setViewName("searchTaskInfo");
		return mav;
	}

	@RequestMapping("/deleteTask/{id}")
	public ModelAndView deleteTask(@PathVariable("id") Integer id) {
		taskService.deleteTask(id);
		return new ModelAndView("redirect:/searchTask.html");
	}

	@RequestMapping("/updateTask/{id}")
	public ModelAndView updateTask(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("task", taskService.getTaskById(id));
		mav.addObject("courses", courseService.searchCourse());
		mav.setViewName("updateTask");
		return mav;
	}

	@RequestMapping("/editTask/{id}")
	public ModelAndView editTask(@PathVariable("id") Integer id, Task task,HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		task.setId(id);
		task.setRecordTime(new Date());
		task.setTeacherId(teacher.getId());
		taskService.updateTask(task);
		return new ModelAndView("redirect:/searchTask.html");
	}
	
	@RequestMapping("/taskListByPage")
	@ResponseBody()
	public PageInfo<Task> taskListByPage(int page, int pageSize,HttpSession session) {
		int role = (int)session.getAttribute("role");
		if (role==1) {
			Teacher user =(Teacher)  session.getAttribute("user");
			return taskService.searchTaskbyTeacherIdByPage(user.getId(), page, pageSize);
		}else{
			//学生和管理员 查询所有的
			return taskService.searchTaskByPage(page,pageSize);
		}
	}
}
