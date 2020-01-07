package com.gqz.dao;

import java.util.List;

import com.gqz.model.College;

public interface CollegeMapper {
	void saveColege(College college);
	
	List<College> searchCollege();
	
	void deleteCollege(Integer id);
	
	void updateCollege(College college);
	
	College getCollegeById(Integer id);
}