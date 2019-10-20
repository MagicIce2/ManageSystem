package com.ComputerSociety.Domain;

/**
 * 模糊查询类
 */

public class MemDim {
    private String stuDepart;
    private String stuClass;
    private String stuNo;
    private String stuName;
    private String stuPhone;
    private String stuSex;
    private String stuQQ;
    private String money;

    public String getStuDepart() {
        if (stuDepart == null){
            stuDepart = "%%";
        }else{
            stuDepart = "%" + stuDepart + "%";
        }
        return stuDepart;
    }

    public void setStuDepart(String stuDepart) {
        this.stuDepart = stuDepart;
    }

    public String getStuClass() {
        if (stuClass == null){
            stuClass = "%%";
        }else{
            stuClass = "%" + stuClass + "%";
        }
        return stuClass;
    }

    public void setStuClass(String stuClass) {
        this.stuClass = stuClass;
    }

    public String getStuNo() {
        if (stuNo == null){
            stuNo = "%%";
        }else{
            stuNo = "%" + stuNo + "%";
        }
        return stuNo;
    }

    public void setStuNo(String stuNo) {
        this.stuNo = stuNo;
    }

    public String getStuName() {
        if (stuName == null){
            stuName = "%%";
        }else{
            stuName = "%" + stuName + "%";
        }
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuPhone() {
        if (stuPhone == null){
            stuPhone = "%%";
        }else{
            stuPhone = "%" + stuPhone + "%";
        }
        return stuPhone;
    }

    public void setStuPhone(String stuPhone) {
        this.stuPhone = stuPhone;
    }

    public String getStuSex() {
        if (stuSex == null){
            stuSex = "%%";
        }else{
            stuSex = "%" + stuSex + "%";
        }
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex;
    }

    public String getStuQQ() {
        if (stuQQ == null){
            stuQQ = "%%";
        }else{
            stuQQ = "%" + stuQQ + "%";
        }
        return stuQQ;
    }

    public void setStuQQ(String stuQQ) {
        this.stuQQ = stuQQ;
    }

    public String getMoney() {
        if (money == null){
            money = "%%";
        }else{
            money = "%" + money + "%";
        }
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }
/*
* if (stuPassword == null){
            stuPassword = "%%";
        }else{
            stuPassword  = "%" + stuPassword + "%";
        }

        if (stuBirthday == null){
            stuBirthday = "%%";
        }else{
            stuBirthday = "%" + stuBirthday + "%";
        }
* */
    public MemDim() {
    }

    public MemDim(String stuDepart, String stuClass, String stuNo, String stuName, String stuPhone, String stuSex, String stuQQ, String money) {
        this.stuDepart = stuDepart;
        this.stuClass = stuClass;
        this.stuNo = stuNo;
        this.stuName = stuName;
        this.stuPhone = stuPhone;
        this.stuSex = stuSex;
        this.stuQQ = stuQQ;
        this.money = money;
    }
}
