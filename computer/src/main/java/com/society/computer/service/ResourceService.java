package com.society.computer.service;

import com.society.computer.entity.Resource;

import java.util.List;

public interface ResourceService {

    List<Resource> findAll();

    void save(Resource resource);

    void delete(Resource resource);

    void delete(Long id);

    void update(Resource resource);

}
