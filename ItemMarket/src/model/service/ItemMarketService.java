package model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dao.ItemMarketDAOImpl;
import model.dto.BorderDTO;
import model.dto.MemoDTO;

public class ItemMarketService {
	/**
	 * 6. �˻�
	 * �Խù�
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
	
	/**
	 * 7. �޽�����
	 * �������, �����»��, ����
	 */
	public static List<MemoDTO> memobox(String id){
		List<MemoDTO> list = new ArrayList<>();
		ItemMarketDAOImpl dao = new ItemMarketDAOImpl();
		try{
			list = dao.memobox(id);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 8. �۾���
	 * �̹���, ����, �ݾ�, �۳���, id
	 */
	public static int write(BorderDTO borderDTO){
		ItemMarketDAOImpl dao = new ItemMarketDAOImpl();
		int result = 0;
		try{
			result = dao.write(borderDTO);
			result = dao.imgWrite(borderDTO.getBorderNumber());
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
		return result;
	}
}
