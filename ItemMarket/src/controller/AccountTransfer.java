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

public class AccountTransfer implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String buyer = request.getParameter("buyer");
		String seller = request.getParameter("seller");
		int cash = Integer.parseInt(request.getParameter("cash"));
		int borderNumber = Integer.parseInt(request.getParameter("borderNumber"));
		
		UserDTO buyerDTO = ItemMarketService.getProfile(buyer);
		BorderDTO border = ItemMarketService.read(borderNumber);
		System.out.println("buyerDTO.getId(): " + buyer);
		System.out.println("seller: " + seller);
		
		//table_history
		TradeHistoryDTO trade = new TradeHistoryDTO(buyer, seller, border.getItemName(), cash, borderNumber, "거래중");
		
		try {
			int result = ItemMarketService.accountTransfer(buyerDTO,cash,border,trade);
			if(result>0) {
				ItemMarketService.requestTrade(buyer, seller, cash, borderNumber, "buy");//援щℓ�옄�뿉寃� �솗�씤踰꾪듉 �쟾�넚
			}
			PrintWriter out = response.getWriter();
			out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}