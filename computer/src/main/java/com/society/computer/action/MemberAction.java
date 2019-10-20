package com.society.computer.action;

import com.cpjit.swagger4j.annotation.API;
import com.cpjit.swagger4j.annotation.APIs;
import com.cpjit.swagger4j.annotation.Param;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.society.computer.entity.Department;
import com.society.computer.entity.Member;
import com.society.computer.service.DepartmentService;
import com.society.computer.service.MemberService;
import com.society.computer.utils.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@Scope("prototype")
@ParentPackage("json-default")
@Namespace("/jsp")
@APIs("/demo")
@RequestMapping("/demo")
public class MemberAction extends ActionSupport implements ModelDriven<Member>{

    private Member memberModel = new Member();
    @Autowired
    private MemberService memberService;
    @Autowired
    private DepartmentService departmentService;

    private String year;
    private String month;
    private String day;

    public void setYear(String year) {
        this.year = year;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public void setDay(String day) {
        this.day = day;
    }

    private List<Member> members;
    private Member member;
    private List<Department> departments;

    public List<Member> getMembers() {
        return members;
    }
    public List<Department> getDepartments() {
        return departments;
    }
    public Member getMember() {
        return member;
    }

    HttpSession session = ServletActionContext.getRequest().getSession();


    /**
     * 后台数据查询操作
     * @return
     */
//    @ApiImplicitParam(paramType = "member", name = "", value = "", required = false)
    @API(value = "member_findAll", summary = "可进行模糊查询", parameters = {
            @Param(name="username", description="用户名", type="string"),
    })
    @RequestMapping(value = "member_findAll", method = RequestMethod.GET)
    @Action(value = "member_findAll", results = {@Result(name = "list", location = "/WEB-INF/jsp/societyinfo.jsp")})
    public String findAll(){
        DetachedCriteria dc = DetachedCriteria.forClass(Member.class);
        if (!"".equals(memberModel.getStuDepart()) && memberModel.getStuDepart() != null){
            dc.add(Restrictions.like("stuDepart", "%" + memberModel.getStuDepart() + "%"));
        }
        if (!"".equals(memberModel.getStuClass()) && memberModel.getStuClass() != null){
            dc.add(Restrictions.like("stuClass", "%" + memberModel.getStuClass() + "%"));
        }
        if (!"".equals(memberModel.getStuNo()) && memberModel.getStuNo() != null){
            dc.add(Restrictions.like("stuNo", "%" + memberModel.getStuNo() + "%"));
        }
        if (!"".equals(memberModel.getStuName()) && memberModel.getStuName() != null){
            dc.add(Restrictions.like("stuName", "%" + memberModel.getStuName() + "%"));
        }
        if (!"".equals(memberModel.getStuPhone()) && memberModel.getStuPhone() != null){
            dc.add(Restrictions.like("stuPhone", "%" + memberModel.getStuPhone() + "%"));
        }
        if (!"".equals(memberModel.getStuSex()) && memberModel.getStuSex() != null){
            dc.add(Restrictions.like("stuSex", "%" + memberModel.getStuSex() + "%"));
        }
        if (!"".equals(memberModel.getStuQQ()) && memberModel.getStuQQ() != null){
            dc.add(Restrictions.like("stuQQ", "%" + memberModel.getStuQQ() + "%"));
        }
        if (!"".equals(memberModel.getMoney()) && memberModel.getMoney() != null) {
            dc.add(Restrictions.like("Money", "%" + memberModel.getMoney() + "%"));
        }
        dc.add(Restrictions.eq("del", false));
        members = memberService.findAll(dc);
        session.setAttribute("size", members.size());
        //System.out.println(members.size());
        return "list";
    }

    /**
     * 进入注册页面
     * @return
     */
    @Action(value = "register", results = {@Result(name = "register", location = "/WEB-INF/jsp/register.jsp")})
    public String register(){
        departments = departmentService.findAll();
        return "register";
    }

    /**
     * 注册完成页面，数据保存，并进入支付页面
     * @return
     */
    @Action(value = "member_save", results = {@Result(name = "msave", location = "/WEB-INF/jsp/pay.jsp")})
    public String save(){
//        System.out.println(memberModel);
        memberModel.setStuBirthday(year + "-" +  month + "-" + day);
        memberModel.setDel(false);
        memberModel.setAuthor(3);
        memberModel.setMoney("0");
        memberService.save(memberModel);
        return "msave";
    }

    /**
     * 登录页面跳转
     * @return
     */
    @Action(value = "login", results = {@Result(name = LOGIN, location = "/WEB-INF/jsp/login.jsp")})
    public String login(){
        return LOGIN;
    }

    /**
     * 登录接口
     * @return
     */
    @Action(value = "member_signin", results = {@Result(name = "signin", location = "/WEB-INF/jsp/login.jsp"),
                                                @Result(name = "index", location = "index", type = "redirectAction")})
    public String signin(){
        System.out.println(memberModel);
        int flag = memberService.judgeLogin(memberModel);
//        System.out.println(flag);
        if(flag == 0){
            session.setAttribute("username", memberModel.getStuNo());
            session.setAttribute("password", memberModel.getStuPassword());
            session.setMaxInactiveInterval(60 * 30);
            Cookie cookie = new Cookie("memberInfo", session.getId());
            cookie.setMaxAge(60 * 30);
            ServletActionContext.getResponse().addCookie(cookie);
            return "index";
        }else if (flag == 1){
            session.setAttribute("msg", "账户不存在");
        }else if (flag == 2){
            session.setAttribute("msg", "密码错误");
        }else if (flag == 3){
            session.setAttribute("msg", "账户被禁用");
        }
        Cookie cookie = new Cookie("memberInfo", session.getId());
        cookie.setMaxAge(60 * 30);
        ServletActionContext.getResponse().addCookie(cookie);
        return "signin";
    }

    /**
     * 修改个人信息页面
     * @return
     */
    @Action(value = "member_edit", results = {@Result(name = "edit", location = "/WEB-INF/jsp/update_society.jsp")})
    public String edit(){
        member = memberService.getByIdMember(memberModel.getId());
        return "edit";
    }

    /**
     * 个人信息修改页面
     * @return
     */
    @Action(value = "update", results = {@Result(name = "update", type = "redirectAction", location = "member_findAll")})
    public String update(){
        memberModel.setStuBirthday(year + "-" +  month + "-" + day);
        memberService.update(memberModel);
        return "update";
    }

    /**
     * 成员删除，传入id,因为使用ajax删除，所以改为json格式
     * @return
     */
    @Action(value = "member_delete", results = {@Result(name = "delete", type = "json")})
    public String delete(){
        //System.out.println(memberModel.getId());
        memberService.delete(memberModel);
        return "delete";
    }

    /**
     * 导出数据操作
     * @return
     */
    @Action(value = "member_exportExcel", results = {@Result(name = SUCCESS, type = "json")})
    public String exportExcel(){
        members = memberService.findAll();
        String[] title = {"序号","学号","院系","班级","姓名","手机号","性别","QQ","密码","出生日期","是否已缴费","自我介绍"};
        String fileName = "学生信息表"+System.currentTimeMillis()+".xls";
        String sheetName = "学生信息表";
        String [][] content = new String[members.size()][title.length];
        for (int i = 0; i < members.size(); i++) {
            content[i][0] = String.valueOf(members.get(i).getId());
            content[i][1] = members.get(i).getStuNo();
            content[i][2] = members.get(i).getStuDepart();
            content[i][3] = members.get(i).getStuClass();
            content[i][4] = members.get(i).getStuName();
            content[i][5] = members.get(i).getStuPhone();
            content[i][6] = members.get(i).getStuSex();
            content[i][7] = members.get(i).getStuQQ();
            content[i][8] = members.get(i).getStuPassword();
            content[i][9] = members.get(i).getStuBirthday();
            content[i][10] = members.get(i).getMoney();
            content[i][11] = members.get(i).getStuMe();
        }
        //创建HSSFWorkbook
        HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);
        try {
            HttpServletResponse response = ServletActionContext.getResponse();
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
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

    @Override
    public Member getModel() {
        return memberModel;
    }
}
