package com.society.computer.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.society.computer.entity.Resource;
import com.society.computer.service.ResourceService;
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
public class ResourceAction extends ActionSupport implements ModelDriven<Resource> {

    private Resource resourceModel = new Resource();
    @Override
    public Resource getModel() {
        return resourceModel;
    }

    @Autowired
    private ResourceService resourceService;
    private List<Resource> resources;
    public List<Resource> getResources() {
        return resources;
    }

    /**
     *进入网盘资源页面
     * @return
     */
    @Action(value = "resource", results = {@Result(name = "resource", location = "/WEB-INF//jsp/Resource.jsp")})
    public String resource(){
        resources = resourceService.findAll();
        return  "resource";
    }

    /**
     * 进入网盘资源后台管理界面
     * @return
     */
    @Action(value = "resourceAdmin", results = {@Result(name = "resourceAdmin", location = "/WEB-INF//jsp/adminResource.jsp")})
    public String resourceAdmin(){
        resources = resourceService.findAll();
        return "resourceAdmin";
    }

    /**
     * 资源添加
     * @return
     */
    @Action(value = "resource_save", results = {@Result(type = "json")})
    public String resource_save(){
        //System.out.println( resourceModel);
        try {
            resourceService.save(resourceModel);
        } catch (Exception e) {
            return "";
        }
        return SUCCESS;
    }

    /**
     * 伪删除操作
     * @return
     */
    @Action(value = "resource_delete", results = {@Result(type = "json")})
    public String resource_delete(){
        resourceService.delete(resourceModel.getId());
        return SUCCESS;
    }
}
