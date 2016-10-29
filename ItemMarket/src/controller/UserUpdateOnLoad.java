package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.UserDTO;
import model.service.ItemMarketService;

public class UserUpdateOnLoad implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String id = request.getParameter("id");
			UserDTO userData = ItemMarketService.getProfile(id);
			request.getSession().setAttribute("userProfile", userData);
			int checknumber = 0;
			PrintWriter out = response.getWriter();
			
			if(userData == null){
				checknumber = 0;
			}else{
				checknumber = 1;
			}
			out.println(checknumber);
		}

}
