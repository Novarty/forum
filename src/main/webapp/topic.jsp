<%@ page import="pojo.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.DaoFactory" %><%--
   /topic
  Created by IntelliJ IDEA.
  User: Артем
  Date: 11.11.2016
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();
    Cookie[] cookies = request.getCookies();
    String userName = null;
    if(cookies != null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("login")) userName = cookie.getValue();
        }
        if (userName != null){
            User sessionUser = userDao.read(userName);
            String role = sessionUser.getRole();
            String username = sessionUser.getUsername();
            if (request.getSession().getAttribute("user") == null){
                request.getSession().setAttribute("user",sessionUser);
            }
            if (request.getSession().getAttribute("username")==null){
                request.getSession().setAttribute("username", username);
            }
        }
    }
%>
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
<nav class="navbar navbar-default c1">

    <ul class="menu">
        <li><p>Список форумов: </p></li>
        <c:forEach items="${forums}" var="forum">
            <li><a href="/forum?id=${forum.forumID}">${forum.nameOfForum}</a></li>
        </c:forEach>
    </ul>
    <br>
    <ol class="breadcrumb mybreadcrumb">
        <li><a href="/main">Главная</a></li>
        <li><a href="/forum?id=${topic.forum_id}">${forum.nameOfForum}</a></li>
        <li class="active">${topic.titleOfTopic}</li>
    </ol>
</nav>
<%--кнопки--%>
<%--<div class="btn-group btn-group-sm c1">--%>
<%--<button type="button" class="btn btn-default">1</button>--%>
<%--<button type="button" class="btn btn-default">2</button>--%>
<%--<button type="button" class="btn btn-default">3</button>--%>
<%--<button type="button" class="btn btn-default">4</button>--%>
<%--<button type="button" class="btn btn-default">&raquo;</button>--%>
<%--<button type="button" class="btn btn-default">Last</button>--%>
<%--<div class="btn-group dropdown">--%>
<%--<button type="button" class="dropdown-toggle" data-toggle="dropdown">--%>
<%--<span class="glyphicon glyphicon-chevron-down"></span>--%>
<%--</button>--%>
<%--<ul class="dropdown-menu">--%>
<%--<li><h1 class="h6">Перейти на страницу</h1></li>--%>
<%--<li><input type="text" class="form-control"></li>--%>
<%--</ul>--%>
<%--</div>--%>
<%--</div>--%>
<div class="btn-toolbar" role="toolbar">
    <ul class="pagination pagination-sm">
        <li><a href="#">&laquo;</a></li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&raquo;</a></li>
    </ul>

    <li class="navbar-right menu-rigth"><a href="/createMessage?id=${topic.topicID}" class="btn btn-link">Прокомментировать</a></li>
    <%--<form action="/topic">--%>
        <%--<li class="navbar-right menu-rigth"><button type="submit" class="btn btn-link">Добавить в избранное</button></li>--%>
    <%--</form>--%>

</div>
<%--Топик--%>
<div class="panel panel-default pndef">
    <div class="panel-heading">
        <ul class="menu">
            <li><h2 class="panel-title text-uppercase">${topic.titleOfTopic}</h2></li>
            <li class="pull-right"><p>Дата создания: ${topic.dateOfCreate}</p></li>
        </ul>
    </div>
    <div class="panel-body panel-default well message">
        <div class="row">
            <%--Колонка профиля--%>
            <div class="col-lg-2">
                <img class="ico" src="img/s.png" height="100" width="100" align="top" alt="Картинки не будет..">
                <ul class="menu2">
                    <li><a href="#">${topic.authorOfMessage}</a></li>
                    <li><p>Роль: <c:out value="${author_role}"></c:out></p></li>
                </ul>
            </div>
            <%--Колонка сообщения--%>
            <div class="col-lg-10">
                <p>${topic.messageOfTopic}</p>
            </div>
        </div>
        <div class="panel-footer panel-warning message">
            <p class="h6">Дата последнего изменения: ${topic.dateOfUpdate} </p>
            <p><c:if test="topic.getStatus()!=null">
                <c:out value="${topic.status}"></c:out>
            </c:if></p>
        </div>
    </div>
    <%--Комменты--%>
    <c:forEach items="${messageList}" var="message">
        <div class="panel-body panel-default well">
            <div class="row">
                    <%--Колонка профиля--%>
                <div class="col-lg-2">
                    <img class="ico" src="img/s.png" height="100" width="100" align="top" alt="Картинки не будет..">
                    <ul class="menu2">
                        <li><a href="#"><c:out value="${message.authorOfMessage}"></c:out></a></li>

                    </ul>
                </div>
                    <%--Колонка сообщения--%>
                <div class="col-lg-10" id="${message.messageID}">
                    <p><c:out value="${message.message}"></c:out></p>
                </div>
            </div>
            <div class="panel-footer panel-default">
                <p class="h6">Дата последнего изменения: ${message.dateOfUpdate} </p>
                <p><c:if test="message.getStatus() != null">
                    <c:out value="message.getStatus()"></c:out>
                </c:if></p>
                <c:choose>
                    <c:when test="${role == 'ADMIN' || role == 'MODERATOR'}">
                        <li class="navbar-right menu-rigth"><button onclick="deleteMessage(this)" data-mid="${message.messageID}" data-id="${message.topic_id}" data-name="${username}" type="submit" class="btn btn-link">Удалить сообщение</button></li>
                    </c:when>
                    <c:when test="${user != null && message.authorOfMessage == username}">
                        <li class="navbar-right menu-rigth"><button onclick="deleteMessage(this)" data-mid="${message.messageID}" data-id="${message.topic_id}" data-name="${username}" type="submit" class="btn btn-link">Удалить сообщение</button></li>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </c:forEach>

</div>
<script>
    function deleteMessage(input) {
        $.post('/topic?name='+$(input).attr('data-name')+'&id='+$(input).attr('data-id')+ '&mid='+$(input).attr('data-mid'));
    }
</script>
</body>
</html>
