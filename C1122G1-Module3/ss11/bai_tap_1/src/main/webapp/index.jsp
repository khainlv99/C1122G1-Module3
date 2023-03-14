<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<form action="/book" method="get">
<table class="table">
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>PageSize</th>
        <th>Author</th>
        <th>Category</th>
        <th>Card</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="book" items="${books}">
    <tr>
        <td>${book.id}</td>
        <td>${book.title}</td>
        <td>${book.pageSize}</td>
        <td>${book.author}</td>
        <td>${book.category}</td>
        <td>
            <a href="/book?action=create">Create</a>
            <a href="/book?action=update&id=${book.id}">Update</a>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>