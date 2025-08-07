<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Forget Password</title>
  <style>
    body { text-align: center; background-color: #333; font-family: Arial; color: white; }
    .container {
      background-color: #666;
      display: inline-block;
      padding: 20px;
      border-radius: 10px;
      margin-top: 50px;
    }
    input { padding: 8px; margin: 6px; width: 250px; }
    button { padding: 8px 20px; margin: 10px; font-weight: bold; }
  </style>
</head>
<body>
  <div class="container">
    <h2>🔐 Forget Password</h2>
    <form method="post" action="Forget">
      <input type="text" name="username" value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>" placeholder="Enter Username" required>
      <button name="action" value="search">Search</button><br>

      <input type="text" name="name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>" placeholder="Name" readonly><br>

      <input type="text" name="security_question" value="<%= request.getAttribute("security_question") != null ? request.getAttribute("security_question") : "" %>" placeholder="Security Question" readonly><br>

      <input type="text" name="answer" placeholder="Answer" required>
      <button name="action" value="retrieve">Retrieve</button><br>

      <input type="text" name="password" placeholder="Password (Will appear after retrieve)" readonly><br>

      <button type="submit" name="action" value="back">BACK</button>
    </form>
  </div>
</body>
</html>
