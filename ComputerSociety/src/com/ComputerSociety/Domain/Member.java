package com.ComputerSociety.Domain;

/**
 * 社团成员信息接口
 */

public class Member {
    private int id;
    private String stuNo;
    private String stuDepart;
    private String stuClass;
    private String stuName;
    private String stuPhone;
    private String stuSex;
    private String stuQQ;
    private String stuPassword;
    private String stuBirthday;
    private String stuMe;
    private String money;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStuNo() {
        return stuNo;
    }

    public void setStuNo(String stuNo) {
        this.stuNo = stuNo;
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

    public String getStuPhone() {
        return stuPhone;
    }

    public void setStuPhone(String stuPhone) {
        this.stuPhone = stuPhone;
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex;
    }

    public String getStuQQ() {
        return stuQQ;
    }

    public void setStuQQ(String stuQQ) {
        this.stuQQ = stuQQ;
    }

    public String getStuPassword() {
        return stuPassword;
    }

    public void setStuPassword(String stuPassword) {
        this.stuPassword = stuPassword;
    }

    public String getStuBirthday() {
        return stuBirthday;
    }

    public void setStuBirthday(String stuBirthday) {
        this.stuBirthday = stuBirthday;
    }

    public String getStuMe() {
        return stuMe;
    }

    public void setStuMe(String stuMe) {
        this.stuMe = stuMe;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    //空参构造方法
    public Member() {

    }

    //模糊查询构造方法
    public Member(String stuNo, String stuDepart, String stuClass, String stuName, String stuPhone, String stuSex, String stuQQ, String money) {
        this.stuNo = stuNo;
        this.stuDepart = stuDepart;
        this.stuClass = stuClass;
        this.stuName = stuName;
        this.stuPhone = stuPhone;
        this.stuSex = stuSex;
        this.stuQQ = stuQQ;
        this.money = money;
    }

    //插入构造方法
    public Member(String stuNo, String stuDepart, String stuClass, String stuName, String stuPhone, String stuSex, String stuQQ, String stuPassword, String stuBirthday, String stuMe) {
        this.stuNo = stuNo;
        this.stuDepart = stuDepart;
        this.stuClass = stuClass;
        this.stuName = stuName;
        this.stuPhone = stuPhone;
        this.stuSex = stuSex;
        this.stuQQ = stuQQ;
        this.stuPassword = stuPassword;
        this.stuBirthday = stuBirthday;
        this.stuMe = stuMe;
    }

    //整个构造方法
    public Member(int id, String stuNo, String stuDepart, String stuClass, String stuName, String stuPhone, String stuSex, String stuQQ, String stuPassword, String stuBirthday, String stuMe, String money) {
        this.id = id;
        this.stuNo = stuNo;
        this.stuDepart = stuDepart;
        this.stuClass = stuClass;
        this.stuName = stuName;
        this.stuPhone = stuPhone;
        this.stuSex = stuSex;
        this.stuQQ = stuQQ;
        this.stuPassword = stuPassword;
        this.stuBirthday = stuBirthday;
        this.stuMe = stuMe;
        this.money = money;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id=" + id +
                ", stuNo='" + stuNo + '\'' +
                ", stuDepart='" + stuDepart + '\'' +
                ", stuClass='" + stuClass + '\'' +
                ", stuName='" + stuName + '\'' +
                ", stuPhone='" + stuPhone + '\'' +
                ", stuSex='" + stuSex + '\'' +
                ", stuQQ='" + stuQQ + '\'' +
                ", stuPassword='" + stuPassword + '\'' +
                ", stuBirthday='" + stuBirthday + '\'' +
                ", stuMe='" + stuMe + '\'' +
                ", money=" + money +
                '}';
    }
}
