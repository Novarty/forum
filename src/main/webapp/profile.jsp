<%--
  Created by IntelliJ IDEA.
  User: Артем
  Date: 14.11.2016
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
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
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Персональная информация</h3>
    </div>
    <div class="panel-body row">
        <div class="col-md-4">
            <img class="ico" src="img/s.png" height="100" width="100" align="top" alt="Картинки не будет..">
        </div>
        <div class="col-md-8">
            <ul>
                <li>Имя: ${user.firstname}</li>
                <li>Фамилия: ${user.lastname}</li>
                <li>Псевдоним: ${user.username}</li>
                <li>Роль на сайте: ${user.role}</li>
                <li>Дата регистрации ${user.registerdate}</li>
                <li>Кол-во тем пользователя: ${user.countOfTopics}</li>
                <li>Кол-во сообщений пользователя ${user.countOfMessages}</li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
