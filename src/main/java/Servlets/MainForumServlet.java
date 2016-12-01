package Servlets;

import dao.DaoFactory;
import dao.ForumDao;
import dao.MySQLForumDao;
import org.apache.log4j.Logger;
import pojo.Forum;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Артем on 11.11.2016.
 */
@WebServlet("/main")
public class MainForumServlet extends HttpServlet {
    static Logger log = Logger.getLogger(MainForumServlet.class);
    static ForumDao forumDao = DaoFactory.getDAOFactory(1).getForumDao();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        List<Forum> forumList = forumDao.getAllForums();
        req.setAttribute("forums", forumList);
        req.getServletContext().getRequestDispatcher("/main.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/main");
    }
}
