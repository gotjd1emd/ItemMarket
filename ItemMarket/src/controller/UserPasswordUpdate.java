package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.ItemMarketService;

public class UserPasswordUpdate implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("checkid");
		String password=  request.getParameter("password");
		String newPassword = request.getParameter("newpassword");
		
		int result = ItemMarketService.userPasswordUpdate(id, password, newPassword);
		PrintWriter out = response.getWriter();
		out.println(result);
	}

}
