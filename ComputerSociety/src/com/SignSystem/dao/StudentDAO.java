package com.SignSystem.dao;

import com.SignSystem.domain.Student;

import java.util.List;

/**
 * 签到部分数据接口，
 *      签到数据保存
 *      删除数据
 *      获取所有签到数据
 *      检查是否重复签到
 *      获取某个学院所有的签到数据，按照销假单格式整理
 *      按照学院获取数据传送到前台，
 *      清空数据库操作
 */

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
