package Servlets;

import dao.DaoFactory;
import dao.MessageDao;
import dao.UserDao;
import org.apache.log4j.Logger;
import pojo.Message;
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
@WebServlet ("/createMessage")
public class CreateMessage extends HttpServlet {
    static MessageDao messageDao = DaoFactory.getDAOFactory(1).getMessageDao();
    static UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();
    Logger log = Logger.getLogger(CreateMessage.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        int topicId = Integer.valueOf(req.getParameter("id"));
        String referer = req.getHeader("Referer");
        req.setAttribute("referer",referer);
        req.getRequestDispatcher("/createMessage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        int topicId = Integer.valueOf(req.getParameter("id"));
        req.setAttribute("topicId",topicId);
        String username = (String) req.getSession().getAttribute("username");
        Message message = new Message();
        message.setMessage(req.getParameter("name"));
        message.setAuthorOfMessage(username);
        log.info("setAuthor отработало");
        message.setTopic_id(topicId);
        try {
            messageDao.createMessage(message);
            log.info("Create message succeed");
            User user = userDao.read(username);
            user.setCountOfMessages(1);
            userDao.update(user);
            resp.sendRedirect("/main"); //Как его перекинуть на /topic?id=topicID ???
        }catch (Exception e){
            log.error("Create message failed");
            req.setAttribute("error", "Create message failed");
            req.getRequestDispatcher("/createMessage.jsp").include(req, resp);
        }
    }
}
