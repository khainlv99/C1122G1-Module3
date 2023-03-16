<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 16/03/2023
  Time: 9:45 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/book">
    <input type="hidden" name="action" value="search">
    <fieldset>
        <legend>Search book by name:</legend>
        <table>
            <tr>
                <td>Country name: </td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Search"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
