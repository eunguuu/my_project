<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Class.forName("com.mysql.jdbc.Driver");

String dbUrl = "jdbc:mysql://localhost:3306/mandle";
String dbUser = "mandleid";
String dbPass= "mandlepass";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = "select * from aboard order by num desc limit 0,5";
PreparedStatement ps = con.prepareStatement(sql);

ResultSet rs = ps.executeQuery();

JSONArray boardList = new JSONArray();

while(rs.next()) {
	JSONObject jo = new JSONObject();
	jo.put("num", rs.getString("num"));
	jo.put("subject", rs.getString("subject"));
	jo.put("date", rs.getString("date"));
	
	boardList.add(jo);
}
%>

<%=boardList %>
