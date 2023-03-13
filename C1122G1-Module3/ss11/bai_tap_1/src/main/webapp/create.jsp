<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 13/03/2023
  Time: 11:07 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/book" method="post">
<%--  id, title, pageSize, author, category--%>
  <div class="input-group">
    <label>enter id book:</label>
    <input type="text"
           class="form-control" name="id" id="id" aria-describedby="helpId" placeholder="">
    <label>enter title book:</label>
    <input type="text"
           class="form-control" name="title" id="title" aria-describedby="helpId" placeholder="">
    <label>enter pageSize book:</label>
    <input type="text"
           class="form-control" name="pageSize" id="pageSize" aria-describedby="helpId" placeholder="">
    <label>enter author book:</label>
    <input type="text"
           class="form-control" name="author" id="author" aria-describedby="helpId" placeholder="">
    <label>enter category book:</label>
    <input type="text"
           class="form-control" name="category" id="category" aria-describedby="helpId" placeholder="">
    <button type="submit">Create</button>
  </div>
</form>
</body>
</html>
