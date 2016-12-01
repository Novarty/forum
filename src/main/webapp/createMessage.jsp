<%--
  Created by IntelliJ IDEA.
  User: Артем
  Date: 15.11.2016
  Time: 0:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Forum</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.14.0/jquery.validate.js"></script>
    <script type="application/javascript" src="js/myscripts.js"></script>
</head>
<body>
<div class="container">
    <div class="row main">
        <div class="main-login main-center">
            <form method="post" id="messageform" role="form">
                <div class="form-group">
                    <label for="name">Текст сообщения</label>
                    <input type="text" id="name" class="form-control" name="name">
                </div>
                <button type="submit" class="btn btn-success">Создать</button>
                <button type="reset" class="btn btn-info">Сбросить</button>
                <a class="btn btn-link" href="${referer}">Отмена</a>
            </form>
            <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <strong><%=request.getAttribute("error")%>
                </strong>
            </div>
            <% }%>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){

        var form = $("#messageform");

        form.validate({
            rules:{

                name:{
                    required: true,
                    minlength: 4,
                    maxlength: 500,
                },
            },

            messages:{

                name:{
                    required: "Это поле обязательно для заполнения",
                    minlength: "Название должно состоять не менее чем из 4 символов",
                    maxlength: "Название не может быть больше 50 символов",
                },
            },
        });
    });
</script>
</body>
</html>
