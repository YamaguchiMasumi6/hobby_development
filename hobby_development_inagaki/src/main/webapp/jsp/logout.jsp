<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// セッションを破棄してログアウトする
session.invalidate();

// ログアウト後のページにリダイレクトする
response.sendRedirect("signin.jsp");
%>
