package com.society.computer.action;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradePagePayModel;
import com.alipay.api.domain.AlipayTradePageRefundModel;
import com.alipay.api.domain.AlipayTradePayModel;
import com.alipay.api.request.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.society.computer.config.AlipayConfig;
import com.society.computer.entity.Pay;
import lombok.extern.slf4j.Slf4j;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Slf4j
@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/jsp")
public class PagePay extends ActionSupport implements ModelDriven<Pay> {

    private String result;

    private Pay payModel = new Pay();
    @Override
    public Pay getModel() {
        return payModel;
    }

    public String getResult() {
        return result;
    }

    /**
     * 付款
     * @return
     * @throws Exception
     */
    @Action(value = "pay", results = {@Result(name = SUCCESS, location = "/WEB-INF/jsp/alipaytradepagepay.jsp")})
    public String createPay() throws Exception {
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl,
                AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json",
                AlipayConfig.charset,
                AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        AlipayTradePagePayModel model = new AlipayTradePagePayModel();
        model.setOutTradeNo(payModel.getOut_trade_no());
        model.setSubject(payModel.getSubject());
        model.setTotalAmount(payModel.getTotal_amount());
        model.setBody(payModel.getBody());
        model.setProductCode("FAST_INSTANT_TRADE_PAY");
        alipayRequest.setBizModel(model);
        //请求
        result = alipayClient.pageExecute(alipayRequest).getBody();
        System.out.println(result);
        return SUCCESS;
    }

    /**
     * 交易查询
     */

    /**
     * 退款
     */
    @Action(value = "refund", results = {@Result(name = SUCCESS, location = "/WEB-INF/jsp/alipay.trade.refund.jsp")})
    public String refund() throws AlipayApiException {
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl,
                AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json",
                AlipayConfig.charset,
                AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();
        alipayRequest.setBizContent("{\"out_trade_no\":\""+ payModel.getOut_trade_no() +"\","
                + "\"trade_no\":\""+ payModel.getTrade_no() +"\","
                + "\"refund_amount\":\""+ payModel.getRefund_amount() +"\","
                + "\"refund_reason\":\""+ payModel.getRefund_reason() +"\","
                + "\"out_request_no\":\""+ payModel.getOut_request_no() +"\"}");
        //设置请求参数
//        AlipayTradePageRefundRequest alipayRequest = new AlipayTradePageRefundRequest();

//        AlipayTradePageRefundModel model = new AlipayTradePageRefundModel();
//        model.setOutTradeNo(payModel.getOut_trade_no());
//        model.setTradeNo(payModel.getTrade_no());
//        model.setRefundAmount(payModel.getRefund_amount());
//        model.setRefundReason(payModel.getRefund_reason());
//        model.setOutRequestNo(payModel.getOut_request_no());
//        alipayRequest.setBizModel(model);
//        result = alipayClient.pageExecute(alipayRequest).getBody();
        result = alipayClient.execute(alipayRequest).getBody();
        System.out.println(result);
        return SUCCESS;
    }

    /**
     * 退款查询
     */

}
