<%@ page import="dao.UserDao" %>
<%@ page import="dao.DaoFactory" %>
<%@ page import="pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: Артем
  Date: 09.11.2016
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
           prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String userName = null;
    UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("login")) userName = cookie.getValue();
            User sessionUser = userDao.read(userName);
            request.getSession().setAttribute("user",sessionUser);

        }
    }
%>
<html>
<head>
    <title><decorator:title/></title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/mystyle.css" rel="stylesheet">
    <link href="fonts/glyphicons-halflings-regular.ttf">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.14.0/jquery.validate.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header dropdown">
            <button type="button" class="navbar-toggle collapsed" data-toggle="dropdown"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/main">Форум</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <%--<ul class="nav navbar-nav">--%>
            <%--</ul>--%>

            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Поиск по заголовку">
                </div>
                <button type="submit" class="btn btn-default">Find</button>
            </form>
            <ul class="nav navbar-nav navbar-right">

                <c:if test="${user == null}">
                    <li><a href="/login">Войти</a></li>
                </c:if>
                <c:if test="${user.isAdmin()}">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            Меню <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/profile">Профиль</a></li>
                            <li><a href="#">Настройки</a></li>
                            <li><a href="/liked">Избранное</a></li>
                            <li><a href="/userlist">Список пользователей</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="/logout">Выйти</a></li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${user.isMember()}">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            Меню <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/profile">Профиль</a></li>
                            <li><a href="#">Настройки</a></li>
                            <li><a href="/liked">Избранное</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="/logout">Выйти</a></li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${user.isModerator()}">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            Меню <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/profile">Профиль</a></li>
                            <li><a href="#">Настройки</a></li>
                            <li><a href="/liked">Избранное</a></li>
                            <li><a href="/userlist">Список пользователей</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="/logout">Выйти</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
            <ul class="nav navbar-right navbar-text">
                <c:if test="${user != null}">
                    <p>You sign in as <a href="/profile">${user.getUsername()}</a></p>
                </c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div>
    <div class="container">
        <decorator:body/>

    </div>
</div>
</body>
</html>
