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
			//response.setContentType("");
		String id  = request.getParameter("id");	
		System.out.println(id);
		String password = request.getParameter("password");
	System.out.println(password);
		request.getSession().setAttribute("id", id);
				
		PrintWriter out = response.getWriter();
		if(ItemMarketService.login(id, password)>0){
			System.out.println("정보가 일치합니다.");
			
			UserDTO userProfile = ItemMarketService.getProfile(id);
			request.getSession().setAttribute("userProfile", userProfile);
			
			if(userProfile!=null){
				response.sendRedirect("view/index.jsp");
			}
		}else{
			out.println("<script>");
			out.println("alert('가입되지 않았습니다.')");
			out.println("history.back()");
			out.println("</script>");
				throw new Exception("회원정보가 없습니다.");
		}
		
		}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
	}
		
}

