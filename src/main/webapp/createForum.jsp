<%--
  Created by IntelliJ IDEA.
  User: Артем
  Date: 13.11.2016
  Time: 3:21
  To change this template use File | Settings | File Templates.
--%>
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
            <form method="post" id="forumform" role="form">
                <div class="form-group">
                    <label for="name">Название форума</label>
                    <input type="text" id="name" class="form-control" name="name">
                </div>
                <div class="form-group">
                    <label for="description">Описание</label>
                    <input type="text" id="description" class="form-control" name="description">
                </div>
                <button type="submit" class="btn btn-success">Создать</button>
                <a href="/main" class="btn btn-link"> Отмена</a>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){

        var form = $("#forumform");

        form.validate({
            rules:{

                name:{
                    required: true,
                    minlength: 4,
                    maxlength: 50,
                },

                description:{
                    required: true,
                    maxlength: 140,
                },
            },

            messages:{

                name:{
                    required: "Это поле обязательно для заполнения",
                    minlength: "Название должно состоять не менее чем из 4 символов",
                    maxlength: "Название не может быть больше 50 символов",
                },

                description:{
                    required: "Это поле обязательно для заполнения",
                    maxlength: "Описание не может быть больше 140 символов",
                },
            },
        });
    });
</script>
</body>
</html>
