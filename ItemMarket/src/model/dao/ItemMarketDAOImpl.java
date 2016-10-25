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
import oracle.net.aso.r;
import util.DbUtil;

public class ItemMarketDAOImpl implements ItemMarketDAO {

	
	//1. 로그인	
	@Override
	public int login(String id, String pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		UserDTO userDTO = null;
		String sql = " select * from userinfo where id = ? and pwd = ?";
		//String sql = "select id,pw,tel from usertable where id = ? & pwd = ? ";
		
		try{
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs= ps.executeQuery();
			if(rs.next()){
			 result =1;			
			}
		}catch(SQLException e){
			e.printStackTrace();
			
		}finally{
			DbUtil.dbClose(con, ps, rs);
		}
		return result;
	
	}
	
	/**
	 * 2. 회원가입
	 * 1 - 가입, 0 - 가입실패
	 */
	@Override
	public int signUp(UserDTO userInfo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result  =0 ;
		try{
		con= DbUtil.getConnection();
		//UserDTO(String id, String password, String tel, String email, String location, int cash)
		ps= con.prepareStatement("insert into (id,password,tell,email,location,cash) values (?,?,?,?,?,?)");
		
		ps.setString(1, userInfo.getId());
		ps.setString(2,	userInfo.getPassword());
		ps.setString(3, userInfo.getTel());
		ps.setString(4, userInfo.getEmail());
		ps.setString(5, userInfo.getEmail());
		ps.setInt(6, userInfo.getCash());
		
		result = ps.executeUpdate();	
		}catch(SQLException e){
			
			e.printStackTrace();
		}finally{
			DbUtil.dbClose(con, ps, null);
			
		}
		return result;
	}

	@Override
	public UserDTO getProfile(String id) throws SQLException {
		Connection con = null; 
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserDTO userDTO=null;
		try{
			con = DbUtil.getConnection();
			ps= con.prepareStatement("select* from userinfo where id = ?" );
			ps.setString(1, id);
			rs= ps.executeQuery();
			if(rs.next()){
				//UserDTO(String id, String password, String tel, String email, String location, int cash)
				userDTO = new UserDTO(rs.getString("id"),
									  rs.getString("password"),
									  rs.getString("tel"), 
									  rs.getString("email"),
									  rs.getString("location"),
									  rs.getInt("cash"));
				}
			
		}catch(SQLException e){
			e.printStackTrace();

		}finally{
			
			DbUtil.dbClose(con, ps, rs);
		}
		
		return userDTO;
	}
	
	
	/**
	 * 4. 거래내역
	 * 거래날짜, 구매자, 판매자, 거래내용
	 */
	@Override
	public HistoryDTO myHistory(String id) throws SQLException {
		Connection con = null; 
		PreparedStatement ps = null;
		ResultSet rs = null;
		HistoryDTO  historyDTO=null;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement("select * from myhistory");
			rs= ps.executeQuery();
			if(rs.next()){				
		/*HistoryDTO(String daydate, String seller, String buyer, String category, String subcategory, 
						String itemName,int money*/
				historyDTO = new HistoryDTO(    rs.getString("dayDate"), 
												rs.getString("seller"),
												rs.getString("buyer"), 
												rs.getString("category"), 
												rs.getString("sub_category"),
												rs.getString("itemName"),
												rs.getInt("money"));						
			}
			
		}catch(SQLException e) {			
			e.printStackTrace();
		}finally {			
			DbUtil.dbClose(con, ps, rs);
		}  		
		return historyDTO;
	}

	@Override
	public CashHistoryDTO selectAllCashHistory(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
	public int addCash(String id, int cash) throws SQLException {
		
		return 0;
	}
	
	/**
	 * 6. 검색
	 * 게시물
	 * 
	 * select * from borderinfo where category = ? and sub_category= ?" 
	 */
	@Override
	public List<BorderDTO> search(String word, String category, String subCategory) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null; 
		List<BorderDTO>  list = new ArrayList<>();
		
		
		try {
			
		/* 	
		 * String id, String borderNumber, String content, String itemName, int money, String dayDate,
		 * String category, String subcategory, String itemState 
		 */
		
			con= DbUtil.getConnection();
			ps =con.prepareStatement("select * from borderinfo where category = "+word+ "| sub_category ="+word);
			ps.setString(1, category);
			ps.setString(2, subCategory);
			rs  = ps.executeQuery();
			
			if(word==rs.getString("itemName")){	
				while(rs.next()){
					
					list.add(new BorderDTO(rs.getString("id"), 
											rs.getString("border_number"), 
											rs.getString("content"), 
											rs.getString("itemName"),
											rs.getInt("money"), 
											rs.getString("dayDate"), 
											rs.getString("category"), 
											rs.getString("sub_Category"),
											rs.getString("itemState")
											));
					
				}
			} 
				
				
		} catch(Exception e){
			e.printStackTrace();
			
		}finally {
			
			DbUtil.dbClose(con, ps, rs);
		}
	
		return list;
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
