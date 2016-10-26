package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.service.ItemMarketService;

public class Write implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String imgName = request.getParameter("fileName0");
		BorderDTO borderDTO = null;
		ItemMarketService.write(borderDTO);
		ItemMarketService.imgWrite(borderDTO.getBorderNumber(), imgName);
	}

}
