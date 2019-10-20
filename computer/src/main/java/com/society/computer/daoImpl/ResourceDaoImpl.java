package com.society.computer.daoImpl;

import com.society.computer.dao.ResourceDao;
import com.society.computer.entity.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ResourceDaoImpl implements ResourceDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<Resource> findAll() {
        return (List<Resource>) hibernateTemplate.find("from Resource where del = false ");
    }

    @Override
    public void save(Resource resource) {
        hibernateTemplate.save(resource);
    }

    @Override
    public void update(Resource resource) {
        hibernateTemplate.update(resource);
    }

    @Override
    public void delete(Long id) {
        hibernateTemplate.delete(id);
    }

    @Override
    public void delete(Resource resource) {
        hibernateTemplate.delete(resource);
    }

    @Override
    public Resource getSingleResource(Long id) {
        return hibernateTemplate.get(Resource.class, id);
    }
}
