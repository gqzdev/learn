package com.gqz.learn.common;

import java.io.Serializable;

/**
 * 
* @ClassName: ResultBean
* @Description: 返回结果实体类
* @author ganquanzhong
* @date 2019年3月1日 下午3:04:05
 */
public class ResultBean implements Serializable{
	/**
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	*/
	private static final long serialVersionUID = 1L;
	private Object objectdata;
	private String message;
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getObjectdata() {
		return objectdata;
	}

	public void setObjectdata(Object objectdata) {
		this.objectdata = objectdata;
	}
	
	
}
