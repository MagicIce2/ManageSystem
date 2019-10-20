package com.society.computer.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.society.computer.entity.Department;
import com.society.computer.entity.Duty;
import com.society.computer.entity.MemberIntro;
import com.society.computer.service.DepartmentService;
import com.society.computer.service.DutyService;
import com.society.computer.service.MemberIntroService;
import com.society.computer.service.MemberService;
import com.society.computer.utils.LogUtil;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.*;
import java.util.List;

@Controller
@Scope("prototype")
@ParentPackage("json-default")
@Namespace("/jsp")
public class MemberIntroAction extends ActionSupport implements ModelDriven<MemberIntro> {

    private MemberIntro memberIntroModel = new MemberIntro();
    private MemberIntro memberintro = new MemberIntro();
    @Autowired
    private MemberIntroService memberIntroService;
    @Autowired
    private DutyService dutyService;
    @Autowired
    private DepartmentService departmentService;
    private List<MemberIntro> memberIntros;
    private List<Duty> duties;
    private List<Department> departments;

    public List<Department> getDepartments() {
        return departments;
    }

    public List<Duty> getDuties() {
        return duties;
    }

    public List<MemberIntro> getMemberIntros() {
        return memberIntros;
    }

    public MemberIntro getMemberintro() {
        return memberintro;
    }

    @Override
    public MemberIntro getModel() {
        return memberIntroModel;
    }

    /**
     * 成员简介页面
     * @return
     */
    @Action(value = "memberIntroduction", results = {@Result(name = "memberIntroduction", location = "/WEB-INF/jsp/clubMemIntro.jsp")})
    public String memberIntroduction(){
        memberIntros = memberIntroService.findAll();
        return "memberIntroduction";
    }

    /**
     * 查找所有成员信息
     * @return
     */
    @Action(value = "memberintro_findAll", results = {@Result(name = "milist",type="redirectAction", location = "memberIntroduction")})
    public String memberintro_findAll(){
        memberIntros = memberIntroService.findAll();
        return "milist";
    }

    /**
     * 后台成员简介管理
     * @return
     */
    @Action(value = "memberIntroAdmin", results = {@Result(name = "memberIntroAdmin", location = "/WEB-INF/jsp/adminMemberIntro.jsp")})
    public String memberIntroAdmin(){
        memberIntros = memberIntroService.findAll();
        duties = dutyService.findAll();
        departments = departmentService.findAll();
        return "memberIntroAdmin";
    }

    /**
     * 后台根据 id 获取对象，返回json数据
     * @return
     */
    @Action(value = "memberIntro_getById", results = {@Result(type = "json", params = {"root", "memberintro"})})
    public String getById(){
        LogUtil.debug(memberIntroModel.toString());
        memberintro = memberIntroService.getById(memberIntroModel.getStaffId());
        return SUCCESS;
    }

    /**
     * 添加成员简介信息
     * @return
     * @throws Exception
     */
    @Action(value = "memberIntro_save", results = {@Result(name = SUCCESS, type = "redirectAction", location = "memberIntroAdmin")})
    public String save() throws Exception {
        memberIntroService.save(memberIntroModel);
        LogUtil.debug(memberIntroModel.toString());
//        LogUtil.debug(staffPicture1.getName());
        return SUCCESS;
    }

    /**
     * 删除成员简介信息
     * @return
     */
    @Action(value = "memberIntro_delete", results = {@Result(type = "json")})
    public String delete(){
        memberIntroService.delete(memberIntroModel);
        return SUCCESS;
    }

    /**
     * 更新数据
     * @return
     */
    @Action(value = "memberIntro_update", results = {@Result(type = "json")})
    public String update(){
        memberIntroService.update(memberIntroModel);
        return SUCCESS;
    }
}
