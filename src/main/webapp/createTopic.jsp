<%--

  Created by IntelliJ IDEA.
  User: Артем
  Date: 15.11.2016
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
            <form method="post" id="topicform" role="form">
                <div class="form-group">
                    <label for="name">Название заголовка</label>
                    <input type="text" id="name" class="form-control" name="name">
                </div>
                <div class="form-group">
                    <label for="description">Описание</label>
                    <input type="text" id="description" class="form-control" name="description">
                </div>
                <div class="form-group">
                    <label for="text">Текст</label>
                    <input type="text" id="text" class="form-control" name="text" placeholder="Содержание топика">
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

        var form = $("#topicform");

        form.validate({
            rules:{

                name:{
                    required: true,
                    minlength: 5,
                    maxlength: 120,
                },
                discription:{
                    required: true,
                    minlength: 15,
                    maxlength: 500,
                },
                text:{
                    required: true,
                    minlength: 30,
                    maxlength: 1500,
                }
            },

            messages:{

                name:{
                    required: "Это поле обязательно для заполнения",
                    minlength: "Название должно состоять не менее чем из 5 символов",
                    maxlength: "Название не может быть больше 500 символов",
                },
                discription:{
                    required: "Это поле обязательно для заполнения",
                    minlength: "Описание должно быть не менее 30 символов",
                    maxlength: "Не более 500 символов",
                },
                text:{
                    required: "Это поле обязательно для заполнения",
                    minlength: "Не менее 30 символов",
                    maxlength: "Превышен максимальный объем текста",
                }
            },
        });
    });
</script>
</body>
</html>
