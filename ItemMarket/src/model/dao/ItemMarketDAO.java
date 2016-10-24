package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.dto.BorderDTO;
import model.dto.HistoryDTO;
import model.dto.MemoDTO;
import model.dto.UserDTO;

public interface ItemMarketDAO {

	/**
	 * 1. 로그인
	 */
	
	/**
	 * 2. 회원가입
	 */
	
	/**
	 * 3. 프로필
	 * 이름, 연락처, 메일, 지역, 신용등급, 마일리지
	 */
	UserDTO getProfile(String id) throws SQLException;
	
	/**
	 * 4. 거래내역
	 * 거래날짜, 구매자, 판매자, 거래내용
	 */
	HistoryDTO myHistory(String id) throws SQLException;
	
	/**
	 * 5. 마일리지 내역
	 */
	
	
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
	 * 10. 구매 or 제시
	 */
	int buy(String id, int money, BorderDTO border) throws SQLException;
	
	/**
	 * 11. 거래진행내역
	 */
	
	/**
	 * 11. 구매완료
	 */
}
