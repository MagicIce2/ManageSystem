package com.society.computer.daoImpl;

import com.society.computer.dao.StudentSignDao;
import com.society.computer.entity.StudentSign;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudentSignDaoImpl implements StudentSignDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<StudentSign> findAll() {
        return (List<StudentSign>) hibernateTemplate.find("from StudentSign where del = false");
    }

    @Override
    public List<StudentSign> findCriteria(DetachedCriteria dc) {
        return null;
    }

    @Override
    public void delete(Long id) {
        hibernateTemplate.delete(id);
    }

    @Override
    public void delete(StudentSign studentSign) {
        hibernateTemplate.delete(studentSign);
    }

    @Override
    public void save(StudentSign studentSign) {
        hibernateTemplate.save(studentSign);
    }

    @Override
    public void update(StudentSign studentSign) {
        hibernateTemplate.update(studentSign);
    }

    @Override
    public void clearAll(String hql) {
//        hibernateTemplate.evict(hql);
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(hql);
        query.executeUpdate();
    }

    @Override
    public StudentSign getSingleStudentSign(Long id) {
        return hibernateTemplate.get(StudentSign.class, id);
    }

    @Override
    public List<StudentSign> findAll(String stuDepart) {
        return (List<StudentSign>) hibernateTemplate.find("from StudentSign where del = false and stuDepart = ?", stuDepart);
    }

    @Override
    public String getSignInfo(String stuDepart) {
        Session session = sessionFactory.getCurrentSession();
        String sql = "SELECT group_concat(stuClass, data) FROM (SELECT stuClass,group_concat(stuName) as data FROM signinfo WHERE stuDepart = ? group by stuClass) as info";
        Query query = session.createSQLQuery(sql);
        query.setParameter(0, stuDepart);
        return String.valueOf(query.list());
    }
}
