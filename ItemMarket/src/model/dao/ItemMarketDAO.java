package model.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import model.dto.BorderDTO;
import model.dto.CashHistoryDTO;
import model.dto.MemoDTO;
import model.dto.TradeHistoryDTO;
import model.dto.UserDTO;

public interface ItemMarketDAO {

	/**
	 * 1. 로그인
	 * 1 - 로그인, 0 - 로그인실패
	 */
	int login(String id, String pwd) throws SQLException;
	
	/**
	 * 2. 회원가입
	 * 1 - 가입, 0 - 가입실패
	 */
	int signUp(UserDTO userInfo) throws SQLException;
	
	/**
	 * 3. 프로필
	 * ID, 이름, 연락처, 메일, 지역, 신용등급, 마일리지
	 */
	UserDTO getProfile(String id) throws SQLException;
	
	/**
	 * 4. 거래내역
	 * 거래날짜, 구매자, 판매자, 거래내용
	 */
	List<TradeHistoryDTO> myHistory(String id) throws SQLException;
	
	/**
	 * 5. 마일리지 내역 출력
	 * 충전날짜, 사용한날짜, 남은 마일리지
	 */
	List<CashHistoryDTO> selectAllCashHistory(String id) throws SQLException;
	
	/**
	 * 6. 마일리지 충전
	 */
	int addCash(String id, int cash) throws SQLException;
	
	/**
	 * 6. 검색
	 * 게시물
	 */
	List<BorderDTO> search(String word, String category, String subCategory) throws SQLException;
	
	/**
	 * 7. 메신저함
	 * 받은사람, 보내는사람, 내용
	 */
	List<MemoDTO> memobox(String id) throws SQLException;
	
	/**
	 * 8. 글쓰기
	 * 이미지, 지역, 금액, 글내용, id
	 */
	int write(BorderDTO border) throws SQLException;
	
	/**
	 * 9. 글읽기
	 * 이미지, 지역, 금액, 글내용, id
	 */
	BorderDTO read(int borderNum) throws SQLException;
	
	
	/**
	 * 10. 구매자 마일리지를 중개자에게
	 * 10, 11, 12, 13순서로 commit, rollback
	 */
	int sendCashAgency(Connection con,String id, int money) throws SQLException;
	
	/**
	 * 11. 중개자 마일리지를 구매자에게 받은만큼 증가
	 * 중개자는 user_info의 admin으로 추가한다.
	 */
	int receiveCashAgency(Connection con,int money) throws SQLException;
	
	/**
	 * 12. 게시물의 거래 진행상황을 진행중 또는 거래완료로 변경
	 */
	int borderStateChange(Connection con,BorderDTO border) throws SQLException;
	
	/**
	 * 13. 거래진행내역 추가
	 */
	int trading(Connection con,String id, int money, BorderDTO border) throws SQLException;
	
	/**
	 * 14. 거래진행내역 검색
	 */
	List<TradeHistoryDTO> selectByIdTrade(String id) throws SQLException;
	
	/**
	 * 15. 해당 게시물에 대한 거래진행내역 검색
	 */
	TradeHistoryDTO selectByBorderTrade(int borderNum) throws SQLException;
	
	/**
	 * 16. 중개소 마일리지를 판매자에게
	 * 15, 16, 17, 12, 18순서로 commit 또는 rollback
	 */
	int sendCashSeller(String id, int money) throws SQLException;
	
	/**
	 * 17. 중개소의 마일리지 감소
	 */
	int receiveCashSeller(int money) throws SQLException;
	
	/**
	 * 18. 구매완료 진행내역에 삭제
	 */
	int complete(String id, int money, BorderDTO border) throws SQLException;
	
	/**
	 * 거래중 마일리지 내역 추가
	 * 
	 */
	int updateCashHistory(String id, String itemName, int money, int currentCash) throws SQLException;
	
	
}
