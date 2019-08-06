package com.alipay.config;


import java.io.FileWriter;
import java.io.IOException;
 
/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */
 
public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
 
	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101000652205";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDiexDsaeYAp2Lj1QNXoaid17g+a06LbErvIxwvnq4oX21A2rVSQbZFGyd8qwFT2KJ+zedAM1+LH6hpWSy3BIxLE7zyrTSsPqj8MfqfwcAIxLUvlonA+dsOem49l6cnRpnm39J9SqWacB9USgCGkNvgzr0aznh3keY6R6HPbHo8VBX5s0sfbEFox+ZO8mYekNiu+qHUJ7hmBB+zKvgHzitwkPkq6QbzzSLuKvbF8EoH27NDGutCwLEz07H3mpRQcMMIrjZjWferr8V/RA6UD7ZA4RLA926vVDM61uzerNs3slYN+UMoKT9C41q8onM+WtNkiCjS0unONget+8vHoq31AgMBAAECggEAarQqtAfsunAikk8A5R+gDsXc42OxPNUHtQVouTLcwN683aptdVTKaGKzxvPWi0dsv6uJAWFy6Vw//2ppO80jwBeLlRZv05suCKwPdYdWT4tGBia5vja5s2eRWumBcmq8Bd98D1XFEi8zQ4YeG0hSn+cnh2KxtTwDKYAoR07HhHYCg48pU8rWQ+wrmVKo4kdfOU5SEbYFxiQ9a6jcOu82RhkZHYHzYqw17wijPsB+dXR52fGJlVf7acFOK41+q6d+mIfq8HP3Mz+JNuI3jep6+kSq1aOZpDx2y5VjSILkPBfNZU7nogUbYbmKjWHH0G1xDAwE/W5PcCG4lNd+bW1WgQKBgQDxrF7ugRjzNytKb4l2or8iB6eT4iFNldZhblUBmqCisr7wtp8Ct7k0UulW7KeWoBo+qAbzyOHppZyZRMCrwWOX8B2/Vrfds0L32kKMEsxwM4cU3Uq4zmArdHVwQOYpRaI+LYw/zW4/3QUMF/3MnVLuaE3EGyfWG4U3I0WyEZ431QKBgQDv6CH8omc4SGRGmJg708z95GhgLuWDwmQE/drDlGgzAqg+rA/W+jniD2qQF7vRrQ90Tcc0YeeYRjxFSeHTDyD7ToBE1hI5Fak/tUcIvia8rmoohNjqYOHD3x6Yrpr4flQ7jT+YgEppTtySdJ6Bc1yy4yF8sPEafjDlUHd6ALzNoQKBgQCuxAkOjvsc/xtmQ8xzp3Nyx3hPACs3MREL+j6s30YlAgAEkPviejwLc53cR11WFseD4fzNFMsSLLpXOBng2wQLnw/UC4EBaR4XoJWZOArxZMHdu73KcSuooRpAKB6JYBrYvhV7GjMNKeb5fOwDqQ2M7I64Ly8arWIjonVHNWhmVQKBgDi+UhOcIgfo73bXLuKvtQO0W4+sZ/LjLp8ToAO0fXTbQwoXzmNNqhUzCkRsqKruYQJkRyK3qXyV2DmXQQeXw3hNV/9wFr1Tx0VfTh7eQvFL26YbzeaZ5axbgLQiUFtIHgo73XfnmDISSg+F79u0eo+BM3F3tH9Mq6oBf1DnDcEhAoGAVhSmvXamtNdx3Yemq3Q3PjPLUa2Amgt8jHyVGRpq4efme7SupTmVJmDzj/8ClAOIRImWTdIJqZqyrGmQHN+MUCVIH1byVB802baV9KiUe8Zwo1Fy/PtEusYuVgrghGnHq19lSOYgDhAQU4onk2dQ5ryxwhgTN3sxVMm7S9JInag=";
    
    
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
   
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq/RhV2pi2rKTGUNe62LygdiMWnkrwEInMjN5mkEZcVIkb1ZbepN4iZAEOA9/s8YGMA4/QRvpl464TIbgFvheTQpkPc6BspTmtr8OK6sMd5d/KBmnGr3Da0m92EEoxZuLUdewaARR2LMP6fkVc+cOVBXD8r9tcUDDDSQeaC2ou5BQ9qutfbZoyg/2SdKI0o++CrPoKq3syGm87g6Lo3VuWeQdKfV3f+wEd4GeJicBSgSIJ/ITBg7yqO0n7jIXW3p4yLeeUl6cYBukAX3vVKQOpDceGX+EEBw4mprkb2LFLBQ11keUB2VLwSO/pAHR99FfngO2BWS2W5JmGBgm+u/yyQIDAQAB";
    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/XiaoMiday0722/XmOrderServlet?operate=errpay";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/XiaoMiday0722/XmOrderServlet?operate=successpay";
 
	
	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";
 
 
//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
 
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

