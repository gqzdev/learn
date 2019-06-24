package com.gqz.learn.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.learn.dao.NoticeMapper;
import com.gqz.learn.model.Notice;

@Service
public class NoticeService {
	@Resource
	private NoticeMapper noticeMapper;

	public void saveNotice(Notice notice) {
		noticeMapper.saveEntity(notice);
	}

	public List<Notice> searchNotice() {
		return noticeMapper.searchEntity();
	}

	public void deleteNotice(Integer id) {
		noticeMapper.deleteEntity(id);
	}

	public void updateNotice(Notice notice) {
		noticeMapper.updateEntity(notice);
	}

	public Notice getNoticeById(Integer id) {
		return noticeMapper.getEntityById(id);
	}

	public PageInfo<Notice> searchNoticeByPage(int page, int pageSize) {
		// TODO Auto-generated method stub
		// 获取第1页，10条内容，默认查询总数count 物理分页
		PageHelper.startPage(page, pageSize);
		List<Notice> list = noticeMapper.searchEntity();
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<Notice> pageInfo = new PageInfo<Notice>(list);
		return pageInfo;
	}
}
