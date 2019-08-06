package com.xiaomi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.xiaomi.dao.mapper.UserMapper;
import com.xiaomi.dao.vo.User;
import com.xiaomi.utils.db.DBUtil;

@SuppressWarnings("serial")
public class UserServlet extends HttpServlet {

	public UserServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	
	@SuppressWarnings("unused")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String operate=request.getParameter("operate");
	
		SqlSession session=DBUtil.getSession();
		UserMapper usermapper=session.getMapper(UserMapper.class);
		
		 if("selfinfo".equals(operate)){
			 HttpSession session1=request.getSession();
			 int uid=(Integer) session1.getAttribute("uid");

			if(uid!=0){
				User user=usermapper.selectOneUser(uid);
				request.setAttribute("user", user);
				request.getRequestDispatcher("self_info.jsp").forward(request, response);
			}else{
				System.out.println("uid为空");
			}
			
		}else if("edit".equals(operate)){//杩涘叆缂栬緫椤甸潰
			int uid=Integer.valueOf(request.getParameter("uid"));
			User user=usermapper.selectOneUser(uid);
			request.setAttribute("user",user);
			request.getRequestDispatcher("edituser.jsp").forward(request, response);
		}
		else if("editupdate".equals(operate)){//缂栬緫鍐呭鍚庢洿鏂�
			int uid=Integer.valueOf(request.getParameter("uid"));
			String username=request.getParameter("username");
			String phonenumber=request.getParameter("phonenumber");
			String password=request.getParameter("password");
			String sign=request.getParameter("sign");
			String hobby=request.getParameter("hobby");
			String address=request.getParameter("address");
			User user=usermapper.selectOneUser(uid);
			user.setUsername(username);
			user.setPhonenumber(phonenumber);
			user.setPassword(password);
			user.setSign(sign);
			user.setHobby(hobby);
			user.setAddress(address);
		
			usermapper.UpdateUser(user);
			
			session.commit();
			request.setAttribute("user", user);
			request.getRequestDispatcher("self_info.jsp").forward(request, response);
		}else if("register".equals(operate)){  //注册
			
			String imageText = request.getParameter("image");
	        // 图片的验证码
	        String text = (String) request.getSession().getAttribute("code");

	        if (!text.equalsIgnoreCase(imageText)) {
	            request.setAttribute("rmsg", "验证码输入错误!");
	            request.getRequestDispatcher("register.jsp").forward(request, response);
	        }
			
			String name=request.getParameter("username");
			String pwd=request.getParameter("password");
			String phone=request.getParameter("phonenumber");
			String addr=request.getParameter("address");
			String hobby=request.getParameter("hobby");
			String sign=request.getParameter("sign");
			
			
			User user=new User();
			user.setUsername(name);
			user.setPassword(pwd);
			user.setPhonenumber(phone);
			user.setAddress(addr);
			user.setHobby(hobby);
			user.setSign(sign);
			
			int n = usermapper.InsertUser(user);
			session.commit();
			if(n>0){
				response.sendRedirect("login.jsp");
			}else{
				System.out.println("注册失败");
			}
			
		}else if("login".equals(operate)){
			
			String imageText = request.getParameter("image");
	        // 图片的验证码
	        String text = (String) request.getSession().getAttribute("code");

	        if (!text.equalsIgnoreCase(imageText)) {
	            request.setAttribute("msg", "验证码输入错误!");
	            request.getRequestDispatcher("login.jsp").forward(request, response);
	        }

		
			String name=request.getParameter("username");
			String pwd=request.getParameter("password");
			
			User user=new User();
			user.setUsername(name);
			user.setPassword(pwd);
			User finduser=usermapper.loginCheck(user);
			
			if(finduser!=null){
				
			 if(name!=null){
				 HttpSession session1=request.getSession();
				 session1.setAttribute("uid", finduser.getUid());
				 session1.setAttribute("username", name);
				 response.sendRedirect("index.jsp");
				 }
			}
			else {
				request.setAttribute("passworderror", "error");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		
		}else if("logout".equals(operate)){
			//退出登录，回到首页
			request.getSession().removeAttribute("uid");
			request.getSession().removeAttribute("username");
			response.sendRedirect("index.jsp");
		}
		else{
			System.out.println("未知请求");
		}	
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
