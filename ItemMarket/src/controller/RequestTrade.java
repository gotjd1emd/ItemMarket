package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.service.ItemMarketService;

public class RequestTrade implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String buyer = request.getParameter("buyer");
		String seller = request.getParameter("seller");
		int cash = Integer.parseInt(request.getParameter("cash"));
		int borderNumber = Integer.parseInt(request.getParameter("borderNumber"));
		String state = request.getParameter("state");
		
		int result = ItemMarketService.requestTrade(buyer, seller, cash, borderNumber, state);
		
		PrintWriter out = response.getWriter();
		out.println(result);
	}

}
