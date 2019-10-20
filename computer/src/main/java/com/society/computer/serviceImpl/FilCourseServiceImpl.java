package com.society.computer.serviceImpl;

import com.society.computer.dao.FileCourseDao;
import com.society.computer.entity.FileCourse;
import com.society.computer.service.FileCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FilCourseServiceImpl implements FileCourseService {

    @Autowired
    private FileCourseDao fileCourseDao;

    @Override
    public List<FileCourse> findAll() {
        return fileCourseDao.findAll();
    }

    @Override
    public void save(FileCourse fileCourse) {
        fileCourseDao.save(fileCourse);
    }

    @Override
    public void delete(FileCourse fileCourse) {
        FileCourse fileCourse1 = fileCourseDao.getFileCourse(fileCourse.getId());
        if (fileCourse1 != null){
            fileCourse1.setDel(true);
            this.update(fileCourse1);
        }
    }

    @Override
    public void delete(Long id) {
        FileCourse fileCourse1 = fileCourseDao.getFileCourse(id);
        if (fileCourse1 != null){
            fileCourse1.setDel(true);
            this.update(fileCourse1);
        }
    }

    @Override
    public void update(FileCourse fileCourse) {
        fileCourseDao.update(fileCourse);
    }

    @Override
    public FileCourse getFileCourse(Long id) {
        return fileCourseDao.getFileCourse(id);
    }
}
