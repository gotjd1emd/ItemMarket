package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.MemoDTO;
import model.service.ItemMarketService;

public class MemoBox implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		List<MemoDTO> memobox = ItemMarketService.memobox(id);
		System.out.println("memobox : " + memobox);
		request.setAttribute("memobox", memobox);
		
	}

}
