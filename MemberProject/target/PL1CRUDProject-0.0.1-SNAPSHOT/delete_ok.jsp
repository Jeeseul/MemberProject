

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.crud.dao.MemberDAO,com.crud.bean.MemberVO"%>

<%
	request.setCharacterEncoding("utf-8");


	String sid = request.getParameter("id");
	if (sid != ""){
		System.out.print(sid);
		int id = Integer.parseInt(sid);
		MemberVO u = new MemberVO();
		u.setSid(id);
		MemberDAO memberDAO = new MemberDAO();
		memberDAO.deleteMember(u);
	} 
	
	response.sendRedirect("list.jsp");
%>