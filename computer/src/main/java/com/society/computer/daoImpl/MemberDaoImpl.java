package com.society.computer.daoImpl;

import com.society.computer.dao.MemberDao;
import com.society.computer.entity.Member;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberDaoImpl implements MemberDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public void delete(Long id) {
        hibernateTemplate.delete(id);
    }

    @Override
    public long getCountWithName(String stuNo) {
        List<Member> memberList = (List<Member>) hibernateTemplate.find("from Member  where stuNo = ?", stuNo);
        return memberList.size();
    }

    @Override
    public void save(Member member) {
        hibernateTemplate.save(member);
    }

    @Override
    public Member getMember(Long id) {
        return hibernateTemplate.get(Member.class, id);
    }

    @Override
    public long getCountValue(Member member) {
        return 0;
    }

    @Override
    public List<Member> getAll() {
        return (List<Member>) hibernateTemplate.find("from Member where del = false ");
    }

    @Override
    public List<Member> findCriteria(DetachedCriteria dc) {
        return (List<Member>) hibernateTemplate.findByCriteria(dc);
    }

    /**
     * 根据stuNo获取整个对象的信息，
     * @param member
     * @return
     */
    @Override
    public List<Member> getSingleMember(Member member) {
        return (List<Member>) hibernateTemplate.find("from Member where stuNo = ?", member.getStuNo());
    }

    @Override
    public void update(Member member) {
        hibernateTemplate.update(member);
    }
}
