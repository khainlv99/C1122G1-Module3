<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 14/03/2023
  Time: 10:20 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit book</title>
</head>
<body>
<h1>Edit book</h1>
<p>
  <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>
<p>
  <a href="/book">Back to customer list</a>
</p>
<form method="post" action="/book?action=update">
  <fieldset>
    <legend>Book information</legend>
    <table>
      <tr>
        <td>Title: </td>
        <td><input type="text" name="title" id="title" value="${requestScope["book"].getTitle()}"></td>
      </tr>
      <tr>
        <td>Page Size: </td>
        <td><input type="text" name="pageSize" id="pageSize" value="${requestScope["book"].getPageSize()}"></td>
      </tr>
      <tr>
        <td>Author: </td>
        <td><input type="text" name="author" id="author" value="${requestScope["book"].getAuthor()}"></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Update book"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>

