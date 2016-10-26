package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.service.ItemMarketService;

public class Search implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String word = request.getParameter("word");
		String category = request.getParameter("category");
		String subCategory = request.getParameter("subCategory");
		String page = request.getParameter("page");

		List<BorderDTO> list = ItemMarketService.search(word, category, subCategory);
		
		request.setAttribute("list", list);
		request.setAttribute("word", word);
		request.setAttribute("category", category);
		request.setAttribute("subCategory", subCategory);
		request.getRequestDispatcher("view/noticeboard.jsp").forward(request, response);
	}

}
