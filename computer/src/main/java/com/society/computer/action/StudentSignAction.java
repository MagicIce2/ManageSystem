package com.society.computer.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.society.computer.entity.StudentSign;
import com.society.computer.entity.Terminate;
import com.society.computer.service.StudentSignService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@Scope("prototype")
@ParentPackage("json-default")
@Namespace("/jsp")
public class StudentSignAction extends ActionSupport implements ModelDriven<StudentSign>{

    private StudentSign studentSignModel = new StudentSign();
    @Autowired
    private StudentSignService studentSignService;
    private List<StudentSign> students;
    private Terminate terminate = new Terminate();

    public Terminate getTerminate() {
        return terminate;
    }

    public List<StudentSign> getStudents() {
        return students;
    }

    public StudentSign getStudentSignModel() {
        return studentSignModel;
    }

    /**
     * 进入社团签到后台页面
     * @return
     */
    @Action(value = "signAdmin", results = {@Result(name = "signadmin", location = "/WEB-INF/jsp/bgdata.jsp")})
    public String signAdmin(){
        students = studentSignService.findAll();
        return "signadmin";
    }

    /**
     * 从后台生成的二维码进入签到系统的接口
     * @return
     */
    @Action(value = "signsystem", results = {@Result(name = "signsystem", location = "/WEB-INF/jsp/SignSystem.jsp")})
    public String signsystem(){
        return "signsystem";
    }

    public String save(){
        studentSignService.save(studentSignModel);
        return SUCCESS;
    }

    /**
     * 签到信息保存和签到成功跳转
     * @return
     */
    @Action(value = "signInfo", results = {@Result(name = SUCCESS, location = "/WEB-INF/jsp/success.jsp")})
    public String signInfo(){
        //System.out.println(studentSignModel);
        studentSignService.save(studentSignModel);
        return SUCCESS;
    }

    /**
     * 条件查询
     * @return
     */
    @Action(value = "sign_findAll", results = {@Result(name = SUCCESS, location = "/WEB-INF/jsp/bgdata.jsp")})
    public String findAll(){
        students = studentSignService.findAll(studentSignModel);
        return SUCCESS;
    }

    /**
     * 签到信息删除
     * @return
     */
    @Action(value = "studentsign_delete", results = {@Result(name = SUCCESS, type = "redirectAction",location = "signadmin")})
    public String delete(){
        studentSignService.delete(studentSignModel);
        return SUCCESS;
    }

    /**
     * 签到信息清空
     * @return
     */
    @Action(value = "sign_clear", results = {@Result(name = SUCCESS, type = "json")})
    public String clear(){
        studentSignService.clear();
        return SUCCESS;
    }

    @Action(value = "studentSign_exportData", results = {@Result(name = SUCCESS, location = "/WEB-INF/jsp/showinfo.jsp")})
    public String exportData() throws Exception {
        String head = "兹因计算机社团举办活动需要，时间：（19:00~20:00），地点（二教414），故";
        String footer = "不能正常出勤晚自习，因此给贵部工作带来不便，敬请谅解，并给予销假。";
      /*  String title = "\t\t\t\t\t\t\t\t\t " + "证  明" + "\r\n\t" ;
        List<StudentSign> Information =  studentSignService.findAll(studentSignModel);
        String fileName = studentSignModel.getStuDepart() + ".docx";
        fileName = new String(fileName.getBytes(),"ISO8859-1");
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("application/msword;charset=GB2312");
        response.setHeader("Content-Disposition","attachment;filename="+ fileName);
        response.addHeader("Pargam", "no-cache");
        response.addHeader("Cache-Control", "no-cache");
        String buf = title + head + studentSignModel.getStuDepart() + Information + tile;
        String buf_temp = new String(buf.getBytes(),"GB2312");
        response.getWriter().write(buf_temp);*/
        terminate.setTitle(studentSignModel.getStuDepart());
        terminate.setHead(head);
        terminate.setData(studentSignService.getSignInfo(studentSignModel.getStuDepart().replace("[", "").replace("]","")));
        terminate.setFooter(footer);
        return SUCCESS;
    }


    @Override
    public StudentSign getModel() {
        return studentSignModel;
    }
}
