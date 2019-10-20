package com.ComputerSociety.DAO.Implements;

import com.ComputerSociety.DAO.MemberIntroDAO;
import com.ComputerSociety.Domain.MemberIntro;
import com.Utils.DAO;

import java.util.List;

/**
 * 社团成员简介实现类。从数据库获取数据到前台
 */

public class MemberIntroDAOImpl extends DAO<MemberIntro> implements MemberIntroDAO {
    @Override
    public void save(MemberIntro memberIntro) {

    }

    @Override
    public List<MemberIntro> getAll() {
        String sql = "SELECT * FROM staff";
        return getForList(sql);
    }
}
