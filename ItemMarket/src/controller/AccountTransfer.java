package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.BorderDTO;
import model.dto.TradeHistoryDTO;
import model.service.ItemMarketService;

public class AccountTransfer implements Action {

	/* �ŷ����ۺκ�10-13�� �����ϴ� �޼ҵ� (�ϳ��� connection���� �����Ѵ�.)
	 * �ŷ��� �Ǹ�, 1)�ŷ����� ���ϸ����� ���ҵǰ�
	 * 2) �߰����� ���ϸ����� �����ϸ� 
	 * 3) �ŷ� ���°� ���ϰ�
 * String id, int money, BorderDTO border(�Խ���), TradeDTO trade(�ŷ�����)
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int cash = Integer.parseInt(request.getParameter("cash"));
		
		//border��ü�� �ޱ� ���� 
		int borderNumber = Integer.parseInt(request.getParameter("borderNumber"));
		String content = request.getParameter("content");
		String itemName = request.getParameter("itemName");
		String dayDate = request.getParameter("dayDate");
		String category = request.getParameter("category");
		String subcategory = request.getParameter("subcategory");
		String itemState = request.getParameter("itemState");
		
		BorderDTO border = new BorderDTO(id, borderNumber, content, itemName, cash, dayDate, category, subcategory, itemState);
		
		//table_history ��ü�� �ޱ� ����
		String buyer = request.getParameter("buyer");

		TradeHistoryDTO trade = new TradeHistoryDTO(buyer, id, itemName, cash, borderNumber, dayDate, itemState);
		 
		try {
			ItemMarketService.accountTransfer(id,cash,border,trade);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
