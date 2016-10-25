package model.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import model.dto.BorderDTO;
import model.dto.CashHistoryDTO;
import model.dto.HistoryDTO;
import model.dto.MemoDTO;
import model.dto.TradeDTO;
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
	HistoryDTO myHistory(String id) throws SQLException;
	
	/**
	 * 5. ���ϸ��� ���� ���
	 * ������¥, ����ѳ�¥, ���� ���ϸ���
	 */
	CashHistoryDTO selectAllCashHistory(String id) throws SQLException;
	
	/**
	 * 6. ���ϸ��� ����
	 */
	int addCash(String id, int cash) throws SQLException;
	
	/**
	 * 6. �˻�
	 * �Խù�
	 */
	List<BorderDTO> search(String word, String category, String subCategory) throws SQLException;
	
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
	 * 9. ���б�
	 * �̹���, ����, �ݾ�, �۳���, id
	 */
	BorderDTO read(int borderNum) throws SQLException;
	
	void accountTransfer(String id, int money, BorderDTO border) throws SQLException;
	/**
	 * 10. ������ ���ϸ����� �߰��ڿ���
	 * 10, 11, 12, 13������ commit, rollback
	 */
	int sendCashAgency(Connection con,String id, int money) throws SQLException;
	
	/**
	 * 11. �߰��� ���ϸ����� �����ڿ��� ������ŭ ����
	 */
	int receiveCashAgency(Connection con,int money) throws SQLException;
	
	/**
	 * 12. �Խù��� �ŷ� �����Ȳ�� ������ �Ǵ� �ŷ��Ϸ�� ����
	 */
	int borderStateChange(Connection con,BorderDTO border) throws SQLException;
	
	/**
	 * 13. �ŷ����೻�� �߰�
	 */
	int trading(Connection con,String id, int money, BorderDTO border) throws SQLException;
	
	/**
	 * 14. �ŷ����೻�� �˻�
	 */
	List<TradeDTO> selectByIdTrade(String id) throws SQLException;
	
	/**
	 * 15. �ش� �Խù��� ���� �ŷ����೻�� �˻�
	 */
	TradeDTO selectByBorderTrade(int borderNum) throws SQLException;
	
	/**
	 * 16. �߰��� ���ϸ����� �Ǹ��ڿ���
	 * 15, 16, 17, 12, 18������ commit �Ǵ� rollback
	 */
	int sendCashSeller(String id, int money) throws SQLException;
	
	/**
	 * 17. �߰����� ���ϸ��� ����
	 */
	int receiveCashSeller(int money) throws SQLException;
	
	/**
	 * 18. ���ſϷ� ���೻���� ����
	 */
	int complete(String id, int money, BorderDTO border) throws SQLException;
	
}
