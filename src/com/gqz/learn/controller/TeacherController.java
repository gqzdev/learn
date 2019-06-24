package com.gqz.learn.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.gqz.learn.model.Student;
import com.gqz.learn.model.Teacher;
import com.gqz.learn.service.CollegeService;
import com.gqz.learn.service.CourseService;
import com.gqz.learn.service.TeacherService;

/**
 * 
 * @ClassName:
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author ganquanzhong
 * @date 2019年2月23日 下午11:01:23
 */
@Controller
public class TeacherController {
	@Autowired
	private TeacherService teacherService;

	@Autowired
	private CourseService courseService;

	@Autowired
	private CollegeService collegeService;

	@RequestMapping("/teacherIndex")
	public ModelAndView teacherindex() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("teacherIndex");
		return mav;
	}

	// 准备添加教师页面
	@RequestMapping("/createTeacher")
	public ModelAndView createTeacher() {
		ModelAndView mav = new ModelAndView();
		// 教师属于那个学院的，教授那门课程
		mav.addObject("colleges", collegeService.searchCollege());
		mav.addObject("courses", courseService.searchCourse());
		mav.setViewName("createTeacher");
		return mav;
	}

	// 添加教师
	@RequestMapping("/saveTeacher")
	public ModelAndView saveStudent(Teacher teacher) {
		teacherService.saveTeacher(teacher);
		return new ModelAndView("redirect:/searchTeacher.html");
	}

	@RequestMapping("/searchTeacher")
	public ModelAndView searchTeacher() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("teachers", teacherService.searchTeacher());
		mav.setViewName("searchTeacher");
		return mav;
	}

	@RequestMapping("/deleteTeacher/{id}")
	public ModelAndView deleteTeacher(@PathVariable("id") Integer id) {
		teacherService.deleteTeacher(id);

		return new ModelAndView("redirect:/searchTeacher.html");
	}

	@RequestMapping("/updateTeacher/{id}")
	public ModelAndView updateTeacher(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", collegeService.searchCollege());
		mav.addObject("courses", courseService.searchCourse());
		mav.addObject("teacher", teacherService.getTeacherById(id));
		mav.setViewName("updateTeacher");
		return mav;
	}

	@RequestMapping("/updateTeacherInfo")
	public ModelAndView updateTeacherInfo(HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		mav.addObject("teacher", teacherService.getTeacherById(teacher.getId()));
		mav.addObject("courses", courseService.searchCourse());
		mav.addObject("colleges", collegeService.searchCollege());
		mav.setViewName("updateTeacherInfo");
		return mav;
	}

	@RequestMapping("/editTeacherInfo/{id}")
	public ModelAndView editTeacherInfo(@PathVariable("id") Integer id,
			Teacher teacher) {
		teacher.setId(id);
		teacherService.updateTeacher(teacher);
		return new ModelAndView("redirect:/searchCourse.html");
	}

	@RequestMapping("/editTeacher/{id}")
	public ModelAndView editTeacher(@PathVariable("id") Integer id,
			Teacher teacher) {
		teacher.setId(id);
		teacherService.updateTeacher(teacher);

		return new ModelAndView("redirect:/searchTeacher.html");
	}

	@RequestMapping("/createManyTeacher")
	public ModelAndView createManyTeacher() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createManyTeacher");
		return mav;
	}
	
	/**
	 * 
	 * @Title: teacherDataImport
	 * @Description: 批量导入教师信息
	 * @author ganquanzhong
	 * @date 2019年3月3日 下午5:53:11
	 * @param file
	 * @return
	 */
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
			// 读取sheet(页)
			for (int numSheet = 0; numSheet < wb.getNumberOfSheets(); numSheet++) {
				HSSFSheet hssfSheet = wb.getSheetAt(numSheet);
				if (hssfSheet == null) {
					continue;
				}
				totalRows = hssfSheet.getLastRowNum();
				// 读取Row,从第二行开始
				for (int rowNum = 1; rowNum <= totalRows; rowNum++) {
					HSSFRow hssfRow = hssfSheet.getRow(rowNum);
					if (hssfRow != null) {
						rowList = new ArrayList<String>();
						totalCells = hssfRow.getLastCellNum();
						// 读取列，从第一列开始
						HSSFCell cell = hssfRow.getCell(0);
						teacher.setName(cell.getStringCellValue());
						cell = hssfRow.getCell(1);
						teacher.setGender((int) cell.getNumericCellValue());
						cell = hssfRow.getCell(2);
						teacher.setCollegeId((int) cell.getNumericCellValue());
						cell = hssfRow.getCell(3);
						DecimalFormat format = new DecimalFormat("#");
						Number value = cell.getNumericCellValue();
						teacher.setTelphone(format.format(value));
						cell = hssfRow.getCell(4);
						teacher.setIdCardNo(cell.getStringCellValue());
						cell = hssfRow.getCell(5);
						teacher.setAccount(cell.getStringCellValue());
						cell = hssfRow.getCell(6);
						if(cell!=null){
							cell.setCellType(Cell.CELL_TYPE_STRING);
							teacher.setPassword(cell.getStringCellValue());
						}	
						cell = hssfRow.getCell(7);
						value = cell.getNumericCellValue();
						teacher.setNum(format.format(value));
						cell = hssfRow.getCell(8);
						teacher.setCourseId((int) cell.getNumericCellValue());
						teacherService.saveTeacher(teacher);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return new ModelAndView("redirect:/searchTeacher.html");
	}
	
	/**
	 * 
	* @Title: studentListByPage
	* @Description:分页查询
	* @author ganquanzhong
	* @date  2019年3月9日 下午5:30:52
	* @param page
	* @param pageSize
	* @return
	 */
	@RequestMapping("/teacherListByPage")
	@ResponseBody()
	public PageInfo<Teacher> teacherListByPage(int page, int pageSize) {
		return teacherService.searchTeacherByPage(page,pageSize);
	}
	
	@RequestMapping("/teacherListByTerm")
	@ResponseBody()
	public PageInfo<Teacher> teacherListByTerm(int page, int pageSize,String content,int collegeId) {
		return teacherService.searchTeacherByTerm(page,pageSize,content,collegeId);
	}
}
