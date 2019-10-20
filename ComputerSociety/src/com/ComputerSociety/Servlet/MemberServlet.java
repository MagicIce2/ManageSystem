package com.ComputerSociety.Servlet;

import com.ComputerSociety.DAO.Implements.MemberDAOJdbcImpl;
import com.ComputerSociety.DAO.MemberDAO;
import com.ComputerSociety.Domain.MemDim;
import com.ComputerSociety.Domain.Member;
import com.Utils.ExcelUtils.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.List;

/**
 * 反射调用方法，后台数据的各种操作
 */

public class MemberServlet extends HttpServlet {

    MemberDAO memberDAO = new MemberDAOJdbcImpl();

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

    //注册
    private void append(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String stuNo = request.getParameter("stuNo");
        String stuPassword = request.getParameter("stuPassword");
        String stuDepart = request.getParameter("stuDepart");
        String stuClass = request.getParameter("stuClass");
        String stuSex = request.getParameter("stuSex");
        String stuName = request.getParameter("stuName");
        String stuPhone = request.getParameter("stuPhone");
        String stuQQ = request.getParameter("stuQQ");
        String stuMe = request.getParameter("stuMe");
        String year = request.getParameter("year");
        String month = request.getParameter("mounth");
        String day = request.getParameter("day");
        String birthday = year + "-" + month + "-" + day;

        long count = memberDAO.getCountWithName(stuNo);
        if (count > 0){
            request.setAttribute("message", "学号重复，请检查学号是否有错误，若没有错误，请直接登录");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        Member member = new Member(stuNo, stuDepart, stuClass, stuName, stuPhone, stuSex, stuQQ, stuPassword, birthday, stuMe);
        //System.out.println( member);
        memberDAO.save(member);

        response.sendRedirect("pay.jsp");
    }


    //后台查询
    private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String stuNo = request.getParameter("stuNo");
        String stuDepart = request.getParameter("stuDepart");
        String stuClass = request.getParameter("stuClass");
        String stuName = request.getParameter("stuName");
        String stuPhone = request.getParameter("stuPhone");
        String stuSex = request.getParameter("stuSex");
        String stuQQ = request.getParameter("stuQQ");
        String stuMoney = request.getParameter("money");

        MemDim member = new MemDim(stuDepart, stuClass, stuNo, stuName, stuPhone, stuSex, stuQQ, stuMoney);
        //System.out.println(member);
        List<Member> members = memberDAO.getInfo(member);
        //System.out.println(members);
        request.setAttribute("members", members);
        request.setAttribute("size", members.size());
        request.getRequestDispatcher("societyinfo.jsp").forward(request, response);
    }

    private void exportExcel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        MemberDAO MemberDAO = new MemberDAOJdbcImpl();
        //获取数据
        List<Member> list = memberDAO.getAll();

        //excel标题
        String[] title = {"序号","学号","院系","班级","姓名","手机号","性别","QQ","密码","出生日期","是否已缴费","自我介绍"};

        //excel文件名
        String fileName = "学生信息表"+System.currentTimeMillis()+".xls";

        //sheet名
        String sheetName = "学生信息表";
        String [][] content = new String[list.size()][title.length];

        for (int i = 0; i < list.size(); i++) {
            content[i][0] = String.valueOf(list.get(i).getId());
            content[i][1] = list.get(i).getStuNo();
            content[i][2] = list.get(i).getStuDepart();
            content[i][3] = list.get(i).getStuClass();
            content[i][4] = list.get(i).getStuName();
            content[i][5] = list.get(i).getStuPhone();
            content[i][6] = list.get(i).getStuSex();
            content[i][7] = list.get(i).getStuQQ();
            content[i][8] = list.get(i).getStuPassword();
            content[i][9] = list.get(i).getStuBirthday();
            content[i][10] = list.get(i).getMoney();
            content[i][11] = list.get(i).getStuMe();
        }

        //创建HSSFWorkbook
        HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);

        //响应到客户端
        try {
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //发送响应流方法
    public void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            try {
                fileName = new String(fileName.getBytes(),"ISO8859-1");
            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            response.setContentType("application/octet-stream;charset=ISO8859-1");
            response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //修改跳转
    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String forwardPath = "error.jsp";

        String idstr = request.getParameter("id");

        try {
            Member member = memberDAO.getMember(Integer.parseInt(idstr));
            if (member != null){
                forwardPath = "update_society.jsp";
                request.setAttribute("member", member);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher(forwardPath).forward(request, response);
    }

    //后台修改
    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("id");
        String oldNo = request.getParameter("oldNo");
        String stuNo = request.getParameter("stuNo");
        String stuSex = request.getParameter("stuSex");
        String stuDepart = request.getParameter("stuDepart");
        String stuClass = request.getParameter("stuClass");
        String stuName = request.getParameter("stuName");
        String stuPhone = request.getParameter("stuPhone");
        String stuQQ = request.getParameter("stuQQ");
        String stuPassword = request.getParameter("stuPassword");

        if (!oldNo.equals(stuNo)){
            long count = memberDAO.getCountWithName(stuNo);
            if(count > 0){
                request.setAttribute("msg", stuNo + "已存在，请检查学号是否正确，若没有错误，请直接进行登录！");
                request.getRequestDispatcher("update_society.jsp").forward(request, response);
                return;
            }
        }
        Member member = new Member();
        member.setId(Integer.parseInt(id));
        member.setStuNo(stuNo);
        member.setStuSex(stuSex);
        member.setStuDepart(stuDepart);
        member.setStuClass(stuClass);
        member.setStuName(stuName);
        member.setStuPhone(stuPhone);
        member.setStuQQ(stuQQ);
        member.setStuPassword(stuPassword);

        memberDAO.update(member);
        response.sendRedirect("query.cm");

    }

    //后台删除
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String idStr = request.getParameter("id");
        int id = 0;
        try {
            id = Integer.parseInt(idStr);
            memberDAO.delete(id);
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("delete success!");
            out.flush();
            out.close();
        } catch (NumberFormatException e) {}
    }

    /*
    private void DataSave(HttpServletRequest request, HttpServletResponse response, String username, String password) {
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        session.setMaxInactiveInterval(60 * 30);
        Cookie cookie = new Cookie("memberInfo", session.getId());
        cookie.setMaxAge(60 * 30);
        response.addCookie(cookie);
    }

    private void Check_Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String username = request.getParameter("stuNologin");
        String password = request.getParameter("stuPasswordlogin");
        if (username.equals("admin") && password.equals("computerSociety")){
            DataSave(request, response, username, password);
            request.getRequestDispatcher("societyinfo.jsp").forward(request, response);
            return;
        }else if (username.equals("admin") && password.equals("SignSystem")){
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
    }*/
}
