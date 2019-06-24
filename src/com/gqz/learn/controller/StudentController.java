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
import com.gqz.learn.service.CollegeService;
import com.gqz.learn.service.StudentService;

/**
 * 
* @ClassName: StudentController
* @Description: TODO(这里用一句话描述这个类的作用)
* @author ganquanzhong
* @date 2019年2月26日 下午11:59:32
 */
@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;

	@Autowired
	private CollegeService collegeService;

	@RequestMapping("/studentIndex")
	public ModelAndView studentIndex() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("studentIndex");
		return mav;
	}

	// 准备添加学生页面
	@RequestMapping("/createStudent")
	public ModelAndView createStudent() {
		ModelAndView mav = new ModelAndView();
		// 预加载  学生属于那个学院的
		mav.addObject("colleges", collegeService.searchCollege());
		mav.setViewName("createStudent");
		return mav;
	}
	// 添加学生
	@RequestMapping("/addStudent")
	public ModelAndView addStudent(Student student) {
		studentService.addStudent(student);
		return new ModelAndView("redirect:/searchStudent.html");
	}

	// 查询学生信息
	@RequestMapping("/searchStudent")
	public ModelAndView searchStudent() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("students", studentService.searchStudent());
		mav.setViewName("searchStudent");
		return mav;
	}

	@RequestMapping("/deleteStudent/{id}")
	public ModelAndView deleteStudent(@PathVariable("id") Integer id) {
		studentService.deleteStudent(id);
		return new ModelAndView("redirect:/searchStudent.html");
	}
	
	//加载需要修改的学生信息
	@RequestMapping("/updateStudent/{id}")
	public ModelAndView updateStudent(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", collegeService.searchCollege());
		mav.addObject("student", studentService.getStudentById(id));
		mav.setViewName("updateStudent");
		return mav;
	}
	//更新学生信息
	@RequestMapping("/editStudent/{id}")
	public ModelAndView editStudent(@PathVariable("id") Integer id, Student student) {
		student.setId(id);
		studentService.updateStudent(student);
		return new ModelAndView("redirect:/searchStudent.html");
	}
	
	
	@RequestMapping("/updateStudentInfo")
	public ModelAndView updateStudentInfo(HttpSession session) {
		Student student = (Student)session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", collegeService.searchCollege());
		mav.addObject("student", studentService.getStudentById(student.getId()));
		mav.setViewName("updateStudentInfo");
		return mav;
	}
	
	
	
	//更新个人信息
	@RequestMapping("/editStudentInfo/{id}")
	public ModelAndView editStudentInfo(@PathVariable("id") Integer id, Student student) {
		student.setId(id);
		studentService.updateStudent(student);
		return new ModelAndView("redirect:/searchNotice.html");
	}
	
	//批量添加学生
	@RequestMapping("/createManyStudent")
	public ModelAndView createManyTeacher() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createManyStudent");
		return mav;
	}

	@SuppressWarnings("resource")
	@RequestMapping("/studentDataImport")
	public ModelAndView teacherDataImport(@RequestParam("file") MultipartFile file) {
		Student student=new Student();
		int totalRows;
		int totalCells;
		List<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
		// IO流读取文件
		InputStream input = null;
		HSSFWorkbook wb = null;
		ArrayList<String> rowList = null;
		try {
			input = file.getInputStream();
			wb = new HSSFWorkbook(input);// 创建文档
			// 读取sheet(页)
			for (int numSheet = 0; numSheet < wb.getNumberOfSheets(); numSheet++) {
				HSSFSheet hssfSheet = wb.getSheetAt(numSheet);
				if (hssfSheet == null) {continue;}
				totalRows = hssfSheet.getLastRowNum();
				// 读取Row,从第二行开始
				for (int rowNum = 1; rowNum <= totalRows; rowNum++) {
					HSSFRow hssfRow = hssfSheet.getRow(rowNum);
					if (hssfRow != null) {
						rowList = new ArrayList<String>();
						totalCells = hssfRow.getLastCellNum();
						// 读取列，从第一列开始
						HSSFCell cell = hssfRow.getCell(0);//Name
						student.setName(cell.getStringCellValue());
						cell = hssfRow.getCell(1);//gender
						student.setGender((int) cell.getNumericCellValue());
						cell = hssfRow.getCell(2);//college_id
						student.setCollegeId((int) cell.getNumericCellValue());
						cell = hssfRow.getCell(3);//telphone
						DecimalFormat format = new DecimalFormat("#");
						Number value = cell.getNumericCellValue();
						student.setTelphone(format.format(value));
						cell = hssfRow.getCell(4);//idcard
						student.setIdCardNo(cell.getStringCellValue());
						cell = hssfRow.getCell(5);//account
						if(cell!=null){
							cell.setCellType(Cell.CELL_TYPE_STRING);
							student.setAccount(cell.getStringCellValue());
						}						
						cell = hssfRow.getCell(6);//password
						if(cell!=null){
							cell.setCellType(Cell.CELL_TYPE_STRING);
							student.setPassword(cell.getStringCellValue());
						}	
						cell = hssfRow.getCell(7);//num
						if(cell!=null){
							cell.setCellType(Cell.CELL_TYPE_STRING);
							student.setNum(cell.getStringCellValue());
						}	
						cell = hssfRow.getCell(8);//state
						student.setState(cell.getStringCellValue());
						cell = hssfRow.getCell(9);//isDel
						student.setIsdel((int) cell.getNumericCellValue());
						studentService.addStudent(student);
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
		return new ModelAndView("redirect:/searchStudent.html");
	}
	
	
	/**
	 * 
	 * @Title: searchStudentData
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @author ganquanzhong
	 * @date 2019年3月3日 下午11:23:27
	 * @return
	 */
	@RequestMapping("/studentList")
	@ResponseBody
	public List<Student> studentList() {
		List<Student> list=studentService.searchStudent();
		return list;
	}

	//学生信息分页
	@RequestMapping("/studentListByPage")
	@ResponseBody()
	public PageInfo<Student> studentListByPage(int page, int pageSize) {
		return studentService.searchStudentByPage(page,pageSize);
	}
	//有条件查询
	@RequestMapping("/studentListByTerm")
	@ResponseBody()
	public PageInfo<Student> studentListByTerm(int page, int pageSize,String content,int collegeId) {
		return studentService.searchStudentByTerm(page,pageSize,content,collegeId);
	}

}
