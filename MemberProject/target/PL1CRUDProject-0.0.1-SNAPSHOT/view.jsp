<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.MemberDAO,com.crud.bean.MemberVO,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Member</title>
</head>
<body>

<%
	MemberDAO memberDAO = new MemberDAO();
	String id=request.getParameter("id");	
	MemberVO u=memberDAO.getMember(Integer.parseInt(id));
%>

<h1>View</h1>
<br>
<table>
<tr><td>ID:</td><td><%= u.getUserid()%></td></tr>
<tr><td>Name:</td><td><%= u.getUsername()%></td></tr>
<tr><td>Email:</td><td><%= u.getEmail()%></td></tr>
<tr><td>photo:</td><td><%= u.getPhoto()%></td></tr>
<tr><td>Detail:</td><td><%= u.getDetail()%> </td></tr>
</table>
<a href="editform.jsp?id=${u.getSid()}">Edit</a>
</body>
</html>
