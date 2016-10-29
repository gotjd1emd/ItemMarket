package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.dto.ImageDTO;
import model.dto.UserDTO;
import model.service.ItemMarketService;

public class Read implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String borderNumber = request.getParameter("border_number");
		
		BorderDTO border = ItemMarketService.read(Integer.parseInt(borderNumber));
		request.setAttribute("border", border);
		
		//로그인 아이디 받기
		String id = request.getParameter("id");
		System.out.println(id);
		UserDTO user = ItemMarketService.getProfile(id);
		
		request.setAttribute("user", user);
		
		//2. 

		List<ImageDTO> imagelist = ItemMarketService.imgRead(Integer.parseInt(borderNumber));
		
		for(int i=0;i<imagelist.size();i++){
			String imgName = imagelist.get(i).getImg();
		}
		request.setAttribute("imagelist", imagelist);
			
		//상세설명으로 들어가기
		request.getRequestDispatcher("view/Explanation.jsp").forward(request, response);		
	}				
}