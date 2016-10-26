package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.CashHistoryDTO;
import model.dto.TradeHistoryDTO;
import model.service.ItemMarketService;

public class SelectCash implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		List<CashHistoryDTO> cashlist = ItemMarketService.selectAllCashHistory(id);
		
		request.setAttribute("cashlist", cashlist);

	}

}
