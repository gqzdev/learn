package com.gqz.learn.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.learn.dao.DiscussMapper;
import com.gqz.learn.model.Discuss;

@Service
public class DiscussService {
	@Resource
	private DiscussMapper discussMapper;

	public void saveDiscuss(Discuss discuss) {
		discussMapper.saveEntity(discuss);
	}

	public List<Discuss> searchDiscuss() {
		return discussMapper.searchEntity();
	}

	public void deleteDiscuss(Integer id) {
		discussMapper.deleteEntity(id);
	}

	public void updateDiscuss(Discuss discuss) {
		discussMapper.updateEntity(discuss);
	}

	public Discuss getDiscussById(Integer id) {
		return discussMapper.getEntityById(id);
	}

	/**
	 * 
	* @Title: searchDiscussbyTeacherIdByPage
	* @Description: 查询老师发布的discuss
	* @author ganquanzhong
	* @date  2019年3月10日 下午10:41:18
	* @param id
	* @param page
	* @param pageSize
	* @return
	 */
	public PageInfo<Discuss> searchDiscussbyTeacherIdByPage(Integer id,int page, int pageSize) {
		// 获取第1页，10条内容，默认查询总数count 物理分页
		PageHelper.startPage(page, pageSize);
		List<Discuss> list = discussMapper.searchDiscussByTeacherId(id);
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<Discuss> pageInfo = new PageInfo<Discuss>(list);
		return pageInfo;
	}

	/**
	 * 
	* @Title: searchDiscussByPage
	* @Description: 查询所有的discuss
	* @author ganquanzhong
	* @date  2019年3月10日 下午10:41:38
	* @param page
	* @param pageSize
	* @return
	 */
	public PageInfo<Discuss> searchDiscussByPage(int page, int pageSize) {
		// 获取第1页，10条内容，默认查询总数count 物理分页
		PageHelper.startPage(page, pageSize);
		List<Discuss> list =discussMapper.searchEntity();
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<Discuss> pageInfo = new PageInfo<Discuss>(list);
		return pageInfo;
	}
}
