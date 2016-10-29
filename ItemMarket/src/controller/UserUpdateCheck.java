package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.UserDTO;
import model.service.ItemMarketService;

public class UserUpdateCheck implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String id = request.getParameter("id");
			String pw = request.getParameter("password");
			
			UserDTO userData = ItemMarketService.userUpdateCheck(id, pw);
			request.getSession().setAttribute("userProfile", userData);
			int numberCheck= 0;
			if(userData == null){
				numberCheck = 0; 
			}else{
				numberCheck = 1;
			}
			PrintWriter out = response.getWriter();
			out.println(numberCheck);
		
	}

}
