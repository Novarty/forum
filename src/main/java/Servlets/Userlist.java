package Servlets;

import dao.DaoFactory;
import dao.UserDao;
import org.apache.log4j.Logger;
import pojo.User;
import pojo.UserTypes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Артем on 17.11.2016.
 */
@WebServlet ("/userlist")
public class Userlist extends HttpServlet {
    static Logger log = Logger.getLogger(LoginServlet.class);
    static UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        User user = userDao.read((String) req.getSession().getAttribute("username"));
        req.setAttribute("session_user", user);
        List<User> userList = userDao.getAll();
        req.setAttribute("users", userList);
        req.getServletContext().getRequestDispatcher("/userlist.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> userList = userDao.getAll();
        req.setAttribute("users", userList);
        log.info("Зашел в update");
        String role = req.getParameter("role");
        String id = req.getParameter("id");
        User result = userDao.read(Integer.valueOf(id));
        result.setRole(role);
        userDao.update(result);
        log.info("Update user's role");
        resp.sendRedirect("/userlist");  // не отрабатывает
    }
}
