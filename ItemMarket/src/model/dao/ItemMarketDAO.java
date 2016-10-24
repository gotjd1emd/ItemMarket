package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.dto.BorderDTO;
import model.dto.HistoryDTO;
import model.dto.MemoDTO;
import model.dto.UserDTO;

public interface ItemMarketDAO {

	/**
	 * 1. �α���
	 */
	
	/**
	 * 2. ȸ������
	 */
	
	/**
	 * 3. ������
	 * �̸�, ����ó, ����, ����, �ſ���, ���ϸ���
	 */
	UserDTO getProfile(String id) throws SQLException;
	
	/**
	 * 4. �ŷ�����
	 * �ŷ���¥, ������, �Ǹ���, �ŷ�����
	 */
	HistoryDTO myHistory(String id) throws SQLException;
	
	/**
	 * 5. ���ϸ��� ����
	 */
	
	
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
	
	/**
	 * 10. ���� or ����
	 */
	int buy(String id, int money, BorderDTO border) throws SQLException;
	
	/**
	 * 11. �ŷ����೻��
	 */
	
	/**
	 * 11. ���ſϷ�
	 */
}
