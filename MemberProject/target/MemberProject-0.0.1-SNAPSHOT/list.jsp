
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.MemberDAO"%>
<%@page import="com.crud.bean.MemberVO"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Member list</title>
<link rel="stylesheet" href="member.css">
<style>

</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='delete_ok.jsp?id=' + id;
	}
</script>
</head>
<body>
<h1>Member List</h1>

<table id="list" width="90%">
<tr>
	<th>No</th>
	<th>Id</th>
	<th>Name</th>
	<th>E-mail</th>
	<th>Regdate</th>
	<th>View</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
<%
	MemberDAO memberDAO = new MemberDAO();
	List<MemberVO> list = memberDAO.getList();
	request.setAttribute("list",list);
%>
<c:forEach items="${list}" var="u" varStatus="status">
	<tr >
		<td>${fn:length(list)-status.index}</td>
		<td>${u.getUserid()}</td>
		<td>${u.getUsername()}</td>
		<td>${u.getEmail()}</td>
		<td>${u.getRegdate()}</td>
		<td><a href="view.jsp?id=${u.getSid()}">View</a></td>
		<td><a href="editform.jsp?id=${u.getSid()}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.getSid()}')">Delete</a></td>
	</tr>
</c:forEach>
</table>

<br/><a href="addform.jsp">Add New Member</a>
</body>
</html>