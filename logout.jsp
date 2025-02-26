<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // Invalidate the session
    response.sendRedirect("home_page.jsp"); // Redirect to the home page or any other page
%>
