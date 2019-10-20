package com.society.computer.entity;


import lombok.Data;
import lombok.extern.slf4j.Slf4j;

/**
 * 签到信息实体类
 */
@Slf4j
@Data
public class StudentSign {
    private Long id;
    private String stuDepart;
    private String stuClass;
    private String stuName;
    private Boolean del;
}
