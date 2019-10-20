package com.Filter.Login;


import com.session.MySessionContext;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * 权限过滤器，普通注册成员拥有下载资料的权限和查看前端的权限
 *              管理员拥有一切权限，
 *              没有注册，或不是社团的成员，没有下载资料的权限。
 */


public class AutherFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        Cookie [] cookies = request.getCookies();
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
                            return;
                        }
                    }
                }
            }
        }
        response.sendRedirect("index.jsp");
    }
}
