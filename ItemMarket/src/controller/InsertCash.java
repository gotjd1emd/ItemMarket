package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.ItemMarketService;

public class InsertCash implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int cash = Integer.parseInt(request.getParameter("cash"));
		
		if(ItemMarketService.addCash(id,cash)>0){
			//수정...!! 마일리지 보이는 곳 
			//response.sendRedirect();
		}
		
		
	}

}
