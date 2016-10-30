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
		

		String id  = request.getParameter("id");		
		String password = request.getParameter("password");
		int result = ItemMarketService.login(id, password);
		int checkpoint= 0;	
		
			System.out.println("»ðÀÔ µÊ.");
			
			UserDTO userProfile = ItemMarketService.getProfile(id);
			request.getSession().setAttribute("userProfile", userProfile);
			if(result == 0 && userProfile == null ){
				checkpoint = 0;
			}else{
				checkpoint = 1;
			}
			PrintWriter out = response.getWriter();
			out.println(checkpoint);
			


		}
		
	}
		
	
