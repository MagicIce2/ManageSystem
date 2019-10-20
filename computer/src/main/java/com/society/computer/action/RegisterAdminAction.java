package com.society.computer.action;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/jsp")
public class RegisterAdminAction {

    HttpSession session = ServletActionContext.getRequest().getSession();


    /**
     * 后台登录页面
     * @return
     */
    @Action(value = "admin", results = {@Result(name = "admin", location = "/WEB-INF/jsp/admin.jsp"),
                                        @Result(name = "login", type = "redirectAction", location = "login")})
    public String admin(){
        if ("admin".equals(session.getAttribute("username"))){
            return "admin";
        }else{
            session.setAttribute("msg", "你没有权限!");
            return "login";
        }
    }

    /**
     * 后台框架的列表部分
     * @return
     */
    @Action(value = "adminleft", results = {@Result(name = "left", location = "/WEB-INF/jsp/adminleft.jsp")})
    public String adminleft(){
        return "left";
    }
}
