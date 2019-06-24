package com.gqz.learn.dao;

import com.gqz.learn.model.College;
import com.gqz.learn.model.CollegeExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CollegeMapper {
    int countByExample(CollegeExample example);

    int deleteByExample(CollegeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(College record);

    int insertSelective(College record);

    List<College> selectByExampleWithBLOBs(CollegeExample example);

    List<College> selectByExample(CollegeExample example);

    College selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") College record, @Param("example") CollegeExample example);

    int updateByExampleWithBLOBs(@Param("record") College record, @Param("example") CollegeExample example);

    int updateByExample(@Param("record") College record, @Param("example") CollegeExample example);

    int updateByPrimaryKeySelective(College record);

    int updateByPrimaryKeyWithBLOBs(College record);

    int updateByPrimaryKey(College record);
    
    /////////////
    void saveColege(College college);
	
	List<College> searchCollege();
	
	void deleteCollege(Integer id);
	
	void updateCollege(College college);
	
	College getCollegeById(Integer id);
}