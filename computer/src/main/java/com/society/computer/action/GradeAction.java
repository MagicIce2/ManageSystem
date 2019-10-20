package com.society.computer.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.society.computer.entity.Department;
import com.society.computer.entity.Grade;
import com.society.computer.service.GradeService;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Scope("prototype")
@ParentPackage("json-default")
@Namespace("/jsp")
public class GradeAction extends ActionSupport implements ModelDriven<Department> {

    @Autowired
    private GradeService gradeService;
    private Department departmentModel = new Department();
    private List<Grade> grades;

    public List<Grade> getGrades() {
        return grades;
    }

    @Action(value = "gradeByDepart", results = {@Result(type = "json", params = {"root", "grades"})})
    public String gradeByDepart(){
        grades = gradeService.findAll(departmentModel.getId());
        return SUCCESS;
    }

    @Override
    public Department getModel() {
        return departmentModel;
    }
}
