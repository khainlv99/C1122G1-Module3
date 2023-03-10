<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 10/03/2023
  Time: 6:46 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Date date = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    String formattedDate = formatter.format(date);
%>
<p>admin đăng nhập thành công vào lúc: <%= formattedDate %></p>
</body>
</html>
