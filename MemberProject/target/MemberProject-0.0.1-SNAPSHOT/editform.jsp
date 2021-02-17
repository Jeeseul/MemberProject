<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.crud.dao.MemberDAO,com.crud.bean.MemberVO"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit member's info</title>
<link rel="stylesheet" href="member.css">
</head>
<body>

<%
	MemberDAO memberDAO = new MemberDAO();
	String id = request.getParameter("id");	
	MemberVO u = memberDAO.getMember(Integer.parseInt(id));
	request.setAttribute("vo",u);
%>

<h1 id='title'>Edit Form</h1>
<form action="edit_ok.jsp" method="post" enctype='multipart/form-data'>
<input type="hidden" name="sid" value="<%=u.getSid() %>"/>
<table class='addform'>
<tr><td>User Id:</td><td><input type="text" name="userid" value="<%= u.getUserid()%>" /></td></tr>
<tr><td>User Name:</td><td><input type="text" name="username" value="<%= u.getUsername()%>"/></td></tr>
<tr><td>Email:</td><td><input type="text" name="email" value="<%= u.getEmail()%>" /></td></tr>
<tr><td>Photo:</td><td><input type="file" name="photo" value=" ${vo.getPhoto()}" /><c:if test="${ vo.getPhoto() ne ''}" ><br />
<img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}" class = "photo"></c:if></td></tr>
<tr><td>Detail:</td><td><textarea cols="50" rows="5" name="detail"><%= u.getDetail()%></textarea></td></tr>
<tr><td colspan="2" ><input type="submit" class='buttonform' value="Edit Post"/>
<input type="button" class='buttonform' value="Cancel" onclick="history.back()"/></td></tr>
</table>
</form>

</body>
</html>