package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.dto.TradeHistoryDTO;
import model.dto.UserDTO;
import model.service.ItemMarketService;

public class TransferComplete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String buyer = request.getParameter("buyer");
		String seller = request.getParameter("seller");
		int cash = Integer.parseInt(request.getParameter("cash"));
		int borderNumber = Integer.parseInt(request.getParameter("borderNumber"));
		
		UserDTO buyerDTO = ItemMarketService.getProfile(buyer);
		UserDTO sellerDTO = ItemMarketService.getProfile(seller);
		BorderDTO border = ItemMarketService.read(borderNumber);
		System.out.println("buyerDTO.getId(): " + buyer);
		System.out.println("seller: " + seller);
		//trade����
		TradeHistoryDTO trade = new TradeHistoryDTO(buyer, seller, border.getItemName(), cash, borderNumber, "거래완료");
		border.setItemState(trade.getTradeState());
		
		try {
			int result = ItemMarketService.transferComplete(buyerDTO, sellerDTO, cash, border, trade);
			
			PrintWriter out = response.getWriter();
			out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
