package com.ComputerSociety.Servlet;

import com.ComputerSociety.DAO.StudentDAO;
import com.ComputerSociety.DAO.Impl.StudentDAOkdbcImpl;
import com.ComputerSociety.Domain.Student;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

public class StudentServlet extends HttpServlet {

    StudentDAO studentDAO = new StudentDAOkdbcImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String servletPath = req.getServletPath();
        String methodName = servletPath.substring(1,servletPath.length()-3);
        try {
            Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void query(HttpServletRequest request, HttpServletResponse response, String stuDepart) throws ServletException, IOException {
        List<Student> students = studentDAO.getinfo(stuDepart);
        request.setAttribute("students", students);
        request.getRequestDispatcher("bgdata.jsp").forward(request, response);
    }

    private void append(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String stuDepart = request.getParameter("stuDepart");
        String stuClass = request.getParameter("stuClass");
        String stuName = request.getParameter("stuName");

        long count = studentDAO.getCountWithName(stuName);
        if(count > 0){
            request.setAttribute("message", stuName + "已经签到，请不要重复签到！");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        Student student = new Student(stuDepart, stuClass, stuName);
        studentDAO.save(student);

        HttpSession session = request.getSession();
        session.setAttribute("stuName", stuName);
        session.setAttribute("stuClass", stuClass);
        session.setAttribute("stuDepart",stuDepart);
        session.setMaxInactiveInterval(60*30);
        Cookie cookie = new Cookie("StuInfo", session.getId());
        cookie.setMaxAge(60*30);
        response.addCookie(cookie);

//        Cookie cookieDepart = new Cookie("depart",stuDepart);
//        Cookie cookieClass = new Cookie("class",stuClass);
//        Cookie cookieName = new Cookie("name",stuName);
//        cookieDepart.setMaxAge(60*30);
//        cookieClass.setMaxAge(60*30);
//        cookieName.setMaxAge(60*30);
//        response.addCookie(cookieDepart);
//        response.addCookie(cookieClass);
//        response.addCookie(cookieName);

        response.sendRedirect("success.jsp");

    }

    private void export(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String stuDepart = request.getParameter("stuDepart");
        String title = request.getParameter("title");
        String head = request.getParameter("head");
        String tile = request.getParameter("tile");
        String name = request.getParameter("query");
        if (name.equals("导出数据")){
            exportData(response, stuDepart, title, head, tile);
        }else if(name.equals("查看数据")){
            query(request,response,stuDepart);
        }else{
            clear(response);
        }

        //request.setAttribute("stuNameInfo", title + head + stuDepart + Information + tile);
        //request.getRequestDispatcher("/show.jsp").forward(request, response);
    }
    private void clear(HttpServletResponse response) throws IOException {
        studentDAO.clear();
        response.sendRedirect("bgdata.jsp");
    }

    private void exportData(HttpServletResponse response, String stuDepart, String title, String head, String tile) throws IOException {
        String  Information =  studentDAO.getInfo(stuDepart);

        response.setContentType("application/msword;charset=GB2312");
        response.getWriter().write(title + head + stuDepart + Information + tile);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /**
         * 删除操作
         *      超链接：delete.do?id=<%= student.getId() %>
         *      Servlet的 delete 方法
         *          获取id
         *          调用 DAO 执行删除
         *          重定向到 query.do (若目标页面不需要读取当前请求的 request 属性，就可以使用重定向)，将显示删除后的 Student 的List
         *      JSP 上的 jQuery 提示
         *          确定要删除 xx 的信息吗？
         */
        req.setCharacterEncoding("utf-8");
        String idStr = req.getParameter("id");
        int id = 0;
        //System.out.println(idStr);

        //try ... catch 的作用：防止 idStr 不能转为 int 类型
        //若不能转则 id = 0，无法进行任何的删除操作。
        try {
            id = Integer.parseInt(idStr);
            studentDAO.delete(id);
        } catch (NumberFormatException e) {}

        resp.sendRedirect("bgdata.jsp");
    }

}
