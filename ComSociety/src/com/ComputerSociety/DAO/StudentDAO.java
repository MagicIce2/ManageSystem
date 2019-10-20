package com.ComputerSociety.DAO;

import com.ComputerSociety.Domain.Student;
import java.util.List;

public interface StudentDAO {

    public void save(Student student);

    public void delete(Integer id);

    public List<Student> getAll();

    /**
     * 返回和 name 相等的记录数。
     * @param stuName
     * @return
     */
    public long getCountWithName(String stuName);

    public String getInfo(String stuDepart);

    public List<Student> getinfo(String stuDepart);

    public void clear();

}
