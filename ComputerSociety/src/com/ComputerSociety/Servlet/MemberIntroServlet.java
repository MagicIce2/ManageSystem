package com.ComputerSociety.Servlet;

import com.ComputerSociety.DAO.Implements.MemberIntroDAOImpl;
import com.ComputerSociety.DAO.MemberIntroDAO;
import com.ComputerSociety.Domain.MemberIntro;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

/**
 * 成员简介部分控制层，
 */

public class MemberIntroServlet extends HttpServlet {

    MemberIntroDAO memberIntroDAO = new MemberIntroDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String servletPath = req.getServletPath();
        String methodName = servletPath.substring(1,servletPath.length()-4);
        try {
            Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void getclub(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<MemberIntro> memberIntros = memberIntroDAO.getAll();
        request.setAttribute("memberintro", memberIntros);
        request.getRequestDispatcher("clubMemIntro.jsp").forward(request, response);
    }

}
