package com.society.computer.serviceImpl;

import com.society.computer.dao.IndexInfoDao;
import com.society.computer.entity.IndexInfo;
import com.society.computer.service.IndexInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexInfoServiceImpl implements IndexInfoService {

    @Autowired
    private IndexInfoDao indexInfoDao;

    @Override
    public List<IndexInfo> findAll() {
        return indexInfoDao.findAll();
    }

    @Override
    public void save(IndexInfo indexInfo) {
        indexInfoDao.save(indexInfo);
    }

    @Override
    public void update(IndexInfo indexInfo) {
        IndexInfo indexInfo1 = indexInfoDao.getSingleIndexInfo(indexInfo.getId());
        indexInfo1.setTitle(indexInfo.getTitle());
        indexInfo1.setContent(indexInfo.getContent());
        indexInfoDao.update(indexInfo1);
    }

    @Override
    public void delete(IndexInfo indexInfo) {
        indexInfoDao.update(indexInfo);
    }

    @Override
    public IndexInfo getById(Long id) {
        return indexInfoDao.getSingleIndexInfo(id);
    }
}
