package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.dto.TradeHistoryDTO;
import model.service.ItemMarketService;

public class AccountTransfer implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String buyer = request.getParameter("buyer");
		System.out.println(buyer);
		int cash = Integer.parseInt(request.getParameter("cash"));

		int borderNumber = Integer.parseInt(request.getParameter("borderNumber"));

		String seller = request.getParameter("seller");
		System.out.println(seller);
		BorderDTO border = ItemMarketService.read(borderNumber);
		
		//table_history
		TradeHistoryDTO trade = new TradeHistoryDTO(buyer, seller, border.getItemName(), cash, borderNumber, "", border.getItemState());
		 
		try {
			int result = ItemMarketService.accountTransfer(buyer,cash,border,trade);
			PrintWriter out = response.getWriter();
			out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}