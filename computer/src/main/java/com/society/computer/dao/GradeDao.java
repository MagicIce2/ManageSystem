package com.society.computer.dao;

import com.society.computer.entity.Grade;

import java.util.List;

public interface GradeDao {

    List<Grade> findAll();

    List<Grade> findAll(Long departId);

}
