package Servlets;

import dao.DaoFactory;
import dao.ForumDao;
import org.apache.log4j.Logger;
import pojo.Forum;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Артем on 13.11.2016.
 */
@WebServlet ("/createForum")
public class CreateForumServlet extends HttpServlet {
    Logger log = Logger.getLogger(CreateForumServlet.class);
    static ForumDao forumDao = DaoFactory.getDAOFactory(1).getForumDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.getRequestDispatcher("/createForum.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        Forum forum = new Forum();
        forum.setNameOfForum(req.getParameter("name"));
        forum.setDescriptionOfForum(req.getParameter("description"));

        try {
            forumDao.createForum(forum);
            log.info("Create " + forum.getNameOfForum() + " succeed");
            resp.sendRedirect("/main");
        }catch (Exception e){
            log.error("Create " + forum.getNameOfForum() + " failed");
            req.getRequestDispatcher("/createForum.jsp").forward(req, resp);
        }
    }
}
