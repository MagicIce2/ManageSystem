package com.society.computer.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.society.computer.entity.Department;
import com.society.computer.entity.IndexInfo;
import com.society.computer.service.DepartmentService;
import com.society.computer.service.IndexInfoService;
import com.society.computer.utils.LogUtil;
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
public class IndexInfoAction extends ActionSupport implements ModelDriven<IndexInfo> {

    private IndexInfo indexInfomodel = new IndexInfo();
    @Autowired
    private IndexInfoService indexInfoService;

    private List<IndexInfo> indexInfos;
    private IndexInfo indexInfo;

    public IndexInfo getIndexInfo() {
        return indexInfo;
    }

    public List<IndexInfo> getIndexInfos() {
        return indexInfos;
    }

    @Override
    public IndexInfo getModel() {
        return indexInfomodel;
    }

    /**
     * 主页跳转
     * @return
     */
    @Action(value = "index", results = {@Result(name = "index", location = "/WEB-INF/jsp/index.jsp")})
    public String index(){
        indexInfos = indexInfoService.findAll();
        return "index";
    }

    /**
     * 计算机基础页面
     * @return
     */
    @Action(value = "computerBase", results = {@Result(name = "computerBase", location = "/WEB-INF/jsp/computerbase.html")})
    public String computerBase(){
        return "computerBase";
    }

    /**
     * 后台的主页信息管理界面
     * @return
     */
    @Action(value = "indexAdmin", results = {@Result(name = "indexAdmin", location = "/WEB-INF/jsp/adminIndex.jsp")})
    public String indexAdmin(){
        indexInfos = indexInfoService.findAll();
        return "indexAdmin";
    }

    /**
     * 按照 id 查询数据
     * @return
     */
    @Action(value = "indexInfo_getById", results = {@Result(name = SUCCESS, type = "json", params = {"root", "indexInfo"})})
    public String getById(){
        indexInfo = indexInfoService.getById(indexInfomodel.getId());
        LogUtil.debug(indexInfo.toString());
        LogUtil.debug(indexInfomodel.toString());
        return SUCCESS;
    }

    /**
     * 更新主页数据
     * @return
     */
    @Action(value = "indexInfo_update", results = {@Result(type = "json")})
    public String update(){
        try {
            indexInfoService.update(indexInfomodel);
        } catch (Exception e) {
            return "";
        }
        return SUCCESS;
    }
}
