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
		
		request.getSession().setAttribute("id", id);
				
		PrintWriter out = response.getWriter();
		if(ItemMarketService.login(id, password)>0){
			System.out.println("������ ��ġ�մϴ�.");
			
			UserDTO userProfile = ItemMarketService.getProfile(id);
			request.getSession().setAttribute("userProfile", userProfile);
			
			if(userProfile!=null){
				response.sendRedirect("view/index.jsp");
			}
		}else{
			//Ȥ�� �α��� ���ִ°� �� �����Ű��.
			request.getSession().invalidate();
			out.println("<script>");
			out.println("alert('���Ե��� �ʾҽ��ϴ�.')");
			out.println("history.back()");
			out.println("</script>");
				throw new Exception("ȸ�������� �����ϴ�.");
		}
		
		}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
	}
		
}

