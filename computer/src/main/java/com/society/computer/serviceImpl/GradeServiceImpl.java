package com.society.computer.serviceImpl;

import com.society.computer.dao.GradeDao;
import com.society.computer.entity.Grade;
import com.society.computer.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService {

    @Autowired
    private GradeDao gradeDao;

    @Override
    public List<Grade> findAll(Long id) {
        return gradeDao.findAll(id);
    }
}
