package com.society.computer.daoImpl;

import com.society.computer.dao.DutyDao;
import com.society.computer.entity.Duty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DutyDaoImpl implements DutyDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<Duty> findAll() {
        return (List<Duty>) hibernateTemplate.find("from Duty ");
    }
}
