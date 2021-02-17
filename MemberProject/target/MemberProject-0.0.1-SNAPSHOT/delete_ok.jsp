

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.crud.dao.MemberDAO,com.crud.bean.MemberVO"%>
<%@page import="com.crud.common.FileUpload"%>

<%
	request.setCharacterEncoding("utf-8");


	String sid = request.getParameter("id");
	if (sid != ""){
		System.out.print(sid);
		int id = Integer.parseInt(sid);
		MemberVO u = new MemberVO();
		u.setSid(id);
		MemberDAO memberDAO = new MemberDAO();
		
		String filename = memberDAO.getPhotoFilename(id);
		if(filename != null)
			FileUpload.deleteFile(request,filename);
		memberDAO.deleteMember(u);
	} 
	
	response.sendRedirect("list.jsp");
%>