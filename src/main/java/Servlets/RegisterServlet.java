package Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;

import dao.DaoFactory;
import dao.TokenDao;
import dao.UserDao;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import pojo.Member;
import pojo.Token;
import pojo.User;
import pojo.UserTypes;

/**
 * Created by Артем on 25.10.2016.
 */
@WebServlet("/registration")
public class RegisterServlet extends HttpServlet {
    public static UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();
    public static final Logger log = Logger.getLogger(RegisterServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        log.info("regServlet is active");
        req.getRequestDispatcher("/registration.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        log.info("Starting registering user");
        User newUser = new Member();
        log.debug("Retrieving user name from session");
        newUser.setRole(UserTypes.MEMBER.toString());
        newUser.setUsername(req.getParameter("j_username"));
        newUser.setFirstname(req.getParameter("j_firstname"));
        newUser.setLastname(req.getParameter("j_lastname"));
        String passwordMd5 = DigestUtils.md5Hex(req.getParameter("j_password"));
        newUser.setPassword(passwordMd5);
        log.debug("Calculating and setting password for the user");

        log.debug("Saving user " + newUser.getUsername() +" " + newUser.getRole());
        try {
            userDao.create(newUser);
            newUser = userDao.read(newUser.getUsername());
            log.info("Saving user " + newUser.getUsername() + " succeed");
            getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
        } catch (Exception ex) {
            log.error("Saving user " + newUser.getUsername() + " failed");
            getServletContext().getRequestDispatcher("/registration.jsp").forward(req, resp);
        }
    }
}
