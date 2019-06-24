package com.gqz.learn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gqz.learn.model.Student;
import com.gqz.learn.model.TaskQuestion;
import com.gqz.learn.service.StudentTaskService;
import com.gqz.learn.service.TaskQuestionService;

/**
 * 
 * @ClassName:
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author ganquanzhong
 * @date 2019年2月23日 下午11:01:23
 */
@Controller
public class TaskQuestionController {
	
	@Autowired
	private TaskQuestionService taskQuestionService;
	@Autowired
	private StudentTaskService studentTaskService;
	
	@RequestMapping("/createQuestion/{id}")
	public ModelAndView createQuestion(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		// 将作业task的id传递taskQuestion
		mav.addObject("id", id);
		mav.setViewName("createQuestion");
		return mav;
	}

	@RequestMapping("/saveQuestion/{id}")
	public ModelAndView saveQuestion(@PathVariable("id") Integer id,
			TaskQuestion taskQuestion) {
		taskQuestion.setTaskId(id);
		taskQuestionService.saveTaskQuestion(taskQuestion);
		return new ModelAndView("redirect:/createQuestion/" + id + ".html");
	}

	@RequestMapping("/searchQuestion/{id}")
	public ModelAndView searchQuestion(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("questions", taskQuestionService.searchTaskQuestion(id));
		mav.addObject("taskId", id);
		mav.setViewName("searchTaskQuestion");
		return mav;
	}

	// 删除试题
	@RequestMapping("/deleteQuestion/{id}/{taskId}")
	public ModelAndView deleteQuestion(@PathVariable("id") Integer id,	@PathVariable("taskId") Integer taskId) {
		taskQuestionService.deleteTaskQuestion(id);
		return new ModelAndView("redirect:/searchQuestion/" + taskId + ".html");
	}
	
	//进入考试
	@RequestMapping("/enterTask/{id}")
	public ModelAndView enterTask(@PathVariable("id") Integer id,HttpSession session) {
		Student student = (Student) session.getAttribute("user");
		boolean isExistScore = studentTaskService.IsExistScore(student.getId(), id);
		ModelAndView mav = new ModelAndView();
		if (isExistScore) {
			mav.addObject("testInfo", "您已完成该考试！");
			mav.setViewName("searchStudentTaskInfo");
			return mav;
		}else{
			mav.addObject("questions", taskQuestionService.searchTaskQuestion(id));
			mav.addObject("taskId", id);
			mav.setViewName("enterTask");
			return mav;
		}
	}
}
