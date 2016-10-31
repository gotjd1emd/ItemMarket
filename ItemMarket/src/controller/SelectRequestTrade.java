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
		String id = request.getParameter("id");
		
		List<TradeHistoryDTO> list = ItemMarketService.sellRequestTrade(id);
		List<TradeHistoryDTO> temp = ItemMarketService.buyRequestTrade(id);
		for(TradeHistoryDTO tHistory : temp) {
			list.add(tHistory);
		}
 		
		PrintWriter out = response.getWriter();
		JSONArray jsonArray = JSONArray.fromObject(list);
		
		out.println(jsonArray);
	}

}
