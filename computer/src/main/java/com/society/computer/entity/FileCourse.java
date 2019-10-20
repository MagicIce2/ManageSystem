package com.society.computer.entity;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;

/**
 * 资源上传类
 */
@Slf4j
@Data
public class FileCourse {
    private Long id;
    private String fileName;
    private String fileUrl;
    private Boolean del;
    private Long createdBy;
    private Date createdTime;
    private Long updatedBy;
    private Date updatedTime;
}
