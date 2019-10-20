package com.society.computer.entity;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;

/**
 * 学院信息类
 */
@Slf4j
@Data
public class Department {
    private Long id;
    private String departName;
    private Date createdTime;
}
