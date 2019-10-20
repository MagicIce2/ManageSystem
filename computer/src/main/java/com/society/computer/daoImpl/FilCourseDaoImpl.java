package com.society.computer.daoImpl;

import com.society.computer.dao.FileCourseDao;
import com.society.computer.entity.FileCourse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FilCourseDaoImpl implements FileCourseDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<FileCourse> findAll() {
        return (List<FileCourse>) hibernateTemplate.find("from FileCourse where del = false ");
    }

    @Override
    public void save(FileCourse fileCourse) {
        hibernateTemplate.save(fileCourse);
    }

    @Override
    public void delete(FileCourse fileCourse) {
        hibernateTemplate.delete(fileCourse);
    }

    @Override
    public void delete(Long id) {
        hibernateTemplate.delete(id);
    }

    @Override
    public void update(FileCourse fileCourse) {
        hibernateTemplate.update(fileCourse);
    }

    @Override
    public FileCourse getFileCourse(Long id) {
        return hibernateTemplate.get(FileCourse.class, id);
    }
}
