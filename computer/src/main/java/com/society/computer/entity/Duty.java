package com.society.computer.entity;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;

/**
 * 职务信息类
 */
@Slf4j
@Data
public class Duty {
    private Long id;
    private String dutyName;
    private Long createdBy;
    private Date createdTime;
    private Long updatedBy;
    private Date updatedTime;
}
