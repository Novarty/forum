package filters;

import dao.DaoFactory;
import dao.UserDao;
import org.apache.log4j.Logger;
import pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Артем on 18.11.2016.
 */
@WebFilter ("/userlist")
public class UserlistFilter implements Filter {
    static Logger log = Logger.getLogger(UserlistFilter.class);
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) req;
        HttpServletResponse httpResponse = (HttpServletResponse) resp;
        String userName = null;
        UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();
        Cookie[] cookies = httpRequest.getCookies();
        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("login")) userName = cookie.getValue();
            }
            log.info(userName);
            if (userName != null){
                User sessionUser = userDao.read(userName);
                String role = sessionUser.getRole();
                String username = sessionUser.getUsername();
                if (httpRequest.getSession().getAttribute("user") == null){
                    httpRequest.getSession().setAttribute("user",sessionUser);
                }
                if (httpRequest.getSession().getAttribute("role") == null){
                    httpRequest.getSession().setAttribute("role", role);
                }
                if (httpRequest.getSession().getAttribute("username")==null){
                    httpRequest.getSession().setAttribute("username", username);
                }
                log.info("user exist");
            }
        }
        if (httpRequest.getSession().getAttribute("user") != null){
            log.info("user exist");
            if ((httpRequest.getSession().getAttribute("role").equals("ADMIN"))
                    ||(httpRequest.getSession().getAttribute("role").equals("MODERATOR"))){
                chain.doFilter(req, resp);
            }
        } else {
            log.info("Filter: User not admin or moderator and redirected to /login.jsp");
            httpResponse.sendRedirect("/login");
        }
    }

    @Override
    public void destroy() {

    }
}
