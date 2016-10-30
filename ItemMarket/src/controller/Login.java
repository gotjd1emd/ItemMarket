package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dto.UserDTO;
import model.service.ItemMarketService;

public class Login implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		response.setContentType("text/html;charset=utf-8");
		try {

		String id  = request.getParameter("id");		
		String password = request.getParameter("password");
		
				
		PrintWriter out = response.getWriter();
		if(ItemMarketService.login(id, password)>0){
			System.out.println("로그인 성공");
			
			UserDTO userProfile = ItemMarketService.getProfile(id);
			request.getSession().setAttribute("userProfile", userProfile);
			
			if(userProfile!=null){
				response.sendRedirect("view/index.jsp");
			}
		}else{
		
			
			request.getSession().invalidate();
			out.println("<script>");
			out.println("alert('로그인을 실패하였습니다.')");

			out.println("history.back()");
			out.println("</script>");

		}
		
		}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
	}
		
}