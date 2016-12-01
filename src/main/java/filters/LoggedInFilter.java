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
 * Created by Артем on 04.11.2016.
 */
@WebFilter(filterName = "loggedInFilter", urlPatterns = {"/registration", "/registration.jsp", "/login", "/login.jsp","/registration#", "/login#"})
public class LoggedInFilter implements Filter {
    static Logger log = Logger.getLogger(LoggedInFilter.class);
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
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
        if (httpRequest.getSession().getAttribute("user") == null) {
            chain.doFilter(request, response);
        } else {
            log.info("Filter: User have registrated and redirected to /main.jsp");
            ((HttpServletResponse) response).sendRedirect("/main");
        }
    }

    @Override
    public void destroy() {

    }
}