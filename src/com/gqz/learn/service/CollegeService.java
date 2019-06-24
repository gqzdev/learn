package com.gqz.learn.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.learn.dao.CollegeMapper;
import com.gqz.learn.model.College;
import com.gqz.learn.model.CollegeExample;

/**
 * 
 * @ClassName: CollegeService
 * @Description: 学院的service
 * @author ganquanzhong
 * @date 2019年2月23日 下午9:01:59
 */

@Service
public class CollegeService {
	@Resource
	private CollegeMapper collegeMapper;

	// 添加学院
	public void saveCollege(College college) {
		collegeMapper.saveColege(college);
	}

	// 查询所有学院
	public List<College> searchCollege() {
		return collegeMapper.searchCollege();
	}

	// 通过id查询学院
	public College getCollegeById(Integer id) {
		return collegeMapper.getCollegeById(id);
	}

	// 通过id删除学院
	public void deleteColege(Integer id) {
		collegeMapper.deleteCollege(id);
	}

	// 更新
	public void updateColege(College college) {
		collegeMapper.updateCollege(college);
	}

	public PageInfo<College> searchCollegeByPage(int page, int pageSize) {
		// 获取第1页，10条内容，默认查询总数count 物理分页
		PageHelper.startPage(page, pageSize);
		List<College> list = collegeMapper.searchCollege();
		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<College> pageInfo = new PageInfo<College>(list);
		return pageInfo;
	}

	// JSON
	public List<College> getCollegeList() {
		CollegeExample collegeExample=new CollegeExample();
		return collegeMapper.selectByExample(collegeExample);
	}
}
