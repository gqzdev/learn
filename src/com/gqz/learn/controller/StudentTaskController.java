package com.gqz.learn.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.gqz.learn.common.Answer;
import com.gqz.learn.model.Student;
import com.gqz.learn.model.StudentTask;
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
public class StudentTaskController {
	
    @Autowired
    private StudentTaskService studentTaskService;
    
    @Autowired
    private TaskQuestionService taskQuestionService;

	// 完成考试，自动打分
	@ResponseBody
	@RequestMapping("/saveStudentTask")
	public Integer saveStudentTask(Integer id, String answer,HttpSession session) {
		@SuppressWarnings("unchecked")
		List<Answer> answers = (List<Answer>) session.getAttribute("answers") == null ? new ArrayList<>()
				: (List<Answer>) session.getAttribute("answers");
		boolean flag = false;
		for (Answer model : answers) {
			if (model.getId() == id) {
				flag = true;
			}
		}
		if (!answer.equals("0")) {
			if (flag) {
				for (Answer model : answers) {
					if (model.getId() == id) {
						model.setAnswer(answer);
					}
				}
			} else {
				Answer model = new Answer();
				model.setId(id);
				model.setAnswer(answer);
				answers.add(model);
			}
		}
		session.setAttribute("answers", answers);
		return 1;
	}

	@RequestMapping("/addStudentScore/{taskId}")
	public ModelAndView addStudentScore(HttpSession session, @PathVariable("taskId") Integer taskId) {
		@SuppressWarnings("unchecked")
		List<Answer> answers = (List<Answer>) session.getAttribute("answers") == null ? new ArrayList<>()
				: (List<Answer>) session.getAttribute("answers");
		// taskId试题的答案
		List<TaskQuestion> questions = taskQuestionService.searchTaskQuestion(taskId);
		int score = 0;
		// 循环将用户选择的答案和标准答案对比打分
		for (Answer model : answers) {
			for (TaskQuestion question : questions) {
				if (question.getId() == model.getId()) {
					if (question.getAnswer().equals(model.getAnswer())) {
						score = score + question.getScore();
					}
				}
			}
		}
		Student student = (Student) session.getAttribute("user");
		StudentTask studentTask = new StudentTask();
		studentTask.setRecordTime(new Date());
		studentTask.setScore(score);
		studentTask.setStudentId(student.getId());
		studentTask.setTaskId(taskId);
		studentTaskService.saveStudentTask(studentTask);// 保存考试成绩
		return new ModelAndView("redirect:/searchStudentTaskInfo.html");
	}
	
	//查询所有  学生成绩
	/**
	 * 
	* @Title: searchStudentTaskInfo
	* @Description: TODO(这里用一句话描述这个方法的作用)
	* @author ganquanzhong
	* @date  2019年3月15日 下午3:28:37
	* @param id  task_id
	* @return
	 */
	@RequestMapping("/searchStudentTaskScore/{id}")
	public ModelAndView searchStudentTaskScore(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("task_id", id);
		mav.setViewName("searchStudentTask");
		return mav;
	}
	
	@RequestMapping("/studentScoreListByPage")
	@ResponseBody()
	public PageInfo<StudentTask> studentScoreListByPage(int id,int page, int pageSize) {		
		return studentTaskService.searchStudentScoreByPage(id,page,pageSize);
	}
	
	@RequestMapping("/deleteStudentTask/{id}/{task_id}")
	public ModelAndView deleteStudentTask(@PathVariable("id") Integer id,@PathVariable("task_id") Integer task_id) {
		studentTaskService.delete(id);
		ModelAndView mav = new ModelAndView();	
		mav.addObject("task_id", task_id);
		mav.setViewName("searchStudentTask");
		return mav;
	}
	
	//查询学生自己个人的成绩
	@RequestMapping("/searchStudentTaskInfo")
	public ModelAndView searchStudentTaskInfo(HttpSession session) {
		Student student = (Student) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		mav.addObject("tasks", studentTaskService.searchStudentTaskByStuId(student.getId()));
		mav.setViewName("searchStudentTaskInfo");
		return mav;
	}
	
	//查询学生自己个人的成绩
	@RequestMapping("/studentTaskListByPage")
	@ResponseBody()
	public PageInfo<StudentTask> studentTaskListByPage(HttpSession session,int page, int pageSize) {
		Student student = (Student) session.getAttribute("user");
		return studentTaskService.searchStudentTaskByPage(student.getId(),page,pageSize);
	}
	
	@RequestMapping("/getTaskFinnished")
	@ResponseBody()
	public List<StudentTask> getTaskFinnished(HttpSession session) {
		Student student = (Student) session.getAttribute("user");
		return studentTaskService.getTaskFinnishedList(student.getId());
	}
}
