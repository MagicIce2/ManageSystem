package com.society.computer.entity;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

/**
 * 销假单类，对销假单的格式进行封装。
 *         String head = "兹因计算机社团举办活动需要，时间：（19:00~20:00），地点（二教414），故";
 *         String tile = "不能正常出勤晚自习，因此给贵部工作带来不便，敬请谅解，并给予销假。\r\n\t特此证明！";
 */
@Slf4j
@Data
public class Terminate {
    private String title;
    private String head;
    private String data;
    private String footer;
}
