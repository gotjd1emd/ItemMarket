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
	 * 1. 로그인
	 * 1 - 로그인, 0 - 로그인실패
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
	 * 2. 회원가입
	 * 1 - 가입, 0 - 가입실패
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
	 * 3. 프로필
	 * ID, 이름, 연락처, 메일, 지역, 신용등급, 마일리지
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
	 * 4. 거래내역
	 * 거래날짜, 구매자, 판매자, 거래내용
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
	 * 5. 마일리지 내역 출력
	 * 충전날짜, 사용한날짜, 남은 마일리지
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
	 * 6. 마일리지 충전
	 * 사용자 정보 id에 따라 매개변수인 cash를 받아 수정한다.
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

	/**
	 * 7. 메신저함
	 * 받은사람, 보내는사람, 내용
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
	 * 8. 글쓰기
	 * 이미지, 지역, 금액, 글내용, id
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
	 * 9. 글읽기
	 * 이미지, 지역, 금액, 글내용, id
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
	 * 10-13을 실행하는 메소드 (하나의 connection으로 연결한다.)
	 * 거래가 되면, 1)거래자의 마일리지가 감소되고
	 * 2) 중개자의 마일리지는 증가하며 
	 * 3) 거래 상태가 변하고
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
			
			con.commit(); // 성공
		}catch(SQLException e){
			con.rollback(); // 실패
		}
	}

	/**
	 * 14. 거래진행내역 검색
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
