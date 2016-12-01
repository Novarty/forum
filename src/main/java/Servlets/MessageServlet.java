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
 * Created by Артем on 14.11.2016.
 */
@WebServlet("/topic")
public class MessageServlet extends HttpServlet {
    static Logger log = Logger.getLogger(LoginServlet.class);
    static TopicDao topicDao = DaoFactory.getDAOFactory(1).getTopicDao();
    static MessageDao messageDao = DaoFactory.getDAOFactory(1).getMessageDao();
    static ForumDao forumDao = DaoFactory.getDAOFactory(1).getForumDao();
    static UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();

//    protected void doServlet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        int topicId = Integer.valueOf(req.getParameter("id"));//извлекаем пареметр id с URL
        Topic topic = topicDao.getTopicById(topicId); // извлекаем конкретный топик (тему)
        Forum forum = forumDao.getForumById(topic.getForum_id());
        List<Message> messageList = messageDao.getAllMessages(topic); //сообщения топика с topicId
        List<Forum> forumList = forumDao.getAllForums(); // для вывода списка форумов

        Message message = messageDao.getMessageById(topicId); // вытаскиваем сообщения, принадлежащие данному топику
        req.setAttribute("topic", topic);
        req.setAttribute("messageList", messageList);
        req.setAttribute("forums", forumList);
        req.setAttribute("forum", forum);
        req.getServletContext().getRequestDispatcher("/topic.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("mid");
        String username = req.getParameter("name");
        Message message = messageDao.getMessageById(Integer.valueOf(id));
        messageDao.deleteMessage(message, Integer.valueOf(id), username);
        log.info("Удалено");
        User user = userDao.read(username); // уменьшаем счетчик сообщений пользователя на 1
        user.setCountOfMessages(-1);
        userDao.update(user);
        resp.sendRedirect("/topic?id=" + req.getParameter("id")); // редиректит,но отображаются изменения только через F5 //WTF?
    }
}
