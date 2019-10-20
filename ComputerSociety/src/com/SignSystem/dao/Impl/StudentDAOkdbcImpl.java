package com.SignSystem.dao.Impl;

import com.Utils.DAO;
import com.SignSystem.dao.StudentDAO;
import com.SignSystem.domain.Student;

import java.util.List;

/***
 * 签到部分数据操作实现类，
 */

public class StudentDAOkdbcImpl extends DAO<Student> implements StudentDAO {
    @Override
    public void save(Student student) {
        String sql = "INSERT INTO signinfo(stuDepart, stuClass, stuName) VALUES(?,?,?)";
        update(sql, student.getStuDepart(), student.getStuClass(), student.getStuName());
    }

    @Override
    public void delete(Integer id) {
        String sql = "DELETE FROM signinfo WHERE id = ?";
        update(sql,id);
    }

    @Override
    public List<Student> getAll() {
        String sql = "SELECT id, stuDepart, stuClass, stuName FROM signinfo";
        return getForList(sql);
    }

    @Override
    public long getCountWithName(String stuName) {
        String sql = "SELECT count(id) FROM signinfo WHERE stuName = ?";
        return getForValue(sql, stuName);
    }

    @Override
    public String getInfo(String stuDepart) {
        String sql = "SELECT GROUP_CONCAT(stuClass, data) FROM (SELECT stuClass,GROUP_CONCAT(stuName) as data FROM signinfo WHERE stuDepart = ? group by stuClass) as info";
        return getForValue(sql, stuDepart);
    }

    @Override
    public List<Student> getinfo(String stuDepart) {
        String sql = "SELECT id, stuDepart, stuClass, stuName FROM signinfo WHERE stuDepart = ?";
        return getForList(sql, stuDepart);
    }

    @Override
    public void clear() {
        String sql = "truncate table signinfo";
        update(sql);
    }
}
