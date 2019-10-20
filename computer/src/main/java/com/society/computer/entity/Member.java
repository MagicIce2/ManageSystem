package com.society.computer.entity;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

/**
 * 社团成员信息注册类
 */

@Slf4j
@Data
public class Member {
    private Long id;
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
    private Integer author;
    private Boolean del;
}
