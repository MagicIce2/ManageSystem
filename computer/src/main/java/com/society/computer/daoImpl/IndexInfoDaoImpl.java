package com.society.computer.daoImpl;

import com.society.computer.dao.IndexInfoDao;
import com.society.computer.entity.IndexInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class IndexInfoDaoImpl implements IndexInfoDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<IndexInfo> findAll() {
        return (List<IndexInfo>) hibernateTemplate.find("from IndexInfo");
    }

    @Override
    public void save(IndexInfo indexInfo) {
        hibernateTemplate.save(indexInfo);
    }

    @Override
    public void update(IndexInfo indexInfo) {
        hibernateTemplate.update(indexInfo);
    }

    @Override
    public void delete(IndexInfo indexInfo) {

    }

    @Override
    public void delete(Long id) {
        hibernateTemplate.delete(id);
    }

    @Override
    public IndexInfo getSingleIndexInfo(Long id) {
        return hibernateTemplate.get(IndexInfo.class, id);
    }
}
