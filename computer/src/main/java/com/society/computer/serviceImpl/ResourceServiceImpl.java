package com.society.computer.serviceImpl;

import com.society.computer.dao.ResourceDao;
import com.society.computer.entity.Resource;
import com.society.computer.service.ResourceService;
import com.society.computer.utils.LogUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceDao resourceDao;

    @Override
    public List<Resource> findAll() {
        return resourceDao.findAll();
    }

    @Override
    public void save(Resource resource) {
        String link = resource.getLink();
        String[] links = link.split("：");
        resource.setLink(links[1].split(" ")[0]);
        resource.setPass(links[2].split(" ")[0]);
        resource.setDate(new Date());
        resource.setDel(false);
        LogUtil.debug(resource.toString());
        resourceDao.save(resource);
    }
//    链接: https://pan.baidu.com/s/1yuYnzkMF4p4ipAOhC9Tbpg 提取码: cgs4
    @Override
    public void delete(Resource resourceModel) {
        Resource resource = resourceDao.getSingleResource(resourceModel.getId());
        resource.setDel(true);
        resourceDao.update(resource);
    }

    @Override
    public void delete(Long id) {
        Resource resource = resourceDao.getSingleResource(id);
        resource.setDel(true);
        resourceDao.update(resource);
    }

    @Override
    public void update(Resource resource) {

    }
}
