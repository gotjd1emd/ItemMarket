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

public class SelectRequestTrade implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String seller = request.getParameter("id");
		
		List<TradeHistoryDTO> list = ItemMarketService.selectRequestTrade(seller);
		
		PrintWriter out = response.getWriter();
		JSONArray jsonArray = JSONArray.fromObject(list);
		
		out.println(jsonArray);
	}

}
