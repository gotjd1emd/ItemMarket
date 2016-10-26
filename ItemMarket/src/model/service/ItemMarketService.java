package model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dao.ItemMarketDAO;
import model.dao.ItemMarketDAOImpl;
import model.dto.BorderDTO;
import model.dto.CashHistoryDTO;
import model.dto.TradeHistoryDTO;
import model.dto.MemoDTO;
import model.dto.UserDTO;
import util.DbUtil;


public class ItemMarketService {
	private static ItemMarketDAOImpl marketDAO = new ItemMarketDAOImpl();
	/**
	 * 1. �α���
	 * 1 - �α���, 0 - �α��ν���
	 */
	public static int login(String id, String pwd){
		int result =0;
		try{
		 result =   marketDAO.login(id, pwd);
		}catch(SQLException e){		
			e.printStackTrace();
		}return result;
	};
	
	/**
	 * 2. ȸ������
	 * 1 - ����, 0 - ���Խ���
	 */
	public static int signUp(UserDTO userInfo){
		int result = 0; 

		try{
			 result = marketDAO.signUp(userInfo);
		}catch (SQLException e){
			e.printStackTrace(); 
		}
		return result;
		}
	
	/**
	 * 3. ������
	 * ID, �̸�, ����ó, ����, ����, �ſ���, ���ϸ���
	 */
	public static UserDTO getProfile(String id){
		UserDTO  userDTO  = new UserDTO();
		try{			
			userDTO= marketDAO.getProfile(id);				
		}catch(SQLException e){		
			e.printStackTrace();
		}
		return userDTO;
	};
	
	
	/**
	 * 4. �ŷ�����
	 * �ŷ���¥, ������, �Ǹ���, �ŷ�����
	 * select * from trade_history where buyer=? or seller=?
	 */
	public static List<TradeHistoryDTO> myHistory(String id) {
		List<TradeHistoryDTO> tradelist = null;
		
		try{
			tradelist = marketDAO.myHistory(id);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return tradelist;
	}
	
	/**
	 * 5. ���ϸ��� ���� ���
	 * ������¥, ����ѳ�¥, ���� ���ϸ���
	 * select * from cash_History where id = ?
	 */
	public static List<CashHistoryDTO> selectAllCashHistory(String id) {
		List<CashHistoryDTO> cashlist = null;
		try{
			
			cashlist = marketDAO.selectAllCashHistory(id);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return cashlist;
	}
	
	/**
	 * 6. ���ϸ��� ����
	 * ����� ���� id�� ���� �Ű������� cash�� �޾� �����Ѵ�.
	 */
	public static int addCash(String id, int cash) {
		
		int result=0;
		try {
			result=marketDAO.addCash(id, cash);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
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
	
	/**
	 * 9. ���б�
	 * �̹���, ����, �ݾ�, �۳���, id
	 */
	public static BorderDTO read(int borderNum) {
		BorderDTO border = null;
		
		try {
			ItemMarketDAOImpl dao = new ItemMarketDAOImpl();
			border = dao.read(borderNum);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return border;
	}


	/**
	 * 10-13�� �����ϴ� �޼ҵ� (�ϳ��� connection���� �����Ѵ�.)
	 * �ŷ��� �Ǹ�, 1)�ŷ����� ���ϸ����� ���ҵǰ�
	 * 2) �߰����� ���ϸ����� �����ϸ� 
	 * 3) �ŷ� ���°� ���ϰ�
	 * */
	public static void accountTransfer(String id, int money, BorderDTO border) throws SQLException {
		Connection con= null;
		try{
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			
			marketDAO.sendCashAgency(con, id, money);
			marketDAO.receiveCashAgency(con, money);
			marketDAO.borderStateChange(con, border);
			marketDAO.trading(con, id, money, border);
			
			con.commit(); // ����
		}catch(SQLException e){
			con.rollback(); // ����
		}
	}

	/**
	 * 14. �ŷ����೻�� �˻�
	 */
	public static List<TradeHistoryDTO> selectByIdTrade(String id) {
		List<TradeHistoryDTO> tradelist = null;
		
		try {
			
			tradelist = marketDAO.selectByIdTrade(id);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return tradelist;
	}
}
