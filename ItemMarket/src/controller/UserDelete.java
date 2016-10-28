package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.ItemMarketService;

public class UserDelete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		try{
		String id = request.getParameter("id");
		String pw = request.getParameter("password");

		String url = "/view/index.jsp";
		int result = ItemMarketService.userDelete(id, pw);
		ServletContext application =request.getServletContext();

		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
