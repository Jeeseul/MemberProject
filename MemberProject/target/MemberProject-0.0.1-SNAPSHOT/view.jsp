<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.MemberDAO,com.crud.bean.MemberVO,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Member</title>
<link rel="stylesheet" href="member.css">
</head>
<body>

<%
	MemberDAO memberDAO = new MemberDAO();
	String id=request.getParameter("id");	
	MemberVO u = memberDAO.getMember(Integer.parseInt(id));
	request.setAttribute("vo", u);
%>

<h1 id='title'>View</h1>
<br>
<table>
<tr><td class='addform'>ID:</td><td class='info'><%= u.getUserid()%></td></tr>
<tr><td class='addform'>Name:</td><td class='info'><%= u.getUsername()%></td></tr>
<tr><td class='addform'>Email:</td><td class='info'><%= u.getEmail()%></td></tr>
<tr><td class='addform'>photo:</td><td ><c:if test="${ vo.getPhoto() ne ''}" ><br />
<img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}" class = "photo"></c:if></td></tr>
<tr><td class='addform'>Detail:</td><td class='info'><%= u.getDetail()%> </td></tr>
</table>
<a href="editform.jsp?id=${vo.getSid()}" class='buttonform'>Edit</a>
</body>
</html>
