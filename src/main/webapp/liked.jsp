<%--
  Created by IntelliJ IDEA.
  User: Артем
  Date: 03.11.2016
  Time: 0:53
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
 <%-- Топики добавленные в избранное--%>
 <div class="panel-body">
     <c:forEach items="${topics}" var="topic">
         <div class="panel panel-primary">
             <div class="panel-heading">
                 <a href="/topic?id=${topic.topicID}" class="panel-title topicLink"><c:out
                         value="${topic.titleOfTopic}"/></a>
                 <ul class="menu">
                     <li><p class="authorOfTopic">Автор темы: <c:out value="${topic.authorOfMessage}"/></p></li>
                     <li><p>Дата создания: <c:out value="${topic.dateOfCreate}"/></p></li>
                 </ul>
             </div>
             <div class="panel-body">
                 <c:out value="${topic.message}"/>
             </div>
         </div>
     </c:forEach>
 </div>
<%--Кнопки переключения страниц--%>
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
 </div>
</body>
</html>
