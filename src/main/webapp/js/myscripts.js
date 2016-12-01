/**
 * Created by Артем on 28.10.2016.
 */
$(document).ready(function(){
    
    var form = $("#loginform");

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
        },

        messages:{

            j_username:{
                required: "Это поле обязательно для заполнения",
                minlength: "Логин должен быть минимум 4 символа",
                maxlength: "Максимальное число символов - 16",
            },

            j_password:{
                required: "Это поле обязательно для заполнения",
                minlength: "Пароль должен быть минимум 6 символов",
                maxlength: "Пароль должен быть максимум 16 символов",
            },
        },
    });
});