<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	int role = (int)session.getAttribute("role");	
	if(role==0){
		response.sendRedirect("index.html");
	}
%>