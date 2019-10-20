package com.ComputerSociety.DAO;

import com.ComputerSociety.Domain.MemDim;
import com.ComputerSociety.Domain.Member;

import java.util.List;

/**
 * 社团注册成员信息接口
 */
public interface MemberDAO {

    public void save(Member member);

    public void delete(Integer id);

    public List<Member> getInfo(MemDim memDim);

    public long getCountWithName(String stuNo);

    public void update(Member member);

    public Member getMember(int id);

    public long getCountValue(String stuNo, String stuPassword);

    public List<Member> getAll();

}
