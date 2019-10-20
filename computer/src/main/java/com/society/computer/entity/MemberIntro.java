package com.society.computer.entity;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

/**
 * 社团成员简介类
 */
@Slf4j
@Data
public class MemberIntro {
    private Long staffId;
    private String staffPicture;
    private String staffName;
    private String staffDepart;
    private String staffProfession;
    private String staffClass;
    private String staffDuty;
    private String staffIntroduce;
    private String staffMotto;
    private Boolean del;
}
