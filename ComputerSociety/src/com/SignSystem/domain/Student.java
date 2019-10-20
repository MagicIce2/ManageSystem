package com.SignSystem.domain;

/**
 * 签到数据类，包含 序号， 学院， 班级， 姓名等属性
 */

public class Student {
    int id;
    String stuDepart;
    String stuClass;
    String stuName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStuDepart() {
        return stuDepart;
    }

    public void setStuDepart(String stuDepart) {
        this.stuDepart = stuDepart;
    }

    public String getStuClass() {
        return stuClass;
    }

    public void setStuClass(String stuClass) {
        this.stuClass = stuClass;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public Student() {

    }

    public Student(String stuDepart, String stuClass, String stuName) {
        this.stuDepart = stuDepart;
        this.stuClass = stuClass;
        this.stuName = stuName;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", stuDepart='" + stuDepart + '\'' +
                ", stuClass='" + stuClass + '\'' +
                ", stuName='" + stuName + '\'' +
                '}';
    }
}
