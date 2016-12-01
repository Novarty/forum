package Servlets;

import dao.*;
import org.apache.log4j.Logger;
import pojo.Forum;
import pojo.Message;
import pojo.Topic;
import pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Артем on 12.11.2016.
 */
@WebServlet ("/forum")
public class TopicsServlet extends HttpServlet {
    static Logger log = Logger.getLogger(LoginServlet.class);
    static TopicDao topicDao = DaoFactory.getDAOFactory(1).getTopicDao();
    static ForumDao forumDao = DaoFactory.getDAOFactory(1).getForumDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        int forumId = Integer.valueOf(req.getParameter("id"));//извлекаем параметр id с URL
        Forum forum = forumDao.getForumById(forumId); // вытаскиваем данные топика с номером id из URL
        List<Forum> forumList = forumDao.getAllForums();
        List<Topic> topicList = topicDao.getAllTopics(forum);
        String forumname = forum.getNameOfForum(); // достаем параметр "forumname"
        req.setAttribute("forumname", forumname );
        req.setAttribute("forumID", forum.getForumID());
        req.setAttribute("topics", topicList);
        req.setAttribute("forums", forumList);
        req.getServletContext().getRequestDispatcher("/index.jsp").forward(req,resp);
    }
}
