package com.society.computer.serviceImpl;

import com.society.computer.dao.MemberIntroDao;
import com.society.computer.entity.MemberIntro;
import com.society.computer.service.MemberIntroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberIntroServiceImpl implements MemberIntroService {

    @Autowired
    private MemberIntroDao memberIntroDao;

    @Override
    public List<MemberIntro> findAll() {
        return memberIntroDao.findAll();
    }

    @Override
    public void save(MemberIntro memberIntro) {
        memberIntro.setDel(false);
        memberIntroDao.save(memberIntro);
    }

    @Override
    public void update(MemberIntro memberIntro) {
        MemberIntro memberIntro1 = memberIntroDao.getSingleMemberIntro(memberIntro.getStaffId());
        memberIntro1.setStaffName(memberIntro.getStaffName());
        memberIntro1.setStaffDepart(memberIntro.getStaffDepart());
        memberIntro1.setStaffProfession(memberIntro.getStaffProfession());
        memberIntro1.setStaffClass(memberIntro.getStaffClass());
        memberIntro1.setStaffDuty(memberIntro.getStaffDuty());
        memberIntro1.setStaffIntroduce(memberIntro.getStaffIntroduce());
        memberIntro1.setStaffMotto(memberIntro.getStaffMotto());
        memberIntroDao.update(memberIntro1);
    }

    @Override
    public void delete(MemberIntro memberIntro) {
        MemberIntro memberIntro1 = memberIntroDao.getSingleMemberIntro(memberIntro.getStaffId());
        memberIntro1.setDel(true);
        memberIntroDao.update(memberIntro1);
    }

    @Override
    public MemberIntro getById(Long staffId) {
        return memberIntroDao.getSingleMemberIntro(staffId);
    }
}
