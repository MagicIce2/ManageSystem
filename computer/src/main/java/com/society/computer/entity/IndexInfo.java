package com.society.computer.entity;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

/**
 * 主页信息类
 */

@Slf4j
@Data
public class IndexInfo {
    private Long id;
    private String title;
    private String content;
}
