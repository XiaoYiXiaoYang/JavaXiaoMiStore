package com.alipay.config;


import javax.servlet.http.HttpServletResponse;
 
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;

 
public class AlipayUtil {
 
	public static String pay(HttpServletResponse response,String money,String info,String name,String orderId) throws Exception{
		//��ó�ʼ����AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		
		//�����������
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		
		/*AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();
        model.setBody(name);		//���
        model.setSubject(info);		//����
        model.setOutTradeNo(orderId);//����id
        model.setTimeoutExpress("30m");	//����
        model.setTotalAmount(money);	//���
        //model.setPassbackParams( "2" );
        model.setProductCode("FAST_INSTANT_TRADE_PAY");
        alipayRequest.setBizModel(model);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);*/
		
		/*//�̻������ţ��̻���վ����ϵͳ��Ψһ�����ţ�����
		String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		//���������
		String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"),"UTF-8");
		//������ƣ�����
		String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");
		//��Ʒ�������ɿ�
		String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");*/
		
		alipayRequest.setBizContent("{\"out_trade_no\":\""+ orderId +"\"," 
				+ "\"total_amount\":\""+ money +"\"," 
				+ "\"subject\":\""+ name +"\"," 
				+ "\"body\":\""+ info +"\"," 
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		
		//�����BizContent���������ѡ��������������Զ��峬ʱʱ�����timeout_express������˵��
		//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
		//		+ "\"total_amount\":\""+ total_amount +"\"," 
		//		+ "\"subject\":\""+ subject +"\"," 
		//		+ "\"body\":\""+ body +"\"," 
		//		+ "\"timeout_express\":\"10m\"," 
		//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		//�������ɲ��ġ�������վ֧����API�ĵ�-alipay.trade.page.pay-��������½�
		
		//����
		String result = alipayClient.pageExecute(alipayRequest).getBody();
		
		//����
		return result;
	}
}