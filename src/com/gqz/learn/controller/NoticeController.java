package com.gqz.learn.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.gqz.learn.model.Notice;
import com.gqz.learn.service.NoticeService;

/**
 * 
 * @ClassName:
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author ganquanzhong
 * @date 2019年2月23日 下午11:01:23
 */
@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/createNotice")
	public ModelAndView createNotice() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createNotice");
		return mav;
	}
	@RequestMapping("/saveNotice")
	public ModelAndView saveNotice(Notice notice) {
		notice.setRecordTime(new Date());
		noticeService.saveNotice(notice);
		return new ModelAndView("redirect:/searchNotice.html");
	}
	
	@RequestMapping("/searchNotice")
	public ModelAndView searchNotice() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notices", noticeService.searchNotice());
		mav.setViewName("searchNotice");
		return mav;
	}
	
	@RequestMapping("/searchNoticeInfo")
	public ModelAndView searchNoticeInfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notices", noticeService.searchNotice());
		mav.setViewName("searchNoticeInfo");
		return mav;
	}
	
	@RequestMapping("/deleteNotice/{id}")
	public ModelAndView deleteNotice(@PathVariable("id") Integer id) {
		noticeService.deleteNotice(id);
		return new ModelAndView("redirect:/searchNotice.html");
	}
	
	@RequestMapping("/updateNotice/{id}")
	public ModelAndView updateNotice(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice", noticeService.getNoticeById(id));
		mav.setViewName("updateNotice");
		return mav;
	}
	
	@RequestMapping("/editNotice/{id}")
	public ModelAndView editNotice(@PathVariable("id") Integer id, Notice notice) {
		notice.setId(id);
		notice.setRecordTime(new Date());
		noticeService.updateNotice(notice);
		
		return new ModelAndView("redirect:/searchNotice.html");
	}
	
	@RequestMapping("/noticeListByPage")
	@ResponseBody()
	public PageInfo<Notice> courseListByPage(int page, int pageSize) {
		return noticeService.searchNoticeByPage(page,pageSize);
	}
}
