package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.ItemMarketService;

public class UserPassWordFind implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String id = request.getParameter("id");
			System.out.println("passwordFind id: "+ id);
			String message = ItemMarketService.userPassWordFind(id);
			
			PrintWriter out= response.getWriter();
			
			out.println(message);
	}

}
