package com.society.computer.daoImpl;

import com.society.computer.dao.DepartmentDao;
import com.society.computer.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<Department> findAll() {
        return (List<Department>) hibernateTemplate.find("from Department ");
    }
}
