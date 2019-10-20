package com.society.computer.service;

import com.society.computer.entity.StudentSign;

import java.util.List;

public interface StudentSignService {

    List<StudentSign> findAll();

    void save(StudentSign studentSignModel);

    void delete(StudentSign studentSign);

    List<StudentSign> findAll(StudentSign studentSignModel);

    void clear();

    String getSignInfo(String stuDepart);
}
