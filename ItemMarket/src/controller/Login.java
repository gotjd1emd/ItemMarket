package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.UserDTO;
import model.service.ItemMarketService;




public class Login implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		response.setContentType("text/html;charset=utf-8");
		try {
			//response.setContentType("");
		GetProfile getProfile = new GetProfile();
		String id  = request.getParameter("id");
		
		String password = request.getParameter("password");
		//int result= 0 ;
		//ItemMarketService marketService = new ItemMarketService();
		
		//result  = marketService.login(id, password);
		//if(result==1){
			//getProfile.execute(request, response);
		//}
		
		PrintWriter out = response.getWriter();
		if(ItemMarketService.login(id, password)>0){
			response.sendRedirect("view/index.jsp");
		}else{
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
