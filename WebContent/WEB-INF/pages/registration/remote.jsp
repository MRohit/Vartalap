<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>


<%
	Map<String, String> map = new HashMap<String, String>();
	map.put("admin@gmail.com", "admintech");
	map.put("hr@gmail.com", "hr");
	map.put("technical@gmail.com", "technical");
	boolean valid = true;

	if (request.getParameter("username") != null
			&& map.containsValue(request.getParameter("username"))) {
		valid = false;
	} else {
		valid = true;
	}
	 
	response.setContentType("text/json");
	if(valid==true){
		Thread.sleep(1000);	
		out.println("{\"valid\":\"true\"}");
	}
	else
		out.println("{\"valid\":\"false\"}");
%>