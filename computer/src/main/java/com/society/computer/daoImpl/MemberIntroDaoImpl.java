package com.society.computer.daoImpl;

import com.society.computer.dao.MemberIntroDao;
import com.society.computer.entity.MemberIntro;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberIntroDaoImpl implements MemberIntroDao{

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<MemberIntro> findAll() {
        return (List<MemberIntro>) hibernateTemplate.find("from MemberIntro where del = false");
    }

    @Override
    public void save(MemberIntro memberIntro) {
        hibernateTemplate.save(memberIntro);
    }

    @Override
    public void update(MemberIntro memberIntro) {
        hibernateTemplate.update(memberIntro);
    }

    @Override
    public void delete(Long id) {
        hibernateTemplate.delete(id);
    }

    @Override
    public void delete(MemberIntro memberIntro) {
        hibernateTemplate.delete(memberIntro);
    }

    @Override
    public MemberIntro getSingleMemberIntro(Long id) {
        return hibernateTemplate.get(MemberIntro.class, id);
    }
}
