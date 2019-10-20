package com.society.computer.entity;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;

/**
 * 班级实体类
 */
@Slf4j
@Data
public class Grade {
    private Long id;
    private Long departId;
    private String className;
    private Date createdTime;
    private Long updatedBy;
    private Date updatedTime;
}
