package model.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import model.dto.BorderDTO;
import model.dto.CashHistoryDTO;
import model.dto.ImageDTO;
import model.dto.MemoDTO;
import model.dto.TradeHistoryDTO;
import model.dto.UserDTO;

public interface ItemMarketDAO {

	/**
	 * 1. �α���
	 * 1 - �α���, 0 - �α��ν���
	 */
	int login(String id, String pwd) throws SQLException;
	
	/**
	 * 2. ȸ������
	 * 1 - ����, 0 - ���Խ���
	 */
	int signUp(UserDTO userInfo) throws SQLException;
	
	/**
	 * 3. ������
	 * ID, �̸�, ����ó, ����, ����, �ſ���, ���ϸ���
	 */
	UserDTO getProfile(String id) throws SQLException;
	
	/**
	 * 4. �ŷ�����
	 * �ŷ���¥, ������, �Ǹ���, �ŷ�����
	 */
	List<TradeHistoryDTO> myHistory(String id) throws SQLException;
	
	/**
	 * 5. ���ϸ��� ���� ���
	 * ������¥, ����ѳ�¥, ���� ���ϸ���
	 */
	List<CashHistoryDTO> selectAllCashHistory(String id) throws SQLException;
	
	/**
	 * 6. ���ϸ��� ����
	 */
	int addCash(Connection con, String id, int cash) throws SQLException;
	
	/**
	 * 6. �˻�
	 * �Խù�
	 */
	List<BorderDTO> search(String word, String category, String subCategory, int page) throws SQLException;
	
	/**
	 * 6-1. 
	 */
	int pageNumber(String word, String category, String subCategory) throws SQLException;
	
	/**
	 * 7. �޽�����
	 * �������, �����»��, ����
	 */
	List<MemoDTO> memobox(String id) throws SQLException;
	
	/**
	 * 8. �۾���
	 * �̹���, ����, �ݾ�, �۳���, id
	 */
	int write(BorderDTO border) throws SQLException;
	
	/**
	 * 8. �۾���
	 * �̹����� �ֱ� ���� �޼ҵ�
	 * */
	int imgWrite(String imgName) throws Exception;
	
	/**
	 * 9. ���б�
	 * �̹���, ����, �ݾ�, �۳���, id
	 */
	BorderDTO read(int borderNum) throws SQLException;
	
	/**
	 * 9. ���б�
	 *  �̹����� �ֱ� ���� �޼ҵ�
	 */
	List<String> imgRead(int borderNum) throws Exception;

	/**
	 * 10. ������ ���ϸ����� �߰��ڿ���
	 * 10, 11, 12, 13������ commit, rollback
	 */
	int sendCashAgency(Connection con,String id, int money) throws SQLException;
	
	/**
	 * 11. �߰��� ���ϸ����� �����ڿ��� ������ŭ ����
	 * �߰��ڴ� user_info�� admin���� �߰��Ѵ�.
	 */
	int receiveCashAgency(Connection con,int money) throws SQLException;
	
	/**
	 * 12-1. �Խù��� �ŷ� �����Ȳ�� ������ �Ǵ� �ŷ��Ϸ�� ����(�Խ��ǿ��� �����ٰ�)
	 */
	int borderStateChange(Connection con,BorderDTO border) throws SQLException;
	
	/**
	 * 12-2. �Խù��� �ŷ� �����Ȳ�� ������ �Ǵ� �ŷ��Ϸ�� ����(�ŷ��������� �����ٰ�)
	 */
	int tradeStateChange(Connection con,TradeHistoryDTO trade) throws SQLException;
	
	/**
	 * 13. �ŷ����೻�� �߰�
	 */
	int trading(Connection con,String id, int money, BorderDTO border) throws SQLException;
	
	
	/**
	 * 15. �ش� �Խù��� ���� �ŷ����೻�� �˻�
	 */
	TradeHistoryDTO selectByBorderTrade(Connection con, int borderNumber) throws SQLException;
	
	/**
	 * 16. �߰��� ���ϸ����� �Ǹ��ڿ���
	 * 15, 16, 17, 12, 18������ commit �Ǵ� rollback
	 */
	int sendCashSeller(Connection con, String id, int money) throws SQLException;
	
	/**
	 * 17. �߰����� ���ϸ��� ����
	 */
	int receiveCashSeller(Connection con, int money) throws SQLException;
	
	/**
	 * 18-1. ���ſϷ� ���೻���� ����
	 */
	int completeBorder(Connection con,BorderDTO border) throws SQLException;
	/**
	 * 18-2. ���ſϷ� ���೻���� ����(�ŷ��������� )
	 */
	int completeTrade(Connection con,TradeHistoryDTO trade) throws SQLException;
	
	
	/**
	 * �ŷ��� ���ϸ��� ���� �߰�
	 * 
	 */
	int updateCashHistory(Connection con, String id, String itemName, int money, int currentCash) throws SQLException;
	
	/**
	 * ����� ���� ����
	 * */
	int userDelete(String id, String pw) throws SQLException;

	
	
	/**
	 * ����� ���� ����
	 * */
	int userUpdate(String id , String email, String tel, String location) throws SQLException;
	
	/**
	 * ��й�ȣ ��ġ��
	 * */
	int userPasswordUpdate(String id, String password , String newPassword) throws SQLException;

	/**
	 *  id,password ��ġ��
	 * */
	UserDTO userUpdateCheck(String id, String password) throws SQLException;
	
	
	/**
	 * passwordfind
	 * */
	String userPassWordFind(String id)throws SQLException;

	
}