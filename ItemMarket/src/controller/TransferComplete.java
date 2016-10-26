package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.dto.TradeHistoryDTO;
import model.service.ItemMarketService;

public class TransferComplete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int borderNumber = Integer.parseInt(request.getParameter("borderNumber"));
		
		String id = request.getParameter("id");
		int money = Integer.parseInt(request.getParameter("money"));
		
		//border내용
		String content = request.getParameter("content");
		String itemName = request.getParameter("itemName");
		String dayDate = request.getParameter("dayDate");
		String category = request.getParameter("category");
		String subCategory = request.getParameter("subCategory");
		String itemState = request.getParameter("itemState");
		
		BorderDTO border = new BorderDTO(id, borderNumber, content, itemName, money, dayDate, category, subCategory, itemState);
		
		//trade내용
		String buyer = request.getParameter("buyer");
		
		TradeHistoryDTO trade = new TradeHistoryDTO(buyer, id, itemName, money, borderNumber, dayDate, itemState);
		
		try {
			ItemMarketService.transferComplete(id,money,border,trade);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
