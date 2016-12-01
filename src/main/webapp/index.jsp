<%--/forum--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <li class="active"><a href="#">${forumname}</a></li>
    </ol>
</nav>
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
    <li class="navbar-right menu-rigth"><a href="/createTopic?id=${forumID}" class="btn btn-link">Создать топик</a></li>
</div>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">${forumname} - Темы</h3>
    </div>
    <div class="panel-body">
        <c:forEach items="${topics}" var="topic">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <a href="/topic?id=${topic.topicID}" class="panel-title topicLink"><c:out
                            value="${topic.titleOfTopic}"/></a>
                    <ul class="menu">
                        <li><p class="authorOfTopic">Автор темы: <c:out value="${topic.authorOfMessage}"/></p></li>
                        <li><p>Дата создания: <c:out value="${topic.dateOfCreate}"/></p></li>

                        <c:if test="${role == 'ADMIN' || role == 'MODERATOR'}">
                            <li class="navbar-right menu-rigth"><button type="submit" class="btn btn-link">Удалить топик(Не реализовано)</button></li>
                        </c:if>
                    </ul>
                </div>
                <div class="panel-body">
                    <c:out value="${topic.message}"/>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<ul class="pagination pagination-sm">
    <li><a href="#">&laquo;</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>
</body>
</html>
