package com.ComputerSociety.DAO.Implements;

import com.ComputerSociety.DAO.MemberDAO;
import com.ComputerSociety.Domain.MemDim;
import com.ComputerSociety.Domain.Member;
import com.Utils.DAO;

import java.util.List;

/**
 * 社团注册成员实现类，继承 DAO 泛型，实现数据的增删改查
 */

public class MemberDAOJdbcImpl extends DAO<Member> implements MemberDAO {
    //private DAO<Member>  daoMember = new DAO();
    @Override
    public void save(Member member) {
        String sql = "INSERT INTO stuinfo(stuNo, stuDepart, stuClass, stuName, stuPhone, stuSex, stuQQ, stuPassword, stuBirthday, stuMe) VALUES" +
                "(?,?,?,?,?,?,?,?,?,?)";
        update(sql, member.getStuNo(), member.getStuDepart(), member.getStuClass(), member.getStuName(), member.getStuPhone(),member.getStuSex(), member.getStuQQ(), member.getStuPassword(), member.getStuBirthday(), member.getStuMe());
    }

    @Override
    public void delete(Integer id) {
        String sql = "DELETE FROM stuinfo WHERE id = ?";
        update(sql, id);
    }

    @Override
    public List<Member> getInfo(MemDim member) {
        String sql = "SELECT * FROM stuinfo WHERE stuNo LIKE ? AND stuDepart LIKE ? AND stuClass LIKE ? AND stuName LIKE ? AND stuPhone LIKE ? " +
                "AND stuSex LIKE ? AND stuQQ LIKE ? AND money LIKE ?";
        //System.out.println(member.getStuNo() + member.getStuDepart()+ member.getStuClass()+ member.getStuName()+ member.getStuPhone()+
        //        member.getStuSex()+ member.getStuQQ()+ member.getMoney());
        return getForList(sql, member.getStuNo(), member.getStuDepart(), member.getStuClass(), member.getStuName(), member.getStuPhone(),
                member.getStuSex(), member.getStuQQ(), member.getMoney());
    }

    @Override
    public long getCountWithName(String stuNo) {
        String sql = "SELECT count(id) FROM stuinfo WHERE stuNo = ?";
        return getForValue(sql, stuNo);
    }

    @Override
    public void update(Member member) {
        String sql = "UPDATE stuinfo set stuNo = ?, stuDepart = ?, stuClass = ?, stuName = ?, stuPhone = ?, stuSex = ?, stuQQ = ?, stuPassword = ? WHERE id = ?";
        update(sql, member.getStuNo(), member.getStuDepart(), member.getStuClass(), member.getStuName(), member.getStuPhone(),member.getStuSex(),
                member.getStuQQ(), member.getStuPassword(), member.getId());
    }

    @Override
    public Member getMember(int id) {
        String sql = "SELECT id, stuNo, stuDepart, stuClass, stuName, stuPhone,stuSex, stuQQ, stuPassword FROM stuinfo WHERE id = ?";
        return get(sql, id);
    }

    @Override
    public long getCountValue(String stuNo, String stuPassword) {
        String sql = "SELECT count(stuNo) from stuinfo WHERE stuNo = ? and stuPassword = ?";
        return getForValue(sql, stuNo, stuPassword);
    }

    @Override
    public List<Member> getAll() {
        String sql = "SELECT * FROM stuinfo";
        return getForList(sql);
    }
}
