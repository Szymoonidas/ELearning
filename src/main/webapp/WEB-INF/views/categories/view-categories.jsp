<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: szymon
  Date: 15.12.2021
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
    <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Nazwa</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${categories}" var="categories">
            <tr>
                <td><a href="http://localhost:8080/categories/${categories.id}" rel="noopener">${categories.id}</a></td>
                <td>${categories.name}</td>
            </tr>
            <div><a href="/categories/delete/${categories.id}"><button>Usuń</button></a> </div>
        </c:forEach>
        </tbody>
    </table>
    <div><a href="/categories/add"><button>Dodaj</button></a> </div>
    <form action="<c:url value="/logout"/>" method="post">
        <input type="submit" value="Wyloguj">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</sec:authorize>
</body>
</html>
