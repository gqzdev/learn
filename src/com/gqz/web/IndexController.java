package com.gqz.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gqz.dto.Answer;
import com.gqz.model.Admin;
import com.gqz.model.College;
import com.gqz.model.Course;
import com.gqz.model.CourseFile;
import com.gqz.model.CourseVideo;
import com.gqz.model.Discuss;
import com.gqz.model.DiscussPost;
import com.gqz.model.Notice;
import com.gqz.model.Student;
import com.gqz.model.StudentTask;
import com.gqz.model.Task;
import com.gqz.model.TaskQuestion;
import com.gqz.model.Teacher;
import com.gqz.service.IndexService;

/**
 * 
* @ClassName: IndexController
* @Description: Controller
* @author zhong96
* @date 2020年1月7日 下午1:32:07
 */
@Controller
public class IndexController {
    @Resource
    private IndexService indexService;
	
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index"); 
		return mav;
	}
	
	@RequestMapping("/logon")
	public ModelAndView logon() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", "请登录");
		mav.setViewName("logon"); 
		return mav;
	}
	
	@RequestMapping("/register")
	public ModelAndView register() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.setViewName("register"); 
		return mav;
	}
	
	//注册
	@RequestMapping("/addStudent")
	public ModelAndView addStudent(Student student) {
		indexService.saveStudent(student);
		return new ModelAndView("redirect:/logon.html");
	}
	
	@RequestMapping("/userLogon")
	public ModelAndView userLogon(String account, String password, Integer role, HttpSession session) {
		Map<String, String> map = new HashMap<>();
		map.put("account", account);
		map.put("password", password);
		
		if (role == 0) {
			Admin admin = indexService.adminLogon(map);
			if (admin == null) {
				ModelAndView mav = new ModelAndView();
				mav.addObject("info", "用户名或密码错误！");
				mav.setViewName("logon");
				
				return mav;
			} else {
				session.setAttribute("user", admin);
				return new ModelAndView("redirect:/index.html");
			}
		} else if (role == 1) {
			Teacher teacher = indexService.teacherLogon(map);
			if (teacher == null) {
				ModelAndView mav = new ModelAndView();
				mav.addObject("info", "用户名或密码错误！");
				mav.setViewName("logon");
				
				return mav;
			} else {
				session.setAttribute("user", teacher);
				return new ModelAndView("redirect:/teacherIndex.html");
			}
 		} else {
 			Student student = indexService.studentLogon(map);
			if (student == null) {
				ModelAndView mav = new ModelAndView();
				mav.addObject("info", "用户名或密码错误！");
				mav.setViewName("logon");
				
				return mav;
			} else {
				session.setAttribute("user", student);
				return new ModelAndView("redirect:/studentIndex.html");
			}
 		}
		
	}
	
	@RequestMapping("/teacherIndex")
	public ModelAndView teacherindex() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("teacherIndex");
		return mav;
	}
	
	@RequestMapping("/studentIndex")
	public ModelAndView studentIndex() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("studentIndex");
		return mav;
	}
	
	@RequestMapping("/createStudent")
	public ModelAndView createStudent() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.setViewName("createStudent");
		return mav;
	}
	
	@RequestMapping("/createTeacher")
	public ModelAndView createTeacher() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.addObject("courses", indexService.searchCourse());
		mav.setViewName("createTeacher");
		return mav;
	}
	
	@RequestMapping("/createCollege")
	public ModelAndView createCollege() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createCollege");
		return mav;
	}
	
	@RequestMapping("/saveStudent")
	public ModelAndView saveStudent(Student student) {
		indexService.saveStudent(student);
		
		return new ModelAndView("redirect:/createStudent.html");
	}
	
	
	
	@RequestMapping("/saveTeacher")
	public ModelAndView saveStudent(Teacher teacher) {
		indexService.saveTeacher(teacher);
		
		return new ModelAndView("redirect:/createTeacher.html");
	}
	
	@RequestMapping("/saveCollege")
	public ModelAndView saveCollege(College college) {
		indexService.saveCollege(college);
		
		return new ModelAndView("redirect:/createCollege.html");
	}
	
	@RequestMapping("/searchStudent")
	public ModelAndView searchStudent() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.addObject("students", indexService.searchStudent());
		mav.setViewName("searchStudent");
		return mav;
	}
	
	@RequestMapping("/searchStudentByTerm")
	public ModelAndView searchStudentByTerm(String searchContent,Integer collegeId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchContent", searchContent);
		map.put("collegeId", collegeId);
		mav.addObject("students", indexService.searchStudentByTerm(map));
		mav.setViewName("searchStudent");
		return mav;
	}
	
	@RequestMapping("/searchTeacher")
	public ModelAndView searchTeacher() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.addObject("teachers", indexService.searchTeacher());
		mav.setViewName("searchTeacher");
		return mav;
	}
	
	@RequestMapping("/searchTeacherByTerm")
	public ModelAndView searchTeacherByTerm(String searchContent,Integer collegeId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchContent", searchContent);
		map.put("collegeId", collegeId);
		mav.addObject("teachers", indexService.searchTeacherByTerm(map));
		mav.setViewName("searchTeacher");
		return mav;
	}
	
	@RequestMapping("/searchCollege")
	public ModelAndView searchCollege() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.setViewName("searchCollege");
		return mav;
	}
	
	@RequestMapping("/deleteStudent/{id}")
	public ModelAndView deleteStudent(@PathVariable("id") Integer id) {
		indexService.deleteStudent(id);
		
		return new ModelAndView("redirect:/searchStudent.html");
	}
	
	@RequestMapping("/deleteTeacher/{id}")
	public ModelAndView deleteTeacher(@PathVariable("id") Integer id) {
		indexService.deleteTeacher(id);
		
		return new ModelAndView("redirect:/searchTeacher.html");
	}
	
	@RequestMapping("/deleteCollege/{id}")
	public ModelAndView deleteCollege(@PathVariable("id") Integer id) {
		indexService.deleteColege(id);
		
		return new ModelAndView("redirect:/searchCollege.html");
	}
	
	@RequestMapping("/updateStudent/{id}")
	public ModelAndView updateStudent(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.addObject("student", indexService.getStudentById(id));
		mav.setViewName("updateStudent");
		
		return mav;
	}
	
	@RequestMapping("/updateStudentInfo")
	public ModelAndView updateStudentInfo(HttpSession session) {
		Student student = (Student)session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.addObject("student", indexService.getStudentById(student.getId()));
		mav.setViewName("updateStudentInfo");
		
		return mav;
	}
	
	@RequestMapping("/updateAdminInfo")
	public ModelAndView updateAdminInfo(HttpSession session) {
		Admin admin = (Admin)session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
//		mav.addObject("colleges", indexService.searchCollege());
//		mav.addObject("student", indexService.getStudentById(student.getId()));
		mav.addObject("admin",indexService.getAdminById(admin.getId()));
		mav.setViewName("updateAdminInfo");
		
		return mav;
	}
	
	@RequestMapping("/updateTeacher/{id}")
	public ModelAndView updateTeacher(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.addObject("courses", indexService.searchCourse());
		mav.addObject("teacher", indexService.getTeacherById(id));
		mav.setViewName("updateTeacher");
		
		return mav;
	}
	
	@RequestMapping("/updateCollege/{id}")
	public ModelAndView updateColege(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("college", indexService.getCollegeById(id));
		mav.setViewName("updateCollege");
		
		return mav;
	}
	
	@RequestMapping("/editStudent/{id}")
	public ModelAndView editStudent(@PathVariable("id") Integer id, Student student) {
		student.setId(id);
		indexService.updateStudent(student);
		
		return new ModelAndView("redirect:/searchStudent.html");
	}
	
	@RequestMapping("/editStudentInfo/{id}")
	public ModelAndView editStudentInfo(@PathVariable("id") Integer id, Student student) {
		student.setId(id);
		indexService.updateStudent(student);
		
		return new ModelAndView("redirect:/searchCourseInfo.html");
	}
	
	@RequestMapping("/editAdminInfo/{id}")
	public ModelAndView editAdminInfo(@PathVariable("id") Integer id, Admin admin) {
		admin.setId(id);
		indexService.updateAdmin(admin);
		return new ModelAndView("redirect:/updateAdminInfo.html");
	}
	
	@RequestMapping("/editTeacher/{id}")
	public ModelAndView editTeacher(@PathVariable("id") Integer id, Teacher teacher) {
		teacher.setId(id);
		indexService.updateTeacher(teacher);
		
		return new ModelAndView("redirect:/searchTeacher.html");
	}
	
	@RequestMapping("/editCollege/{id}")
	public ModelAndView editCollege(@PathVariable("id") Integer id, College college) {
		college.setId(id);
		indexService.updateColege(college);

		return new ModelAndView("redirect:/searchCollege.html");
	}
	
	@RequestMapping("/createCourse")
	public ModelAndView createCourse() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.setViewName("createCourse");
		return mav;
	}
	
	
	@RequestMapping("/saveCourse")
	public ModelAndView saveCourse(Course course) {
		indexService.saveCourse(course);
		
		return new ModelAndView("redirect:/createCourse.html");
	}
	
	@RequestMapping("/searchCourse")
	public ModelAndView searchCourse() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.addObject("courses", indexService.searchCourse());
		mav.setViewName("searchCourse");
		return mav;
	}
	
	@RequestMapping("/searchCourseByTerm")
	public ModelAndView searchCourseByTerm(String searchContent,Integer collegeId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchContent", searchContent);
		map.put("collegeId", collegeId);
		mav.addObject("courses", indexService.searchCourseByTerm(map));
		mav.setViewName("searchCourse");
		return mav;
	}
	
	@RequestMapping("/deleteCourse/{id}")
	public ModelAndView deleteCourse(@PathVariable("id") Integer id) {
		indexService.deleteCourse(id);
		
		return new ModelAndView("redirect:/searchCourse.html");
	}
	
	@RequestMapping("/updateCourse/{id}")
	public ModelAndView updateCourse(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.addObject("course", indexService.getCourseById(id));
		mav.setViewName("updateCourse");
		
		return mav;
	}
	
	@RequestMapping("/editCourse/{id}")
	public ModelAndView editCourse(@PathVariable("id") Integer id, Course course) {
		course.setId(id);
		indexService.updateCourse(course);
		
		return new ModelAndView("redirect:/searchCourse.html");
	}
	
	@RequestMapping("/createNotice")
	public ModelAndView createNotice() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createNotice");
		return mav;
	}
	
	
	@RequestMapping("/saveNotice")
	public ModelAndView saveNotice(Notice notice) {
		notice.setRecordTime(new Date());
		indexService.saveNotice(notice);
		
		return new ModelAndView("redirect:/createNotice.html");
	}
	
	@RequestMapping("/searchNotice")
	public ModelAndView searchNotice() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notices", indexService.searchNotice());
		mav.setViewName("searchNotice");
		return mav;
	}
	
	@RequestMapping("/searchNoticeInfo")
	public ModelAndView searchNoticeInfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notices", indexService.searchNotice());
		mav.setViewName("searchNoticeInfo");
		return mav;
	}
	
	@RequestMapping("/deleteNotice/{id}")
	public ModelAndView deleteNotice(@PathVariable("id") Integer id) {
		indexService.deleteNotice(id);
		
		return new ModelAndView("redirect:/searchNotice.html");
	}
	
	@RequestMapping("/updateNotice/{id}")
	public ModelAndView updateNotice(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice", indexService.getNoticeById(id));
		mav.setViewName("updateNotice");
		
		return mav;
	}
	
	@RequestMapping("/editNotice/{id}")
	public ModelAndView editNotice(@PathVariable("id") Integer id, Notice notice) {
		notice.setId(id);
		notice.setRecordTime(new Date());
		indexService.updateNotice(notice);
		
		return new ModelAndView("redirect:/searchNotice.html");
	}
	
	@RequestMapping("/createCollegeVideo")
	public ModelAndView createCollegeVideo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.setViewName("createCollegeVideo");
		return mav;
	}
	
	@RequestMapping("/saveCollegeVideo")
	public ModelAndView saveCollegeVideo(@RequestParam("file") MultipartFile multipartFile, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
		Teacher teacher = (Teacher) session.getAttribute("user");
		Integer id = Integer.parseInt(request.getParameter("courseId"));
		
		String fileName = multipartFile.getOriginalFilename();
		//视频上传的路劲
		//windows系统
//		String fileDir = "C://upload/learn/" + fileName;
		//Liunx系统
		String fileDir = "/upload/learn/" + fileName;
		multipartFile.transferTo(new File(fileDir));
		
		CourseVideo collegeVideo = new CourseVideo();
		collegeVideo.setTeacherId(teacher.getId());
		collegeVideo.setCourseId(id);
		collegeVideo.setPath(fileName);
		collegeVideo.setRecordTime(new Date());
		indexService.saveCollegeVideo(collegeVideo);
		
		return new ModelAndView("redirect:/createCollegeVideo.html");
	}
	
	@RequestMapping("/deleteCollegeVideo/{id}")
	public ModelAndView deleteCollegeVideo(@PathVariable("id") Integer id) {
		indexService.deleteCollegeVideo(id);
		
		return new ModelAndView("redirect:/searchCollegeVideo.html");
	}
	
	@RequestMapping("/searchCollegeVideo")
	public ModelAndView searchCollegeVideo(HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		mav.addObject("videos", indexService.searchCollegeVideo(teacher.getId()));
		mav.setViewName("searchCollegeVideo");
		return mav;
	}
	
	@RequestMapping("/createCollegeFile")
	public ModelAndView createCollegeFile() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.setViewName("createCollegeFile");
		return mav;
	}
	
	@RequestMapping("/saveCollegeFile")
	public ModelAndView saveCollegeFile(@RequestParam("file") MultipartFile multipartFile, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
		Teacher teacher = (Teacher) session.getAttribute("user");
		Integer id = Integer.parseInt(request.getParameter("courseId"));
		//文件上传的路劲
		String fileName = multipartFile.getOriginalFilename();
		//windows系统
//		String fileDir = "C://upload/learn/" + fileName;
		//Liunx系统
		String fileDir = "/upload/learn/" + fileName;
		multipartFile.transferTo(new File(fileDir));
		
		CourseFile collegeFile = new CourseFile();
		collegeFile.setTeacherId(teacher.getId());
		collegeFile.setCourseId(id);
		collegeFile.setPath(fileName);
		collegeFile.setRecordTime(new Date());
		indexService.saveCollegeFile(collegeFile);
		
		return new ModelAndView("redirect:/createCollegeVideo.html");
	}
	
	@RequestMapping("/deleteCollegeFile/{id}")
	public ModelAndView deleteCollegeFile(@PathVariable("id") Integer id) {
		indexService.deleteCollegeFile(id);
		
		return new ModelAndView("redirect:/searchCollegeFile.html");
	}
	
	@RequestMapping("/searchCollegeFile")
	public ModelAndView searchCollegeFile(HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		mav.addObject("files", indexService.searchCollegeFile(teacher.getId()));
		mav.setViewName("searchCollegeFile");
		return mav;
	}
	
	@RequestMapping("/createDiscuss")
	public ModelAndView createDiscuss() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.setViewName("createDiscuss");
		return mav;
	}
	
	
	@RequestMapping("/saveDiscuss")
	public ModelAndView saveDiscuss(Discuss discuss, HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		discuss.setRecordTime(new Date());
		discuss.setTeacherId(teacher.getId());
		indexService.saveDiscuss(discuss);
		
		return new ModelAndView("redirect:/createDiscuss.html");
	}
	
	@RequestMapping("/searchDiscuss")
	public ModelAndView searchDiscuss() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("discusses", indexService.searchDiscuss());
		mav.setViewName("searchDiscuss");
		return mav;
	}
	
	@RequestMapping("/searchDiscussInfo")
	public ModelAndView searchDiscussInfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.addObject("teachers", indexService.searchTeacher());
		mav.addObject("discusses", indexService.searchDiscuss());
		mav.setViewName("searchDiscussInfo");
		return mav;
	}
	
	//功能添加  筛选
	@RequestMapping("/searchDiscussInfoByTerm")
	public ModelAndView searchDiscussInfoByTerm(Integer courseId, Integer teacherId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.addObject("teachers", indexService.searchTeacher());
		mav.addObject("discusses", indexService.searchDiscussByTerm(courseId,teacherId));
		mav.setViewName("searchDiscussInfo");
		return mav;
	}
	
	@RequestMapping("/deleteDiscuss/{id}")
	public ModelAndView deleteDiscuss(@PathVariable("id") Integer id) {
		indexService.deleteDiscuss(id);
		
		return new ModelAndView("redirect:/searchDiscuss.html");
	}
	
	@RequestMapping("/updateDiscuss/{id}")
	public ModelAndView updateDiscuss(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.addObject("discuss", indexService.getDiscussById(id));
		mav.setViewName("updateDiscuss");
		
		return mav;
	}
	
	@RequestMapping("/editDiscuss/{id}")
	public ModelAndView editDiscuss(@PathVariable("id") Integer id, HttpSession session, Discuss discuss) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		discuss.setId(id);
		discuss.setRecordTime(new Date());
		discuss.setTeacherId(teacher.getId());
		indexService.updateDiscuss(discuss);
		
		return new ModelAndView("redirect:/searchDiscuss.html");
	}
	
	
	@RequestMapping("/createTask")
	public ModelAndView createTask() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.setViewName("createTask");
		return mav;
	}
	
	@RequestMapping("/saveTask")
	public ModelAndView saveTask(Task task, HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		task.setRecordTime(new Date());
		task.setTeacherId(teacher.getId());
		indexService.saveTask(task);
		
		return new ModelAndView("redirect:/createTask.html");
	}
	
	@RequestMapping("/searchTask")
	public ModelAndView searchTask(HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		mav.addObject("tasks", indexService.searchTask(teacher.getId()));
		mav.setViewName("searchTask");
		return mav;
	}
	
	@RequestMapping("/searchTaskInfo")
	public ModelAndView searchTaskInfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.addObject("teachers", indexService.searchTeacher());
		mav.addObject("tasks", indexService.searchTask());
		mav.setViewName("searchTaskInfo");
		return mav;
	}
	
	@RequestMapping("/searchTaskInfoByTerm")
	public ModelAndView searchTaskInfoByTerm(Integer courseId, Integer teacherId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.addObject("teachers", indexService.searchTeacher());
		mav.addObject("tasks", indexService.searchTaskInfoByTerm(courseId,teacherId));
		mav.setViewName("searchTaskInfo");
		return mav;
	}
	
	@RequestMapping("/deleteTask/{id}")
	public ModelAndView deleteTask(@PathVariable("id") Integer id) {
		indexService.deleteTask(id);
		
		return new ModelAndView("redirect:/searchTask.html");
	}
	
	@RequestMapping("/updateTask/{id}")
	public ModelAndView updateTask(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("task", indexService.getTaskById(id));
		mav.addObject("courses", indexService.searchCourse());
		mav.setViewName("updateTask");
		
		return mav;
	}
	
	@RequestMapping("/editTask/{id}")
	public ModelAndView editTask(@PathVariable("id") Integer id, Task task, HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		task.setId(id);
		task.setRecordTime(new Date());
		task.setTeacherId(teacher.getId());
		indexService.updateTask(task);
		
		return new ModelAndView("redirect:/searchTask.html");
	}
	
	@RequestMapping("/createQuestion/{id}")
	public ModelAndView createQuestion(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("id", id);
		mav.setViewName("createQuestion");
		return mav;
	}
	
	@RequestMapping("/saveQuestion/{id}")
	public ModelAndView saveQuestion(@PathVariable("id") Integer id, TaskQuestion taskQuestion) {
		taskQuestion.setTaskId(id);
		indexService.saveTaskQuestion(taskQuestion);
		
		return new ModelAndView("redirect:/createQuestion/"+id+".html");
	}
	
	@RequestMapping("/searchQuestion/{id}")
	public ModelAndView searchQuestion(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("questions", indexService.searchTaskQuestion(id));
		mav.addObject("taskId", id);
		
		mav.setViewName("searchTaskQuestion");
		return mav;
	}
	
	@RequestMapping("/deleteQuestion/{id}/{taskId}")
	public ModelAndView deleteQuestion(@PathVariable("id") Integer id, @PathVariable("taskId") Integer taskId) {
		indexService.deleteTaskQuestion(id);
		
		return new ModelAndView("redirect:/searchQuestion/" + taskId + ".html");
	}
	
	@RequestMapping("/updateTeacherInfo")
	public ModelAndView updateTeacherInfo(HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		mav.addObject("teacher", indexService.getTeacherById(teacher.getId()));
		mav.addObject("courses", indexService.searchCourse());
		mav.addObject("colleges", indexService.searchCollege());
		mav.setViewName("updateTeacherInfo");
		return mav;
	}
	
	@RequestMapping("/editTeacherInfo/{id}")
	public ModelAndView editTeacherInfo(@PathVariable("id") Integer id, Teacher teacher) {
		teacher.setId(id);
		indexService.updateTeacher(teacher);
		
		return new ModelAndView("redirect:/createCollegeVideo.html");
	}
	
	@RequestMapping("/searchCourseInfo")
	public ModelAndView searchCourseInfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", indexService.searchCollege());
		mav.addObject("courses", indexService.searchCourse());
		mav.setViewName("searchCourseInfo");
		return mav;
	}
	
	@RequestMapping("/searchCourseInfoByTerm")
	public ModelAndView searchCourseInfoByTerm(String searchContent,Integer collegeId) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchContent",searchContent);
		map.put("collegeId",collegeId);
		mav.addObject("colleges", indexService.searchCollege());
		mav.addObject("courses", indexService.searchCourseInfoByTerm(map));
		mav.setViewName("searchCourseInfo");
		return mav;
	}
	
	@RequestMapping("/searchCollegeVideoInfo")
	public ModelAndView searchCollegeVideoInfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.addObject("teachers", indexService.searchTeacher());
		mav.addObject("videos", indexService.searchAllCollegeVideo());
		mav.setViewName("searchCollegeVideoInfo");
		return mav;
	}
	
	@RequestMapping("/searchCourseVideoInfoByTerm")
	public ModelAndView searchCourseVideoInfoByTerm(Integer courseId, Integer teacherId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.addObject("teachers", indexService.searchTeacher());
		List<CourseVideo> videosList = indexService.searchCollegeVideoByTerm(courseId,teacherId);
		mav.addObject("videos", videosList);
		mav.setViewName("searchCollegeVideoInfo");
		return mav;
	}
	
	@RequestMapping("/searchCollegeFileInfo")
	public ModelAndView searchCollegeFileInfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.addObject("teachers", indexService.searchTeacher());
		mav.addObject("files", indexService.searchAllCollegeFile());
		mav.setViewName("searchCollegeFileInfo");
		return mav;
	}
	
	@RequestMapping("/searchCourseFileInfoByTerm")
	public ModelAndView searchCourseInfoByTerm(Integer courseId, Integer teacherId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("courses", indexService.searchCourse());
		mav.addObject("teachers", indexService.searchTeacher());
		List<CourseFile> filesList = indexService.searchCollegeFileByTerm(courseId,teacherId);
		mav.addObject("files", filesList);
		mav.setViewName("searchCollegeFileInfo");
		return mav;
	}
	
	@RequestMapping("/watchVideo/{id}")
	public ModelAndView watchVideo(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("video", indexService.getCourseVideoById(id));
		mav.setViewName("watchVideo");
		return mav;
	}
	
	@RequestMapping("/downFile/{id}")
	public ModelAndView downFile(@PathVariable("id") Integer id) {
		CourseFile file = indexService.getCourseFileById(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", "location.href='/upload/learn/" + file.getPath() + "'");
		mav.setViewName("downFile");
		return mav;
	}
	
	@RequestMapping("/createReply/{id}")
	public ModelAndView createReply(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("id", id);
		mav.setViewName("createReply");
		return mav;
	}
	
	@RequestMapping("/saveDiscussReply/{id}")
	public ModelAndView saveDiscussReply(@PathVariable("id") Integer id, DiscussPost post, HttpSession session) {
		Student student = (Student) session.getAttribute("user");
		post.setDiscussId(id);
		post.setRecordTime(new Date());
		post.setStudentId(student.getId());
		
		indexService.saveDiscussPost(post);
		return new ModelAndView("redirect:/searchDiscussReply/" + id + ".html");
	}
	
	@RequestMapping("/searchDiscussReply/{id}")
	public ModelAndView searchDiscussReply(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("posts", indexService.searchDiscussPost(id));
		mav.setViewName("searchDiscussReply");
		return mav;
	}
	
	@RequestMapping("/enterTask/{id}")
	public ModelAndView enterTask(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("questions", indexService.searchTaskQuestion(id));
		mav.addObject("taskId", id);
		mav.setViewName("enterTask");
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping("/saveStudentTask")
	public Integer saveStudentTask(Integer id, String answer, HttpSession session) {
		List<Answer> answers = (List<Answer>) session.getAttribute("answers") == null ? new ArrayList<>() : (List<Answer>) session.getAttribute("answers");
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
	
	@RequestMapping("/saveTaskScore/{taskId}")
	public ModelAndView saveTaskScore(HttpSession session, @PathVariable("taskId") Integer taskId) {
		List<Answer> answers = (List<Answer>) session.getAttribute("answers") == null ? new ArrayList<>() : (List<Answer>) session.getAttribute("answers");
		List<TaskQuestion> questions = indexService.searchTaskQuestion(taskId);
		int score = 0;
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
		
		indexService.saveStudentTask(studentTask);
		return new ModelAndView("redirect:/searchStudentTaskInfo.html");
		
	}
	
	@RequestMapping("/searchStudentTaskInfo")
	public ModelAndView searchStudentTaskInfo(HttpSession session) {
		Student student = (Student) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		mav.addObject("tasks", indexService.searchStudentTaskByStuId(student.getId()));
		mav.setViewName("searchStudentTaskInfo");
		
		return mav;
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		session.setAttribute("user", null);
		return new ModelAndView("redirect:/logon.html");
	}
	
	
	@RequestMapping("/teacherDataImport")
	public ModelAndView teacherDataImport(@RequestParam("file") MultipartFile file) {
		Teacher teacher = new Teacher();
		 int totalRows;
		 int totalCells; 
		 List<ArrayList<String>> list = new ArrayList<ArrayList<String>>();  
	        // IO流读取文件  
	        InputStream input = null;  
	        HSSFWorkbook wb = null;  
	        ArrayList<String> rowList = null;  
	        try {  
	            input = file.getInputStream();  
	            // 创建文档  
	            wb = new HSSFWorkbook(input);                         
	            //读取sheet(页)  
	            for(int numSheet=0;numSheet<wb.getNumberOfSheets();numSheet++){  
	                HSSFSheet hssfSheet = wb.getSheetAt(numSheet);  
	                if(hssfSheet == null){  
	                    continue;  
	                }  
	                totalRows = hssfSheet.getLastRowNum();                
	                //读取Row,从第二行开始  
	                for(int rowNum = 1;rowNum <= totalRows;rowNum++){  
	                    HSSFRow hssfRow = hssfSheet.getRow(rowNum);  
	                    if(hssfRow!=null){  
	                        rowList = new ArrayList<String>();  
	                        totalCells = hssfRow.getLastCellNum();  
	                        //读取列，从第一列开始  
                            HSSFCell cell = hssfRow.getCell(0);
                            teacher.setName(cell.getStringCellValue());
                            cell = hssfRow.getCell(1);
                            teacher.setGender((int)cell.getNumericCellValue());
                            cell = hssfRow.getCell(2);
                            teacher.setCollegeId((int)cell.getNumericCellValue());
                            cell = hssfRow.getCell(3);
                            DecimalFormat format = new DecimalFormat("#");  
                            Number value = cell.getNumericCellValue();  
                            teacher.setTelphone(format.format(value));
                            cell = hssfRow.getCell(4);
                            teacher.setIdCardNo(cell.getStringCellValue());
                            cell = hssfRow.getCell(5);
                            teacher.setAccount(cell.getStringCellValue());
                            cell = hssfRow.getCell(6);
                            teacher.setPassword(String.valueOf(cell.getNumericCellValue()));
                            cell = hssfRow.getCell(7);
                            value = cell.getNumericCellValue();  
                            teacher.setNum(format.format(value));
                            cell = hssfRow.getCell(8);
                            teacher.setCourseId((int)cell.getNumericCellValue());
                            
                            indexService.saveTeacher(teacher);
	                    }                     
	                }  
	            }  
	        } catch (IOException e) {             
	            e.printStackTrace();  
	        } finally{  
	            try {  
	                input.close();  
	            } catch (IOException e) {  
	                e.printStackTrace();  
	            }  
	        }  
	        
	        return new ModelAndView("redirect:/searchTeacher.html");
	}
	
	
	@RequestMapping("/createManyTeacher")
	public ModelAndView createManyTeacher() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createManyTeacher");
		return mav;
	}
	
	
	//添加功能点⑤   批量导入学生信息
	@RequestMapping("/studentDataImport")
	public ModelAndView studentDataImport(@RequestParam("file") MultipartFile file) {
		 Student student = new Student();
		 int totalRows;
		 int totalCells; 
		 List<ArrayList<String>> list = new ArrayList<ArrayList<String>>();  
	        // IO流读取文件  
	        InputStream input = null;  
	        HSSFWorkbook wb = null;  
	        ArrayList<String> rowList = null;  
	        try {  
	            input = file.getInputStream();  
	            // 创建文档  
	            wb = new HSSFWorkbook(input);                         
	            //读取sheet(页)  
	            for(int numSheet=0;numSheet<wb.getNumberOfSheets();numSheet++){  
	                HSSFSheet hssfSheet = wb.getSheetAt(numSheet);  
	                if(hssfSheet == null){  
	                    continue;  
	                }  
	                totalRows = hssfSheet.getLastRowNum();                
	                //读取Row,从第二行开始  
	                for(int rowNum = 1;rowNum <= totalRows;rowNum++){  
	                    HSSFRow hssfRow = hssfSheet.getRow(rowNum);  
	                    if(hssfRow!=null){  
	                        rowList = new ArrayList<String>();  
	                        totalCells = hssfRow.getLastCellNum();  
	                        //读取列，从第一列开始  
                            HSSFCell cell = hssfRow.getCell(0);
                            student.setName(cell.getStringCellValue());
                            cell = hssfRow.getCell(1);
                            student.setNum(cell.getStringCellValue());
                            cell = hssfRow.getCell(2);
                            student.setCollegeId((int)cell.getNumericCellValue());
                            cell = hssfRow.getCell(3);  
                            DecimalFormat format = new DecimalFormat("#");  
                            Number value = cell.getNumericCellValue();                              
                            student.setTelphone(format.format(value));
                            cell = hssfRow.getCell(4);
                            student.setIdCardNo(cell.getStringCellValue());
                            cell = hssfRow.getCell(5);                            
                            student.setGender((int)cell.getNumericCellValue());
                            cell = hssfRow.getCell(6);
                            student.setAccount(cell.getStringCellValue());
                            cell = hssfRow.getCell(7);
                            student.setPassword(cell.getStringCellValue());
                            indexService.saveStudent(student);
	                    }                     
	                }  
	            }  
	        } catch (IOException e) {             
	            e.printStackTrace();
	            System.out.println("数据导入失败！！");
	        } finally{  
	            try {  
	                input.close();  
	            } catch (IOException e) {  
	                e.printStackTrace();  
	            }  
	        }  
	        
	        return new ModelAndView("redirect:/searchStudent.html");
	}
	
	@RequestMapping("/createManyStudent")
	public ModelAndView createManyStudent() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createManyStudent");
		return mav;
	}
	
	//加入课程
	@RequestMapping("/addCourse/{id}")
	public ModelAndView addCourse(HttpSession session,@PathVariable("id") Integer id) {
		Student student = (Student) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		HashMap<String , Object> map = new HashMap<>();
		map.put("stuId",student.getId());
		map.put("cId", id);
		indexService.saveCollect(map);
		mav.setViewName("redirect:/searchMyCourseInfo.html");
		return mav;
	}
	
	//我的课程
	@RequestMapping("/searchMyCourseInfo")
	public ModelAndView searchMyCourseInfo(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Student student = (Student) session.getAttribute("user");
		mav.addObject("courses", indexService.searchMyCourse(student.getId()));
		mav.setViewName("searchMyCourseInfo");
		return mav;
	}
	
	@RequestMapping("/deleteMyCourse/{id}")
	public ModelAndView deleteMyCourse(HttpSession session,@PathVariable("id") Integer id) {
		Student student = (Student) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		HashMap<String , Object> map = new HashMap<>();
		map.put("stuId",student.getId());
		map.put("cId", id);
		indexService.deleteCollect(map);
		mav.setViewName("redirect:/searchMyCourseInfo.html");
		return mav;
	}
	
	@RequestMapping("/searchMyCourseVideo/{id}")
	public ModelAndView searchMyCourseVideo(HttpSession session,@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		List<CourseVideo> videosList = indexService.searchCollegeVideoByTerm(id,0);
		mav.addObject("videos", videosList);
		mav.setViewName("searchCollegeVideoInfo");
		return mav;
	}
	
	@RequestMapping("/searchMyCoursefile/{id}")
	public ModelAndView searchMyCoursefile(HttpSession session,@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		List<CourseFile> filesList = indexService.searchCollegeFileByTerm(id,0);
		mav.addObject("files", filesList);
		mav.setViewName("searchCollegeFileInfo");
		return mav;
	}
}
