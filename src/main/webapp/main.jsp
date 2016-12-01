<%--
   /main
  Created by IntelliJ IDEA.
  User: Артем
  Date: 11.11.2016
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Forum</title>
</head>
<body>
<c:if test="${user.isAdmin()}">
    <a href="/createForum" class="btn btn-lg btn-link"><span class="glyphicon glyphicon-plus-sign"></span> Создать раздел</a>
</c:if>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Разделы</h3>
    </div>
    <div class="panel-body">
        <c:forEach items="${forums}" var="forum">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <a href="/forum?id=${forum.forumID}" class="panel-title topicLink"><c:out value = "${forum.nameOfForum}"/></a>
                    <ul class="menu">
                        <li><p class="authorOfTopic">Дата создания: <c:out value="${forum.dateOfCreate}"/></p></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <p><c:out value="${forum.descriptionOfForum}"/></p>
                </div>
            </div>
        </c:forEach>

    </div>
</div>
</body>
</html>
