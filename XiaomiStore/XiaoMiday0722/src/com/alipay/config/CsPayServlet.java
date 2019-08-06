package com.alipay.config;

 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
 
public class CsPayServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//�̻������ţ��̻���վ����ϵͳ��Ψһ�����ţ�����
		String orderId = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		//���������
		String money = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"),"UTF-8");
		//������ƣ�����
		String name = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");
		//��Ʒ�������ɿ�
		String info = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
		
		try {
			String result = AlipayUtil.pay(response, money, info, name, orderId);
			request.setAttribute("result", result);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/hello.jsp").forward(request,response);
	}
 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
 
} 
