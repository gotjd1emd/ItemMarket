package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.dto.BorderDTO;
import model.dto.CashHistoryDTO;
import model.dto.HistoryDTO;
import model.dto.MemoDTO;
import model.dto.TradeDTO;
import model.dto.UserDTO;

public class ItemMarketDAOImpl implements ItemMarketDAO {

	@Override
	public int login(String id, String pwd) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int signUp(UserDTO userInfo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDTO getProfile(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HistoryDTO myHistory(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CashHistoryDTO selectAllCashHistory(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addCash(String id, int cash) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BorderDTO> search(String word, String category, String subCategory) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemoDTO> memobox(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int write(BorderDTO border) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BorderDTO read(int borderNum) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int sendCashAgency(String id, int money) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int receiveCashAgency(int money) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int borderStateChange(BorderDTO border) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int trading(String id, int money, BorderDTO border) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TradeDTO> selectByIdTrade(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TradeDTO selectByBorderTrade(int borderNum) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int sendCashSeller(String id, int money) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int receiveCashSeller(int money) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int complete(String id, int money, BorderDTO border) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}



}
