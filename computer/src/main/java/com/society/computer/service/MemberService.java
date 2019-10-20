package com.society.computer.service;

import com.society.computer.entity.Member;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface MemberService {

    List<Member> findAll(DetachedCriteria dc);

    void update(Member memberModel);

    void delete(Member memberModel);

    int judgeLogin(Member member);

    Member getByIdMember(Long id);

    List<Member> findAll();

    void save(Member memberModel);
}
