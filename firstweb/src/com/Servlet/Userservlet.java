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
    //����jsp��ת��servlet��ʱ������ִ��service���������Ƕ���
    protected void service(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException
    {
        req.setCharacterEncoding("utf-8");//�����ַ�������������
        //��ȡjsp������Ҫ���еĲ�����
        String method = req.getParameter("method");
        if(method.equals("login"))//ת��login����
        {
            login(req,resp);
        }
    }
    protected void login(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException
    {
        req.setCharacterEncoding("utf-8");
        String username = req.getParameter("username1");//��ȡjsp�����username1��password1��ֵ
        String password = req.getParameter("password1");
    }

}