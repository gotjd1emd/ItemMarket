package model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dao.ItemMarketDAO;
import model.dao.ItemMarketDAOImpl;
import model.dto.BorderDTO;
import model.dto.TradeHistoryDTO;

public class ItemMarketService {
	/**
	 * 4. 거래내역
	 * 거래날짜, 구매자, 판매자, 거래내용
	 * select * from trade_history where buyer=? or seller=?
	 */
	public static List<TradeHistoryDTO> myHistory(String id) {
		List<TradeHistoryDTO> tradelist = null;
		
		try{
			ItemMarketDAOImpl dao = new ItemMarketDAOImpl();
			tradelist = dao.myHistory(id);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return tradelist;
	}
	/**
	 * 6. 검색
	 * 게시물
	 * 
	 * select * from borderinfo where category = ? and sub_category= ?" 
	 */
	public static List<BorderDTO> search(String word, String category, String subCategory) {
		List<BorderDTO> list = null;
		
		try {
			ItemMarketDAOImpl dao = new ItemMarketDAOImpl();
			list = dao.search(word, category, subCategory);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	
}
