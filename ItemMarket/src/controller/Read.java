package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.service.ItemMarketService;

public class Read implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String borderNumber = request.getParameter("borderNumber");
		
		BorderDTO border = ItemMarketService.read(Integer.parseInt(borderNumber));
		
		request.setAttribute("border", border);
	}

}
