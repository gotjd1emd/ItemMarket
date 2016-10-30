package controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		int result = marketService.signUp(userInfo);
		PrintWriter out = response.getWriter();
		if(result == 0){
			request.getSession().invalidate();
		}
		out.println(result);
	}
}
