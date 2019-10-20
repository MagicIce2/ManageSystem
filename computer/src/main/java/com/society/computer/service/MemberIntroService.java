package com.society.computer.service;

import com.society.computer.entity.MemberIntro;

import java.util.List;

public interface MemberIntroService {

    List<MemberIntro> findAll();

    void save(MemberIntro memberIntro);

    void update(MemberIntro memberIntro);

    void delete(MemberIntro memberIntro);

    MemberIntro getById(Long staffId);
}
