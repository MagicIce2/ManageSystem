package com.society.computer.entity;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
public class Pay {

    //商户订单号
   private String out_trade_no;
    //支付宝交易号
    private String trade_no;
    //订单描述
    private String subject;
    //付款金额
    private String total_amount;
    //商品描述
    private String body;
    //退款金额
    private String refund_amount;
    //退款原因
    private String refund_reason;
    //退款请求号
    private String out_request_no;
// /usr/java/jdk1.8.0_212-amd64/
    //https://mp.weixin.qq.com/s/yOVbTBVk4CJy6a0lrKjLXA
}
