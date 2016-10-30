package model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dao.ItemMarketDAO;
import model.dao.ItemMarketDAOImpl;
import model.dto.BorderDTO;
import model.dto.CashHistoryDTO;
import model.dto.ImageDTO;
import model.dto.TradeHistoryDTO;
import model.dto.MemoDTO;
import model.dto.UserDTO;
import util.DbUtil;


public class ItemMarketService {
	private static ItemMarketDAOImpl marketDAO = new ItemMarketDAOImpl();
	
	public static int login(String id, String pwd){
		int result =0;
		try{
		 result = marketDAO.login(id, pwd);
		}catch(SQLException e){		
			e.printStackTrace();
		}return result;
	};
	
	public static int signUp(UserDTO userInfo){
		int result = 0; 

		try{
			 result = marketDAO.signUp(userInfo);
		}catch (SQLException e){
			e.printStackTrace(); 
		}
		return result;
		}
	
	public static UserDTO getProfile(String id){
		UserDTO  userDTO  = new UserDTO();
		try{			
			userDTO= marketDAO.getProfile(id);				
		}catch(SQLException e){		
			e.printStackTrace();
		}
		return userDTO;
	};
	
	
	public static List<TradeHistoryDTO> myHistory(String id) {
		List<TradeHistoryDTO> tradelist = null;
		
		try{
			tradelist = marketDAO.myHistory(id);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return tradelist;
	}
	
	public static List<CashHistoryDTO> selectAllCashHistory(String id) {
		List<CashHistoryDTO> cashlist = null;
		try{
			
			cashlist = marketDAO.selectAllCashHistory(id);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return cashlist;
	}
	
	public static int addCash(String id, int cash) {
		Connection con = null;
		UserDTO userDTO = null;
		int result=0;
		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			result = marketDAO.addCash(con, id, cash);
			if(result==1) {
				userDTO = marketDAO.getProfile(id);
				userDTO.setCash(userDTO.getCash()+cash);
			}else {
				throw new SQLException();
			}
			result = marketDAO.updateCashHistory(con, id, "마일리지 충전", cash, userDTO.getCash());
			
			
			if(result==1) {
				con.commit();
			}
		} catch (SQLException e) {
			try {
			con.rollback();
			}catch(Exception e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
			con.setAutoCommit(true);
			con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/**
	 * 6. 
	 * 
	 * select * from borderinfo where category = ? and sub_category= ?" 
	 */
	public static List<BorderDTO> search(String word, String category, String subCategory, int page) {
		List<BorderDTO> list = null;
		
		try {
			list = marketDAO.search(word, category, subCategory, page);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 6-1.
	 */
	public static int pageNumber(String word, String category, String subCategory) {
		int rowNumber = 0;
		
		try {
			rowNumber = marketDAO.pageNumber(word, category, subCategory);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rowNumber;
	}


	/**
	 * 7. 
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
	 * 8.
	 */
	public static int write(BorderDTO borderDTO){
		ItemMarketDAOImpl dao = new ItemMarketDAOImpl();
		int result = 0;
		try{
			result = dao.write(borderDTO);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	/**
	 * 8.
	 * */
	public static int imgWrite(String imgName){
		int result = 0;
		try {
			result = marketDAO.imgWrite(imgName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 9. 
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
	 * 8.
	 * */
	public static List<String> imgRead(int borderNum){

		List<String> imgList = null;
		
		try {
			imgList = marketDAO.imgRead(borderNum);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return imgList;
	}


	/**
	 * 10-13
	 * */
	public static int accountTransfer(String id, int money, BorderDTO border, TradeHistoryDTO trade) throws SQLException {
		Connection con= null;
		int result = 0;
		try{
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			
			marketDAO.sendCashAgency(con, id, money);
			marketDAO.receiveCashAgency(con, money);
			marketDAO.borderStateChange(con, border);
			marketDAO.tradeStateChange(con, trade);
			if(marketDAO.trading(con, id, money, border)>0){
				System.out.println("됬다구");
			}
			
			con.commit();
			result = 1;
		}catch(SQLException e){
			result = 0;
			con.rollback();
		}finally{
			con.setAutoCommit(true);
			con.close();
		}
		return result;
	}


	/**
	 * 15-18
	 * @throws SQLException 
	 * */
	public static void transferComplete(String id, int money, BorderDTO border, TradeHistoryDTO trade) throws SQLException {
		Connection con = null;
		try{
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			
			int currentCash = marketDAO.getProfile(id).getCash();
			marketDAO.selectByBorderTrade(con, border.getBorderNumber());
			marketDAO.sendCashSeller(con, id, money);
			marketDAO.receiveCashSeller(con, money);
			
			marketDAO.completeBorder(con, border);
			marketDAO.completeTrade(con, trade);
			marketDAO.updateCashHistory(con, id, border.getItemName(), money, currentCash);
			
			con.setAutoCommit(true);//�ڵ�Ŀ�Լ�������
			con.commit(); // ����
		}catch(SQLException e){
			con.rollback(); // öȸ
		}finally{
			con.close();
		}
	}
	
	/**
	 * 19.
	 * */
	public static int userDelete(String id, String pw){
		int result =0;
		try{
		result= marketDAO.userDelete(id, pw);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 20.
	 * */
	public static int userUpdate(String id , String email,String tel,String location){
		int result =0;
		try{
			result = marketDAO.userUpdate(id, email, tel, location);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 21. 
	 * */
	public static int userPasswordUpdate(String id , String password, String newPassword){
		int result = 0;
		System.out.println(id + password + newPassword);
		try{
			result = marketDAO.userPasswordUpdate(id, password, newPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 22. 
	 * */
	public static UserDTO userUpdateCheck(String id , String password){
		UserDTO  userDTO  = new UserDTO();
		try{			
			userDTO= marketDAO.userUpdateCheck(id, password);			
		}catch(SQLException e){		
			e.printStackTrace();
		}
		return userDTO;

	}	

	/**
	 * 23
	 * */
	public static String userPassWordFind(String id){
		String message ="";
		try{
			message = marketDAO.userPassWordFind(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return message;
	}
	
	/**
	 * 24 requestTrade
	 */
	public static int requestTrade(String buyer, String seller, int cash, int borderNumber) {
		int result = 0;
		
		try {
			result = marketDAO.requestTrade(buyer, seller, cash, borderNumber);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 25 selectRequestTrade
	 */
	public static List<TradeHistoryDTO> selectRequestTrade(String seller) {
		List<TradeHistoryDTO> list = null;
		
		try {
			list = marketDAO.selectRequestTrade(seller);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}


