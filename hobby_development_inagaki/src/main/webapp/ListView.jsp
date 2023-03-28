<%@page import="servlet.ListViewServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="servlet.ListViewServlet" %> 
<% ListViewServlet lsv = (ListViewServlet)request.getAttribute("ListViewServlet"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>データベースの接続確認</title>
</head>
<body>
	<% List<int> ids = (List<int>)request.getAttribute("ListViewServlet"); %>
</body>
</html>