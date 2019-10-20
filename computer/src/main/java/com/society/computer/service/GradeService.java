package com.society.computer.service;

import com.society.computer.entity.Grade;

import java.util.List;

public interface GradeService {

    List<Grade> findAll(Long id);

}
