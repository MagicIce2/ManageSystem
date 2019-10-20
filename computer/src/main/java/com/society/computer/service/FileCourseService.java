package com.society.computer.service;

import com.society.computer.entity.FileCourse;

import java.util.List;

public interface FileCourseService {

    List<FileCourse> findAll();

    void save(FileCourse fileCourse);

    void delete(FileCourse fileCourse);

    void delete(Long id);

    void update(FileCourse fileCourse);

    FileCourse getFileCourse(Long id);

}
