package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.UserDTO;
import model.service.ItemMarketService;

public class SignUp implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ItemMarketService marketService = new ItemMarketService();
		
		String id  =request.getParameter("id");
		String password =request.getParameter("password");
		String tel =request.getParameter("tel");
		String email  =request.getParameter("email");
		String location =request.getParameter("addr"); 
		int cash =Integer.parseInt(request.getParameter("cash")); 
		UserDTO userInfo = new UserDTO(id,password,tel,email,location,cash);
//new UserDTO(id, password, tel, email, location, cash);
		//int result = 0;
		//result = marketService.signUp(userInfo);				
		//if (result==1){
			//request.setAttribute("userInfo", userInfo);
		//}
		if(marketService.signUp(userInfo)>0){
			response.sendRedirect("view/index.jsp");
		}
	
	}
}
