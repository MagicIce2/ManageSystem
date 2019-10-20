package com.society.computer.service;

import com.society.computer.entity.IndexInfo;

import java.util.List;

public interface IndexInfoService {

    List<IndexInfo> findAll();

    void save(IndexInfo indexInfo);

    void update(IndexInfo indexInfo);

    void delete(IndexInfo indexInfo);

    IndexInfo getById(Long id);
}
