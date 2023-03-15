<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 15/03/2023
  Time: 10:15 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/book">
    <table>
        <thread>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Page Size</th>
                <th>Author Id</th>
                <th>Category Id</th>
            </tr>
        </thread>
        <tbody>
        <c:forEach items="${listUser}" var="book">
            <tr>
                <td>${book.id}</td>
                <td>${book.name}</td>
                <td>${book.pageSize}</td>
                <td>${book.authorId}</td>
                <td>${book.categoryId}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>

</body>
</html>
