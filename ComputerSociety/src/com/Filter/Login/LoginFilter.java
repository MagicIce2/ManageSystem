package com.Filter.Login;

import com.ComputerSociety.DAO.Implements.MemberDAOJdbcImpl;
import com.ComputerSociety.DAO.MemberDAO;
import com.session.MySessionContext;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * 登录过滤器，检查是否拥有不同的权限
 *
 * */

public class LoginFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        Cookie [] cookies = request.getCookies();
        if (Judge_Auther(request, response, chain, cookies)) return;
        String username = request.getParameter("stuNologin");
        String password = request.getParameter("stuPasswordlogin");
        if (username.equals("admin") && password.equalsIgnoreCase("computerSociety")){
            DataSave(request, response, username, password);
            request.getRequestDispatcher("societyinfo.jsp").forward(request, response);
            return;
        }else if (username.equals("admin") && password.equalsIgnoreCase("SignSystem")){
            DataSave(request, response, username, password);
            request.getRequestDispatcher("bgdata.jsp").forward(request, response);
            return ;
        }
        MemberDAO memberDAO = new MemberDAOJdbcImpl();
        if(memberDAO.getCountValue(username, password) == 1){
            DataSave(request, response, username, password);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }else{
            request.setAttribute("msg", "用户名或密码错误");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
    }

    private boolean Judge_Auther(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Cookie[] cookies) throws IOException, ServletException {
        if(cookies != null) {
            for (Cookie cookie:cookies){
                //System.out.println("");
                if (cookie.getName().equals("memberInfo")){
                    MySessionContext mySessionContext = MySessionContext.getInstance();
                    HttpSession session1 = mySessionContext.getSession(cookie.getValue());
                    //System.out.println(session1);
                    if (session1 != null){
                        //System.out.println(session1.getAttribute("username"));
                        if (session1.getAttribute("username").equals("admin")){
                            chain.doFilter(request, response);
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    private void DataSave(HttpServletRequest request, HttpServletResponse response, String username, String password) {
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        session.setMaxInactiveInterval(60 * 30);
        Cookie cookie = new Cookie("memberInfo", session.getId());
        cookie.setMaxAge(60 * 30);
        response.addCookie(cookie);
    }
}
