package com.society.computer.serviceImpl;

import com.society.computer.dao.MemberDao;
import com.society.computer.entity.Member;
import com.society.computer.service.MemberService;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDao memberDao;
    Member member = new Member();
    private List<Member> memberList;

    @Override
    public List<Member> findAll(DetachedCriteria dc) {
        return memberDao.findCriteria(dc);
    }

    /**
     * 更新数据，先查在更新
     * @param memberModel
     */
    @Override
    public void update(Member memberModel) {
        member =  memberDao.getMember(memberModel.getId());
        if (memberModel.getStuNo() != null){
            member.setStuNo(memberModel.getStuNo());
        }else  if (memberModel.getStuDepart() != null){
            member.setStuDepart(memberModel.getStuDepart());
        }else  if (memberModel.getStuClass() != null){
            member.setStuClass(memberModel.getStuClass());
        }else  if (memberModel.getStuName() != null){
            member.setStuName(memberModel.getStuName());
        }else  if (memberModel.getStuPhone() != null){
            member.setStuPhone(memberModel.getStuPhone());
        }else  if (memberModel.getStuSex() != null){
            member.setStuSex(memberModel.getStuSex());
        }else  if (memberModel.getStuQQ() != null){
            member.setStuQQ(memberModel.getStuQQ());
        }else  if (memberModel.getStuPassword() != null){
            member.setStuPassword(memberModel.getStuPassword());
        }else  if (memberModel.getStuBirthday() != null){
            member.setStuBirthday(memberModel.getStuBirthday());
        }else  if (memberModel.getMoney() != null){
            member.setMoney(memberModel.getMoney());
        }
        memberDao.update(member);
    }

    @Override
    public void delete(Member memberModel) {
        member =  memberDao.getMember(memberModel.getId());
        member.setDel(true);
        memberDao.update(member);
    }

    /**
     * 登录判断，
     *  0：登录成功
     *  1：账户不存在
     *  2：密码错误
     *  3：账户被禁用
     * @param memberModel
     * @return
     */
    @Override
    public int judgeLogin(Member memberModel) {
        memberList = memberDao.getSingleMember(memberModel);
        if(1 == memberList.size()){
            member = memberList.get(0);
            if(member.getStuNo().equals(memberModel.getStuNo()) && member.getStuPassword().equals(memberModel.getStuPassword())){
                if (member.getDel()){
                    return 3;
                }else {
                    return 0;
                }
            }else{
                return 2;
            }
        }
        return 1;
    }

    @Override
    public Member getByIdMember(Long id) {
        return memberDao.getMember(id);
    }

    @Override
    public List<Member> findAll() {
        return memberDao.getAll();
    }

    @Override
    public void save(Member memberModel) {
        memberDao.save(memberModel);
    }
}
