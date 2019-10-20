package com.society.computer.entity;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;

/**
 * 网盘资源实体类
 */
@Slf4j
@Data
public class Resource {
    private Long id;
    private String title;
    private String link;
    private String pass;
    private Date date;
    private Boolean del;
}
