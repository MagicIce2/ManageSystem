package com.society.computer.config;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {

    public static String app_id = "2016092600601578";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDlek//4ruRKkeDHE6IZiocbFZS0aTRrlGI63jg37gEltpgmtTi/FI95yUiI9pa2uRIut08Ea3DGdcwdifqr3BOKNahvT3WmvlP0nohj4loYaBUB033eiSxRR6vTG8iMS5AnMThrDOMtBVH+0e4sBECuRbtE0bvSAYPvwEeDagug7aIn9vUmaSmWgJwEivrXJ2Ivon12+O2u9GSCAUOaTwAfSdh2BRDgSBTCfjPLLoPUFK/TA3t1Clq/G7t+Y4NrV7h4aTnypqaG+tCpj4vc1opFrwc9wbjey44E1ItaGqdgLEa7+CyLl0TkcK+IM+7SK5qJYVp8GXo5dTXmXnSm1/NAgMBAAECggEAcCKx3w/Tql8nrNjzQ1HxOAx0rmnFibUOIMM4QWLxUETLF7PxXa4BHkDKc4FjnUwji6rMmyLkb1c8QXErllH+piLspwKLqkf2llv61FWIxtoV95nOLqWgMoPdN7o5AFNaD7bLup9kXVhOoesXpBddaKA7pMPrwNfIJn+msyHnUjqbyzuJN2mmkbhXXlWnu6N9T9NhGHHsOZwdOJTA+eqPeirTwF9eecJgT6kf0vEVY6VtY1YtVqGHdxA4ZeuPHIO/EPYlkGeA9sqhlokE5wTxEvZhl01zyx55YmPDBXBYloxk3y/fzByjX5w9IRmBEw40riTq4/hGVo0KmgeYoPwM/QKBgQD5CH9gOMJnOOlol1MJIoNQPc8/8i8JQnv0AiQEE2BVjfpENStmQHQ5qdqNJaVEqLzDv9ti6JaPTBIv56kT0AFYvaAyPw6KeSUDNTM7gi2nidB6jj60nzdHULpXBj/PoA5/aIyX4kyUZWCBFcZT0/GKN4rHIUX7RZsqaKb28ojoIwKBgQDr5cPMtrubDi3SB4SUwdYnHK1lsK0IJm+Aacz0ELm8IWuR/QPJ9QGtXo1TytcAdlNYL7/18IGCGlApsjp4bwjXw6Io/gT6pa4Wm1l7nz6VIkvjI0aNsAr7fyfjXKhq2C/0Wyl5RTHgoLO5gVrXorIe1MDE8YxlxWPWPRSnwPqfTwKBgH1qTyO5UgZD/iBjXTkTfYgyqKYupIuIRP58+YBn9bMAfpJNKJ8lRKMprFw7IkEyrWXzwFvOgMyH5fzkMR0+Ov9i+EN1yC/qlL5J05RbmfxvBmRCMMgsCt3KhR2AkzBQDh0SHQP8vs5ZQ8GeorPi4BjYofZpBmJmCp/P9o4VVOd7AoGAU0xxFYq5OImLOI0bDgRcgLcpq6z1jNk1qlyx2MVHMN2ERKrZeakgjH3E3f/UZ/9gctV5rXjd4nk0MWUULI7Yyof0bRE15OQ4UxdMQ9D5omPX9D7ynPm7Bw/hn/GKLyBj3p+KR55dfHqCvFCnKVn0F9r8rw60iwNmu7IZ5xrH5RUCgYEA35eUUKMU3s9pT8yZaoqYn+LFNwEAND0A9z13yCneofPJDvDzwugPRv5Gd/utgK5fx68q99HaD1dAxBZ9gzqokYurUhOlG9Un39fMIfSoVS0h4KCGyLeqCZcT6PHyalBO7M7COtG7Mrf8mWYj/GK3oA+5N98nomgxsWkr7uFb+7c=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsV7GLnWNbY0Nix0oxKvxQGA3RSfp2IZAOBnlz14mQCUZEzGDD8nkGUOMR6fLAPN1NPsPjnWSpHSZjnWo0OKZ70N2k3e1ON+0p/6dC+f+b3ijfGtF/9o5Sz9LqZEVHkdw1G8Di7hyn0lG5VQ8FqsEr3jUVpo+sFCtJ+0vjdUJBsnH/hPx5gveCiP0DHBLzF8VE9k8LJjFskNsaE/yIQjpkLq5exfa6UE0wCpYk3I1yMqGxKA/9qPR0U5frcKLGoPeK5V6ax+TpOBj1UdACSvbDtwwF7M4gwOTmJ1M5R1JSIrLaY3BJM0UNzlAixB5Rz8YXvchtV8+nZ+7onz3u5zCRwIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/computer/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/computer/return_url.jsp";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
//                       String url = "https://openapi.alipay.com/gateway.do";

    // 支付宝网关
    public static String log_path = "H:\\";


    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
