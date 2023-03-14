<%--
  Created by IntelliJ IDEA.
  User: BOSS
  Date: 2/12/2023
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/users">
    <input type="hidden" name="action" value="search">
    <fieldset>
        <legend>Search user by country:</legend>
        <table>
            <tr>
                <td>Country name: </td>
                <td><input type="text" name="country" id="country"></td>
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
