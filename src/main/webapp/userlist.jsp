<%--
  Created by IntelliJ IDEA.
  User: Артем
  Date: 14.11.2016
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Forum</title>
    <link rel="stylesheet" href="http://meyerweb.com/eric/tools/css/reset/reset.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/mystyle.css" rel="stylesheet">
    <link href="fonts/glyphicons-halflings-regular.ttf">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.14.0/jquery.validate.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<%--Таблица пользователей--%>
<table class="table table-striped">
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Role</th>
        <th>Date of Registration</th>
        <th>Change Role</th>

    </tr>
    <c:if test="${session_user.isModerator()}">
        <c:forEach items="${users}" var="user">
            <tr>
                <td><c:out value="${user.databaseId}"/></td>
                <td><c:out value="${user.username}"/></td>
                <td><c:out value="${user.firstname}"/></td>
                <td><c:out value="${user.lastname}"/></td>
                <td><c:out value="${user.role}"/></td>
                <td><c:out value="${user.registerdate}"/></td>
                <td>
                <c:if test="${!user.role.equals(\"ADMIN\")}">

                        <li class="dropdown">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                Сменить роль <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><button onclick="changeRole(this)" data-role="MODERATOR" data-user="${user.databaseId}" class="btn btn-link">МОДЕРАТОР</button></li>
                                <li><button onclick="changeRole(this)" data-role="MEMBER" data-user="${user.databaseId}" class="btn btn-link">ПОЛЬЗОВАТЕЛЬ</button></li>
                            </ul>
                        </li>
                </c:if>
                </td>
            </tr>
        </c:forEach>
    </c:if>

    <c:if test="${session_user.isAdmin()}">
        <c:forEach items="${users}" var="user">
            <tr>
                <td><c:out value="${user.databaseId}"/></td>
                <td><c:out value="${user.username}"/></td>
                <td><c:out value="${user.firstname}"/></td>
                <td><c:out value="${user.lastname}"/></td>
                <td><c:out value="${user.role}"/></td>
                <td><c:out value="${user.registerdate}"/></td>
                <td>
                    <li class="dropdown">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            Сменить роль <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><button onclick="changeRole(this)" data-role="ADMIN" data-user="${user.databaseId}" class="btn btn-link">АДМИН</button></li>
                            <li><button onclick="changeRole(this)" data-role="MODERATOR" data-user="${user.databaseId}" class="btn btn-link">МОДЕРАТОР</button></li>
                            <li><button onclick="changeRole(this)" data-role="MEMBER" data-user="${user.databaseId}" class="btn btn-link">ПОЛЬЗОВАТЕЛЬ</button></li>
                        </ul>
                    </li>
                </td>
            </tr>
        </c:forEach>
    </c:if>

</table>
<script>
    function changeRole(input) {
        $.post('/userlist?role='+$(input).attr('data-role')+'&id='+$(input).attr('data-user'));
    }
</script>
</body>
</html>
