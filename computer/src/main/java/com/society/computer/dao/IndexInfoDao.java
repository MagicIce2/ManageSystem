package com.society.computer.dao;

import com.society.computer.entity.IndexInfo;

import java.util.List;

public interface IndexInfoDao {

    List<IndexInfo> findAll();

    void save(IndexInfo indexInfo);

    void update(IndexInfo indexInfo);

    void delete(Long id);

    void delete(IndexInfo indexInfo);

    IndexInfo getSingleIndexInfo(Long id);
}
