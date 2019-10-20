package com.society.computer.dao;

import com.society.computer.entity.Member;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface MemberDao {

    public void delete(Long id);

    public long getCountWithName(String stuNo);

    public void save(Member member);

    public Member getMember(Long id);

    public long getCountValue(Member member);

    public List<Member> getAll();

    List<Member> findCriteria(DetachedCriteria dc);

    List<Member> getSingleMember(Member member);

    void update(Member member);

}
