package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.Userdao;

@SuppressWarnings("serial")
public class Userservlet extends HttpServlet
{
    //当从jsp跳转到servlet类时，首先执行service函数（这是定理）
    protected void service(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException
    {
        req.setCharacterEncoding("utf-8");//设置字符集，避免乱码
        //获取jsp界面需要进行的操作，
        String method = req.getParameter("method");
        if(method.equals("login"))//转到login函数
        {
            login(req,resp);
        }
    }
    protected void login(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException
    {
        req.setCharacterEncoding("utf-8");
        String username = req.getParameter("username1");//获取jsp界面的username1和password1的值
        String password = req.getParameter("password1");
    }

}