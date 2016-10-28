package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.dto.TradeHistoryDTO;
import model.service.ItemMarketService;
import net.sf.json.JSONArray;

public class SelectTrade implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = (String) request.getSession().getAttribute("id");
		
		System.out.println(id);
		List<TradeHistoryDTO> tradelist = ItemMarketService.myHistory(id);
		
		request.setAttribute("tradelist", tradelist);
		
		PrintWriter out = response.getWriter();
		JSONArray jsonArray = JSONArray.fromObject(tradelist);
		out.println(jsonArray);
	}
}
