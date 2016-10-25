package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.BorderDTO;
import model.dto.CashHistoryDTO;
import model.dto.HistoryDTO;
import model.dto.MemoDTO;
import model.dto.TradeDTO;
import model.dto.UserDTO;
import util.DbUtil;

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

	/**
	 * 8. �۾���
	 * �̹���, ����, �ݾ�, �۳���, id
	 */
	@Override
	public int write(BorderDTO border) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result=0;
		try{
			con = DbUtil.getConnection();
			ps = con.prepareStatement("insert into borderInfo values (?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1, border.getId());
			ps.setString(2, border.getBorderNumber());
			ps.setString(3, border.getContent());
			ps.setString(4, border.getItemName());
			ps.setInt(5, border.getMoney());
			ps.setString(6, border.getDayDate());
			ps.setString(7, border.getCategory());
			ps.setString(8, border.getSubcategory());
			ps.setString(9, border.getItemState());
			
			result = ps.executeUpdate();
		}finally{
			DbUtil.dbClose(con, ps, null);
		}
		return result;
	}

	/**
	 * 9. ���б�
	 * �̹���, ����, �ݾ�, �۳���, id
	 */
	@Override
	public BorderDTO read(int borderNum) throws SQLException {
		
		  Connection con = null;
		  PreparedStatement ps = null;
		  ResultSet rs = null;
		  BorderDTO border=null;
		  try{
			  con = DbUtil.getConnection();
			  ps = con.prepareStatement("select * from borderInfo where border_number=?");
			  	ps.setString(1, Integer.toString(borderNum));
			  	rs = ps.executeQuery();
			  	
			  	if(rs.next()){
			  			border = new BorderDTO(rs.getString("id"), rs.getString("border_number"),rs.getString("content"),
						rs.getString("itemName"),rs.getInt("money"), rs.getString("dayDate"), rs.getString("category"),
						rs.getString("sub_category"), rs.getString("itemState"));
			  	}
		  }catch(SQLException sel){
			  sel.printStackTrace();
		  }finally{
			  DbUtil.dbClose(con, ps, rs);
		  }
		  
		  return border;
	  }
	
	/**
	 * 10-13�� �����ϴ� �޼ҵ� (�ϳ��� connection���� �����Ѵ�.)
	 * 	 
	 * */
	@Override
	public void accountTransfer(String id, int money, BorderDTO border) throws SQLException {
		Connection con= null;
		try{
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			
			sendCashAgency(con, id, money);
			receiveCashAgency(con, money);
			borderStateChange(con, border);
			trading(con, id, money, border);
			
			con.commit(); // ����
		}catch(SQLException e){
			con.rollback();
		}
		
	}
	
	/**
	 * 10. ������ ���ϸ����� �߰��ڿ���
	 * 10, 11, 12, 13������ commit, rollback
	 */
	@Override
	public int sendCashAgency(Connection con, String id, int money) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		 try{
			 ps = con.prepareStatement("update userinfo set cash=(select cash from userinfo where id=?)-? where id=?");
			 ps.setString(1, id);
			 ps.setInt(2, money);
			 ps.setString(3, id);
			  
			 result = ps.executeUpdate();
		 }finally{
			 DbUtil.dbClose(con, ps, null);
		 }
		   return result;
	}

	/**
	 * 11. �߰��� ���ϸ����� �����ڿ��� ������ŭ ����
	 */
	@Override
	public int receiveCashAgency(Connection con,int money) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		 try{
			      
			  ps = con.prepareStatement("update trading set cash = (select cash from trading) + ?");
			  ps.setInt(1, money);
			  result = ps.executeUpdate();
			  
		   }finally{
			   DbUtil.dbClose(con, ps, null);
		   }
		   
		   return result;
	}

	/**
	 * 12. �Խù��� �ŷ� �����Ȳ�� ������ / �ŷ��Ϸ�� ����
	 * 10���� �������� borderStateChange�� �ؼ� ���������� �ٲٰ�, ��ư�� �������� �ŷ��Ϸ�� ����
	 */
	@Override
	public int borderStateChange(Connection con,BorderDTO border) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		 try{
			
			  ps = con.prepareStatement("update borderInfo set itemState = ? where id=?");
			  ps.setString(1,"�ŷ���" );
			  ps.setString(2, border.getId());
			  result = ps.executeUpdate();
			  
		   }finally{
			   DbUtil.dbClose(con, ps, null);
		   }
		   
		   return result;
	}

	/**
	 * 13. �ŷ����೻�� �߰�
	 */
	@Override
	public int trading(Connection con, String id, int money, BorderDTO border) throws SQLException {
		
		PreparedStatement ps= null;
		int result = 0;
		try{
			con = DbUtil.getConnection();
			ps = con.prepareStatement("insert into myHistory values (sysdate,?,?,?,?,?,?)");
			ps.setString(1, id);	//��Ա���������
			ps.setString(2, border.getId()); // ��Ա���������
			ps.setString(3, border.getCategory());
			ps.setString(4,border.getSubcategory());
			ps.setString(5, border.getItemName());
			ps.setInt(6, border.getMoney());
			
			result = ps.executeUpdate();

			con.setAutoCommit(true);//����Ŀ���� true�δٽú���
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtil.dbClose(con, ps, null);
		  }
		return result;
		
	}
	
	/**
	 * 14. �ŷ����೻�� �˻�
	 */
	@Override
	public List<TradeDTO> selectByIdTrade(String id) throws SQLException {
		  Connection con = null;
		  PreparedStatement ps = null;
		  ResultSet rs = null;
		  List<TradeDTO> list = new ArrayList<>();
		  
		  try{
			con = DbUtil.getConnection();
			//�Ĵ� ��� �������� ã�°���? ��� 
			ps = con.prepareStatement("select * from trading where seller = ?");
			
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				TradeDTO dto = new TradeDTO(rs.getString("buyer"), 
						rs.getString("seller"), 
						rs.getString("itemName"), 
						rs.getInt("cash"),
						rs.getString("border_number"), 
						rs.getString("daydate"));
				
				list.add(dto);
			}
			  
		  }catch(SQLException e){
			  e.printStackTrace();
		  }finally{
			  DbUtil.dbClose(con, ps, rs);
		  }
		  return list;
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
