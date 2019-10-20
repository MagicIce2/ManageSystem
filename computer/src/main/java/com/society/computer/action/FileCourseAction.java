package com.society.computer.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.society.computer.entity.FileCourse;
import com.society.computer.entity.Member;
import com.society.computer.service.FileCourseService;
import com.society.computer.service.MemberService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.*;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@Scope("prototype")
@ParentPackage("json-default")
@Namespace("/jsp")
public class FileCourseAction extends ActionSupport implements ModelDriven<FileCourse> {

    @Autowired
    private FileCourseService fileCourseService;
    @Autowired
    private MemberService memberService;
    private FileCourse fileCourseModel = new FileCourse();
    private File mdfile;
    private List<FileCourse> fileCourses;
    private FileCourse fileCourse;
    private String mdfileFileName;
    private String mdfileContentType;
    private Member member;

    public Member getMember() {
        return member;
    }

    public String getMdfileFileName() {
        return mdfileFileName;
    }

    public void setMdfileFileName(String mdfileFileName) {
        this.mdfileFileName = mdfileFileName;
    }

    public String getMdfileContentType() {
        return mdfileContentType;
    }

    public void setMdfileContentType(String mdfileContentType) {
        this.mdfileContentType = mdfileContentType;
    }

    public FileCourse getFileCourse() {
        return fileCourse;
    }

    public File getMdfile() {
        return mdfile;
    }

    public void setMdfile(File mdfile) {
        this.mdfile = mdfile;
    }

    public List<FileCourse> getFileCourses() {
        return fileCourses;
    }

    /**
     * 后台页面
     * @return
     */
    @Action(value = "adminFileCourse", results = {@Result(name = SUCCESS, location = "/WEB-INF/jsp/adminFileCourse.jsp")})
    public String adminFileCourse(){
        fileCourses = fileCourseService.findAll();
        return SUCCESS;
    }

    /**
     * 前端页面
     * @return
     */
    @Action(value = "blogCourse", results = {@Result(name = SUCCESS, location = "/WEB-INF/jsp/blogCourse.jsp")})
    public String blogCourse(){
        fileCourses = fileCourseService.findAll();
        member = memberService.getByIdMember(fileCourses.get(0).getCreatedBy());
        return SUCCESS;
    }

    /**
     * 前台获取文件属性
     * @return
     */
    @Action(value = "getById", results = {@Result(name = SUCCESS, location = "/WEB-INF/jsp/show.jsp")})
    public String getById(){
        fileCourse = fileCourseService.getFileCourse(fileCourseModel.getId());
        return SUCCESS;
    }

    /**
     * 文件保存
     * @return
     */
    @Action(value = "fileSave", results = {@Result(name = SUCCESS, location = "/WEB-INF/jsp/adminFileCourse.jsp")})
    public String fileSave() throws Exception {
//        System.out.println(mdfile.getName());
        String realPath = ServletActionContext.getServletContext().getRealPath("/mdfile/");
        File folder = new File(realPath);
        if (!folder.isDirectory()){
            folder.mkdirs();
        }
        mdfileFileName = mdfileFileName.substring(0, mdfileFileName.lastIndexOf("."));
        String newName = UUID.randomUUID().toString()+".md";
        fileCourseModel.setFileName(mdfileFileName);
        fileCourseModel.setDel(false);
        fileCourseModel.setCreatedTime(new Date());
        fileCourseModel.setCreatedBy(24L);
        fileCourseModel.setFileUrl("/mdfile/" + newName);
        InputStream is = new FileInputStream(mdfile);
        File tofile = new File(folder, newName);
        OutputStream os = new FileOutputStream(tofile);
        byte[] buffer = new byte[1024];
        int len = 0;
        while (-1 != (len = is.read(buffer, 0, buffer.length))){
            os.write(buffer);
        }
        is.close();
        os.close();
//        System.out.println("fileCourseModel：" + fileCourseModel + contentType);
        fileCourseService.save(fileCourseModel);
        fileCourses = fileCourseService.findAll();
        return SUCCESS;
    }

    /**
     * 后台文件删除
     * @return
     */
    @Action(value = "admin_delete", results = {@Result(name = SUCCESS, location = "/WEB-INF/jsp/adminFileCourse.jsp")})
    public String delete(){
        fileCourseService.delete(fileCourseModel.getId());
        return SUCCESS;
    }

    @Override
    public FileCourse getModel() {
        return fileCourseModel;
    }
}
