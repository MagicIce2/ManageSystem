package com.society.computer.dao;

import com.society.computer.entity.StudentSign;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface StudentSignDao {

    List<StudentSign> findAll();

    List<StudentSign> findCriteria(DetachedCriteria dc);

    void delete(Long id);

    void delete(StudentSign studentSign);

    void save(StudentSign studentSign);

    void update(StudentSign studentSign);

    void clearAll(String hql);

    StudentSign getSingleStudentSign(Long id);

    List<StudentSign> findAll(String stuDepart);

    String getSignInfo(String stuDepart);
}
