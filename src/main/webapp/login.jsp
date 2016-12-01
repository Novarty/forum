
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="http://meyerweb.com/eric/tools/css/reset/reset.css">
    <%--<meta charset="UTF-8">--%>
    <!-- Website Font style -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link href="css/mystyle.css" rel="stylesheet">
    <%-- Шрифты --%>
    <link href="fonts/glyphicons-halflings-regular.ttf">
    <%-- Подключение jquery-validation --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.14.0/jquery.validate.js"></script>
    <script type="application/javascript" src="js/myscripts.js"></script>
</head>
<body>
<div class="container">
    <div class="row main">
        <div class="main-login main-center">
            <form method="post" id="loginform" action="login">
                <div class="form-group">
                    <label for="j_username">Логин</label>
                    <input type="text" id="j_username" class="form-control" placeholder="Введите никнейм" name="j_username">
                </div>
                <div class="form-group">
                    <label for="j_password">Пароль</label>
                    <input type="password" id="j_password" class="form-control" placeholder="Пароль" name="j_password">
                </div>
                <button type="submit" class="btn btn-success">Войти</button>

                <a href="/registration" class="btn btn-primary">Зарегистрироваться</a>
                <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger">
                    <strong><%=request.getAttribute("error")%>
                    </strong>
                </div>
                <% }%>
            </form>
        </div>
    </div>
</div>
</body>
<script>

</script>
</html>
