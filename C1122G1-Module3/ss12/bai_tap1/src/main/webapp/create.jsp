<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 15/03/2023
  Time: 11:43 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
  <form method="post">
    <table border="1" cellpadding="5">
      <caption>
        <h2>Add New Book</h2>
      </caption>
      <tr>
        <th>Name:</th>
        <td>
          <input type="text" name="name" id="name" size="45"/>
        </td>
      </tr>
      <tr>
        <th>Page:</th>
        <td>
          <input type="text" name="pageSize" id="email" size="45"/>
        </td>
      </tr>
      <tr>
        <th>Author:</th>
        <td>
          <input type="text" name="authorId" size="15"/>
        </td>
      </tr>
      <tr>
        <th>Category:</th>
        <td>
          <input type="text" name="categoryId" size="15"/>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="Save"/>
        </td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
