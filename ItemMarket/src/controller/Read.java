package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.dto.UserDTO;
import model.service.ItemMarketService;

public class Read implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String borderNumber = request.getParameter("border_number");
		
		BorderDTO border = ItemMarketService.read(Integer.parseInt(borderNumber));
		List<String> imgList = ItemMarketService.imgRead(Integer.parseInt(borderNumber));
		border.setImgList(imgList);
		request.setAttribute("border", border);
		
		//판매장 정보를 얻기 위해 필요한 것 
		String id = request.getParameter("id");
		System.out.println(id);
		UserDTO user = ItemMarketService.getProfile(id);
		
		request.setAttribute("user", user);

		//상세설명으로 이동.
		request.getRequestDispatcher("view/Explanation.jsp").forward(request, response);		
	}				
}