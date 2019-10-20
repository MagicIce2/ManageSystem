package com.ComputerSociety.DAO;

/**
 * 成员简介部分接口
 */

import com.ComputerSociety.Domain.MemberIntro;

import java.util.List;

public interface MemberIntroDAO {

    public void save(MemberIntro memberIntro);

    public List<MemberIntro> getAll();

}
