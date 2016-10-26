package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.service.ItemMarketService;

public class AccountTransfer implements Action {

	/* 거래시작부분10-13을 실행하는 메소드 (하나의 connection으로 연결한다.)
	 * 거래가 되면, 1)거래자의 마일리지가 감소되고
	 * 2) 중개자의 마일리지는 증가하며 
	 * 3) 거래 상태가 변하고
 * String id, int money, BorderDTO border
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int cash = Integer.parseInt(request.getParameter("cash"));
		
		//border객체를 받기 위해 
		String borderNumber = request.getParameter("borderNumber");
		String content = request.getParameter("content");
		String itemName = request.getParameter("itemName");
		String dayDate = request.getParameter("dayDate");
		String category = request.getParameter("category");
		String subcategory = request.getParameter("subcategory");
		String itemState = request.getParameter("itemState");
		
		BorderDTO border = new BorderDTO(id, Integer.parseInt(borderNumber), content, itemName, cash, dayDate, category, subcategory, itemState);
		try {
			ItemMarketService.accountTransfer(id,cash,border);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
