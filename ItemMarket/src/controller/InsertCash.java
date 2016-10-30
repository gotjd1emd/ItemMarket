package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.UserDTO;
import model.service.ItemMarketService;

public class InsertCash implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("id"+id);
		int chargeNumber = Integer.parseInt(request.getParameter("chargeNumber"));
		System.out.println("chargeNumber"+chargeNumber);
		int result = ItemMarketService.addCash(id,chargeNumber);
		System.out.println("결과"+result);
		
		UserDTO userProfile = ItemMarketService.getProfile(id);
		request.getSession().setAttribute("userProfile", userProfile);
		
		int checkpoint= 0;	
		
		if(result == 0){
			checkpoint = 0;
		}else{
			checkpoint = 1;
		}
		PrintWriter out = response.getWriter();
		out.println(checkpoint);

	}

}
