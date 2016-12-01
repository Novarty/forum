package Servlets;

import dao.DaoFactory;
import dao.TopicDao;
import dao.UserDao;
import org.apache.log4j.Logger;
import pojo.Topic;
import pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Артем on 15.11.2016.
 */
@WebServlet ("/createTopic")
public class CreateTopic extends HttpServlet{
    static TopicDao topicDao = DaoFactory.getDAOFactory(1).getTopicDao();
    static UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();
    Logger log = Logger.getLogger(CreateTopic.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        int topicId = Integer.valueOf(req.getParameter("id"));
        req.setAttribute("topicId",topicId);
        String referer = req.getHeader("Referer");
        req.setAttribute("referer",referer);
//        int forumId = Integer.valueOf(req.getParameter("id"));
//        log.info("сняли параметр");
//        req.setAttribute("forum_id",forumId);
        log.info("положили");
        req.getRequestDispatcher("/createTopic.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        int topicId = Integer.valueOf(req.getParameter("id"));
        req.setAttribute("topicId",topicId);
//        int forumId = Integer.valueOf(req.getParameter("id"));
//        req.setAttribute("forum_id",forumId);
        log.info("doPost положили параметр forumId");
        Topic topic = new Topic();
        topic.setForum_id(topicId);
        topic.setTitleOfTopic(req.getParameter("name"));
        topic.setMessage(req.getParameter("description"));
        topic.setMessageOfTopic(req.getParameter("text"));
        topic.setAuthorOfMessage((String) req.getSession().getAttribute("username"));
        try {
            topicDao.createTopic(topic);
            log.info("Create topic succeed");
            User user = userDao.read((String) req.getSession().getAttribute("username"));
            user.setCountOfTopics(1);
            userDao.update(user);
            resp.sendRedirect("/main"); //Как его перекинуть на /topic?id=topicID ???
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Create message failed");
            req.getRequestDispatcher("/createMessage.jsp").forward(req, resp);
        }
    }
}
