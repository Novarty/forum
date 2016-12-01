package Servlets;

import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Created by Артем on 09.11.2016.
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    static Logger log = Logger.getLogger(LogoutServlet.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.getSession().removeAttribute("user");
        req.getSession().invalidate();
        Cookie cookie = null;
        Cookie[] cookies = null;
        // Get an array of Cookies associated with this domain
        cookies = req.getCookies();
        for (Cookie c : cookies){
            if (c.getName().equals("login")) {
                c.setMaxAge(0);
                resp.addCookie(c);
                break;
            }
            else {
                log.info("No cookies founds");
            }
        }
        resp.sendRedirect("/main");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.getSession().removeAttribute("user");
        req.getSession().invalidate();
        log.info("'user' removed");
        resp.sendRedirect("/main");
    }
}
