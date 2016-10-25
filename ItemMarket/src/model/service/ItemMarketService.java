package model.service;

import java.sql.SQLException;
import java.util.List;

import model.dao.ItemMarketDAOImpl;
import model.dto.BorderDTO;

public class ItemMarketService {
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
