package controller;

import java.io.IOException;
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
		String id = request.getParameter("id");
		System.out.println("id는" + id);
		int cash = Integer.parseInt(request.getParameter("cash"));
		System.out.println(cash);
		int borderNumber = Integer.parseInt(request.getParameter("borderNumber"));
		
		String buyer = request.getParameter("buyer");
		
		
		BorderDTO border = ItemMarketService.read(borderNumber);
		
		//table_history
		TradeHistoryDTO trade = new TradeHistoryDTO(buyer, id, border.getItemName(), cash, borderNumber, "", border.getItemState());
		 
		try {
			ItemMarketService.accountTransfer(id,cash,border,trade);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}