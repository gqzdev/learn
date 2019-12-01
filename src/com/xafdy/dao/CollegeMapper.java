package com.xafdy.dao;

import java.util.List;

import com.xafdy.model.College;

public interface CollegeMapper {
	void saveColege(College college);
	
	List<College> searchCollege();
	
	void deleteCollege(Integer id);
	
	void updateCollege(College college);
	
	College getCollegeById(Integer id);
}