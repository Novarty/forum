
<!DOCTYPE html>
<%--
  Created by IntelliJ IDEA.
  User: Артем
  Date: 29.10.2016
  Time: 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.14.0/jquery.validate.js"></script>
    <%--<script type="application/javascript" src="js/myscripts.js"></script>--%>

    <!-- Website CSS style -->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">

    <!-- Website Font style -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

    <title>Forum</title>
</head>
<body>
<div class="container">
    <div class="row main">
        <div class="panel-heading">
            <div class="panel-title text-center">
                <h1 href="index.jsp" class="title">Forum</h1>
                <hr />
            </div>
        </div>
        <div class="main-login main-center">
            <form class="form-horizontal regform" method="post" action="#" onsubmit="validateInputs('.j_password','.j_password2')">

                <div class="form-group">
                    <label for="firstname" class="cols-sm-2 control-label">Your firstname</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="j_firstname" id="firstname"  placeholder="Enter your firstname"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="j_lastname" class="cols-sm-2 control-label">Your lastname</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="j_lastname" id="j_lastname"  placeholder="Enter your lastname"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="j_username" class="cols-sm-2 control-label">Username</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="j_username" id="j_username" placeholder="Enter your Username"/>
                        </div>
                        <p id="errUsername"></p>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="cols-sm-2 control-label">Password</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                            <input type="password" class="form-control j_password" name="j_password" id="password"  placeholder="Enter your Password" onkeyup="checkpass('.j_password', '.j_password2')"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                            <input type="password" class="form-control j_password2" name="confirm" id="confirm"  placeholder="Confirm your Password" onkeyup="checkpass('.j_password', '.j_password2')"/>
                        </div>
                    </div>
                </div>
                <p class="mess"></p>

                <div class="form-group ">
                    <button type="submit" class="btn btn-primary btn-lg btn-block login-button">Register</button>
                </div>
                <div class="login-register">
                    <a href="/login">Login</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script>

    /**
     * Created by Артем on 28.10.2016.
     */
    $(document).ready(function(){
        checkLogin('#j_username');

        var form = $(".regform");
        form.validate({
            rules:{

                j_username:{
                    required: true,
                    minlength: 4,
                    maxlength: 16,
                },

                j_password:{
                    required: true,
                    minlength: 6,
                    maxlength: 16,
                },
                j_firstname:{
                    required: true,
                    minlength: 2,
                    maxlength: 16,
                },
                j_lastname:{
                    required: true,
                    minlength: 2,
                    maxlength: 16,
                },
            },

            messages:{

                j_username:{
                    required: "Это поле обязательно для заполнения",
                    minlength: "Логин должен быть минимум 4 символа",
                    maxlength: "Максимальное число символо - 16",
                },

                j_password:{
                    required: "Это поле обязательно для заполнения",
                    minlength: "Пароль должен быть минимум 6 символа",
                    maxlength: "Пароль должен быть максимум 16 символов",
                },

                j_firstname:{
                    required: "Это поле обязательно для заполнения",
                    minlength: "Недопустимо менее 2 символов",
                    maxlength: "Максимальное число символо - 16",

                },

                j_lastname:{
                    required: "Это поле обязательно для заполнения",
                    minlength: "Недопустимо менее 2 символов",
                    maxlength: "Максимальное число символо - 16",
                },
            },
        });
    });
    /*Функция, осуществляющая проверку на равенство двух полей перед отправкой.
     Если они неравны, то форма не отправляется.
     Используется в onsubmit
     */
    function validateInputs(input1, input2) {
        if($(input1).val() == $(input2).val()) {
            return true;
        }
    }
    function checkpass(passfield1, passfield2) {
        if ($(passfield1).val() != "" && $(passfield2).val() != ""){
            if($(passfield1).val() == $(passfield2).val()) {
                $('.mess').html('<p class="success">Пароли совпадают</p>');
            } else {
                $('.mess').html('<p class="error">Пароли не совпадают</p>');
            }
        }
        else {
            $('.message').html('<p class="error"></p>');
        }
    }
    function checkLogin(input) {
        var username = $(input);
        username.on('blur',function () {
            $.post('/searchLogin', {j_username : username.val()}, function(responseText) {
                $('#errUsername').html(responseText)
            })
        });
    }
</script>
</body>
</html>