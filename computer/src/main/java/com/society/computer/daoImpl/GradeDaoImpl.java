package com.society.computer.daoImpl;

import com.society.computer.dao.GradeDao;
import com.society.computer.entity.Grade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GradeDaoImpl implements GradeDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<Grade> findAll() {
        return (List<Grade>) hibernateTemplate.find("from Grade ");
    }

    @Override
    public List<Grade> findAll(Long departId) {
        return (List<Grade>) hibernateTemplate.find("from Grade where departId = ?", departId);
    }
}
