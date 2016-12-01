package Servlets;

/**
 * Created by Артем on 25.10.2016.
 */

import dao.DaoFactory;
import dao.UserDao;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import pojo.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    static Logger log = Logger.getLogger(LoginServlet.class);
    static UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        log.info("loginServlet is active");
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username = req.getParameter("j_username");
        String passwordHash = DigestUtils.md5Hex(req.getParameter("j_password"));
        String referer = req.getHeader("Referer");
        log.info("Begin authorization");

        if (username != null) {
            if (passwordHash != null) {
                User sessionUser = userDao.read(username, passwordHash);
                if (sessionUser != null) {  // если пользователь существует
                    log.info("The user " + username + " exist and have authorized");
                    req.getSession().setAttribute("user", sessionUser);
                    req.getSession().setAttribute("username", sessionUser.getUsername());
                    req.getSession().setAttribute("role", sessionUser.getRole());
                    log.info(sessionUser.getRole());
                    log.info("юзер есть в базе.");
                    Cookie login = new Cookie("login", username);
                    login.setMaxAge(3600);
                    resp.addCookie(login);
                    log.info("Установили куки для текущего юзера");
                    resp.sendRedirect("/main");
                } else {
                    log.info("The user "+ username +" not exist");
                    req.setAttribute("error", "Incorrect username or password");
                    getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
                }

            } else { // Обычно не выполняется. Не пускает валидатор
                log.info("Password was not passed");
                req.setAttribute("error", "Username or password was not passed");
                getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
            }
        } else { // Обычно не выполняется. Не пускает валидатор
            log.info("Username was not passed");
            req.setAttribute("error", "Username or password was not passed");
            getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }

}
