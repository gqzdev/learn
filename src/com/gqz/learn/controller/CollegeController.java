package com.gqz.learn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.gqz.learn.model.College;
import com.gqz.learn.service.CollegeService;

/**
 * 
 * @ClassName:
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author ganquanzhong
 * @date 2019年2月23日 下午11:01:23
 */
@Controller
public class CollegeController {

	@Autowired
	private CollegeService collegeService;

	@RequestMapping("/createCollege")
	public ModelAndView createCollege() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createCollege");
		return mav;
	}

	// 添加学院
	@RequestMapping("/addCollege")
	public ModelAndView addCollege(College college) {
		collegeService.saveCollege(college);

		return new ModelAndView("redirect:/searchCollege.html");
	}
	
	@RequestMapping("/searchCollege")
	@ResponseBody
	public ModelAndView searchCollege() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("colleges", collegeService.searchCollege());
		mav.setViewName("searchCollege");
		return mav;
	}
	
	@RequestMapping("/deleteCollege/{id}")
	public ModelAndView deleteCollege(@PathVariable("id") Integer id) {
		collegeService.deleteColege(id);
		return new ModelAndView("redirect:/searchCollege.html");
	}
	
	
	@RequestMapping("/updateCollege/{id}")
	public ModelAndView updateColege(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("college", collegeService.getCollegeById(id));
		mav.setViewName("updateCollege");
		
		return mav;
	}
	
	@RequestMapping("/editCollege/{id}")
	public ModelAndView editCollege(@PathVariable("id") Integer id, College college) {
		college.setId(id);
		collegeService.updateColege(college);

		return new ModelAndView("redirect:/searchCollege.html");
	}
	
	@RequestMapping("/collegeListByPage")
	@ResponseBody()
	public PageInfo<College> collegeListByPage(int page, int pageSize) {
		return collegeService.searchCollegeByPage(page,pageSize);
	}
	
	@RequestMapping("/getCollegeList")
	@ResponseBody()
	public List<College> getCollegeList() {
		return collegeService.getCollegeList();
	}
}
