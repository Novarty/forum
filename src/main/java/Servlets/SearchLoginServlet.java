package Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import dao.DaoFactory;
import dao.UserDao;
import org.json.simple.JSONObject;
import pojo.User;

/**
 * Created by Артем on 13.11.2016.
 */
@WebServlet ("/searchLogin")
public class SearchLoginServlet extends HttpServlet {
    public static UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doServlet(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doServlet(req,resp);
    }
    protected void doServlet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String username=req.getParameter("j_username");
        PrintWriter pw = resp.getWriter();
        User result=userDao.read(username);
        if (result != null){
            pw.write("Username is already used");
        }
    }
}
