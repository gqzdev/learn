package com.xafdy.dao;

import com.xafdy.model.Notice;
import java.util.List;

public interface NoticeMapper {
	void saveEntity(Notice notice);
	
	List<Notice> searchEntity();
	
	void deleteEntity(Integer id);
	
	void updateEntity(Notice notice);
	
	Notice getEntityById(Integer id);
}