package com.society.computer.dao;

import com.society.computer.entity.Resource;

import java.util.List;

public interface ResourceDao {

    List<Resource> findAll();

    void save(Resource resource);

    void update(Resource resource);

    void delete(Long id);

    void delete(Resource resource);

    Resource getSingleResource(Long id);

}
