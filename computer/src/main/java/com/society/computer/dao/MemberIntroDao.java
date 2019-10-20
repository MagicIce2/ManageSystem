package com.society.computer.dao;

import com.society.computer.entity.MemberIntro;

import java.util.List;

public interface MemberIntroDao {

    List<MemberIntro> findAll();

    void save(MemberIntro memberIntro);

    void update(MemberIntro memberIntro);

    void delete(Long id);

    void delete(MemberIntro memberIntro);

    MemberIntro getSingleMemberIntro(Long id);

}
