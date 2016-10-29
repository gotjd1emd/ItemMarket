package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.BorderDTO;
import model.dto.CashHistoryDTO;
import model.dto.ImageDTO;
import model.dto.MemoDTO;
import model.dto.TradeHistoryDTO;
import model.dto.UserDTO;
import util.DbUtil;

public class ItemMarketDAOImpl implements ItemMarketDAO {

	//1. 로그인
	@Override
	public int login(String id, String password) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		UserDTO userDTO = null;
		String sql = " select * from userinfo where id = ? and password = ?";
		//String sql = "select id,pw,tel from usertable where id = ? & pwd = ? ";
		
		try{
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			rs= ps.executeQuery();
			if(rs.next()){
			 result =1;			
			}
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
		ps= con.prepareStatement("insert into userinfo values (?,?,?,?,?,?)");
		
		ps.setString(1, userInfo.getId());
		ps.setString(2,	userInfo.getPassword());
		ps.setString(3, userInfo.getTel());
		ps.setString(4, userInfo.getEmail());
		ps.setString(5, userInfo.getLocation());
		ps.setInt(6, userInfo.getCash());
		
		result = ps.executeUpdate();	
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
	public List<TradeHistoryDTO> myHistory(String id) throws SQLException {
		//id
		Connection con = null; 
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<TradeHistoryDTO>  tradelist = new ArrayList<>(); 
		
		try {
			con = DbUtil.getConnection();
			// id
			ps = con.prepareStatement("select * from trade_history where buyer=? or seller=?");
			ps.setString(1, id);
			ps.setString(2, id);
			
			rs= ps.executeQuery();
			while(rs.next()){				
		/*tradeHistoryDTO(String buyer, String seller, String itemName, int cash, int border_number, 
						String daydate, String trade_state)*/
				TradeHistoryDTO tradeHistoryDTO = new TradeHistoryDTO(rs.getString("buyer"), 
						rs.getString("seller"), 
						rs.getString("itemName"), 
						rs.getInt("cash"),
						rs.getInt("border_number"), 
						rs.getString("daydate"),
						rs.getString("trade_state"));
				
				tradelist.add(tradeHistoryDTO);
			}
			
		}finally {			
			DbUtil.dbClose(con, ps, rs);
		}  		
		return tradelist;
	}
	
	/**
	 * 5. 마일리지 내역 출력
	 * 충전날짜, 사용한날짜, 남은 마일리지
	 */
	@Override
	public List<CashHistoryDTO> selectAllCashHistory(String id) throws SQLException {
				Connection con = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				List<CashHistoryDTO> cashlist = new ArrayList<>(); 
				
				try{
					con = DbUtil.getConnection();
					ps=con.prepareStatement("select * from cash_History where id = ?");
					ps.setString(1, id);
					rs = ps.executeQuery();
					while(rs.next()){
						CashHistoryDTO cashHistoryDTO = new CashHistoryDTO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4),rs.getInt(5));
					
						cashlist.add(cashHistoryDTO);
				}
				}finally{
					DbUtil.dbClose(con,ps,rs);
				}
				return cashlist;
	}
	
	/**
	 * 6. 마일리지 충전
	 */
	public int addCash(String id, int cash) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result=0;
	
		try{
			con = DbUtil.getConnection();
			
			ps=con.prepareStatement("update userinfo set cash = (select cash from userinfo where id=?) + ? where id=?");
			ps.setString(1, id);
			ps.setInt(2, cash);
			ps.setString(3, id);

			result = ps.executeUpdate();
		
		}finally{
			DbUtil.dbClose(con, ps, null);
		}
		return result;
}
	
	
	/**
	 * 6. 
	 * 
	 * select * from borderinfo where category = ? and sub_category= ?" 
	 */
	@Override
	public List<BorderDTO> search(String word, String category, String subCategory, int page) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null; 
		List<BorderDTO>  list = new ArrayList<>();
		
		try {
			
		/* 	
		 * String id, int borderNumber, String content, String itemName, int money, String dayDate,
		 * String category, String subcategory, String itemState 
		 */
			con= DbUtil.getConnection();
			if(word==null) {
				ps = con.prepareStatement("select * from (select ROWNUM num, id, border_number, content, "
						+ "itemName, money, dayDate, category, sub_Category, itemState from borderinfo "
						+ "where category = ? and sub_category = ? order by daydate desc) "
						+ "where num BETWEEN ? and ?");
				ps.setString(1, category);
				ps.setString(2, subCategory);
				ps.setInt(3, (page-1)*9+1);
				ps.setInt(4, page*9);
			}else {
				ps = con.prepareStatement("select * from (select ROWNUM num, id, border_number, content, "
						+ "itemName, money, dayDate, category, sub_Category, itemState from borderinfo "
						+ "where category = ? and sub_category = ? and itemName like ? order by daydate desc) "
						+ "where num BETWEEN ? and ?");
				ps.setString(1, category);
				ps.setString(2, subCategory);
				ps.setString(3, "%"+word+"%");
				ps.setInt(4, (page-1)*9+1);
				ps.setInt(5, page*9);
			}
			rs  = ps.executeQuery();

			while(rs.next()){
				
				list.add(new BorderDTO(rs.getString("id"), 
						rs.getInt("border_number"), 
						rs.getString("content"), 
						rs.getString("itemName"),
						rs.getInt("money"), 
						rs.getString("dayDate"), 
						rs.getString("category"), 
						rs.getString("sub_Category"),
						rs.getString("itemState")
						));
			} 
			
		}finally {
			
			DbUtil.dbClose(con, ps, rs);
		}
	
		return list;
	}
	
	/**
	 * 6-1.
	 */
	@Override
	public int pageNumber(String word, String category, String subCategory) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null; 
		int rowNumber = 0; 

		try {

			con= DbUtil.getConnection();
			if(word==null) {
				ps = con.prepareStatement("select count(num) as row_num from (select ROWNUM num from borderinfo "
						+ "where category = ? and sub_category = ?)");
				ps.setString(1, category);
				ps.setString(2, subCategory);
			}else {
				ps = con.prepareStatement("select count(num) as row_num from (select ROWNUM num from borderinfo "
						+ "where category = ? and sub_category = ? and itemName like ?)");
				ps.setString(1, category);
				ps.setString(2, subCategory);
				ps.setString(3, "%"+word+"%");
			}
			rs  = ps.executeQuery();

			if(rs.next()) {
				rowNumber = rs.getInt("row_num");
			}
			
		}finally {
			
			DbUtil.dbClose(con, ps, rs);
		}
	
		return rowNumber;
	}
	
	/**
	 * 7. 메신저함
	 * 받은사람, 보내는사람, 내용
	 */
	@Override
	public List<MemoDTO> memobox(String id) throws SQLException {
				Connection con = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				List<MemoDTO> list = new ArrayList<>();
				
				try{
					con = DbUtil.getConnection();
					ps = con.prepareStatement("select * from messenger where sender = ? or receiver = ?");
					ps.setString(1, id);
					ps.setString(2, id);
					rs = ps.executeQuery();
					while(rs.next()){
						list.add(new MemoDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
					}
				}finally{
					DbUtil.dbClose(con,ps,rs);
				}
				
				return list;
		
	}

	/**
	 * 8. 글쓰기
	 * 이미지, 지역, 금액, 글내용, id
	 */
	@Override
	public int write(BorderDTO border) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result=0;
		try{
			con = DbUtil.getConnection();
			ps = con.prepareStatement("insert into borderInfo values (?,borderInfo_seq.nextval,?,?,?,sysdate,?,?,?)");
			
			ps.setString(1, border.getId());
			ps.setString(2, border.getContent());
			ps.setString(3, border.getItemName());
			ps.setInt(4, border.getMoney());
			ps.setString(5, border.getCategory());
			ps.setString(6, border.getSubcategory());
			ps.setString(7, border.getItemState());
			
			result = ps.executeUpdate();
		}finally{
			DbUtil.dbClose(con, ps, null);
		}
		return result;
	}
	
	/**
	 * 8. 글쓰기
	 * 이미지
	 */
	@Override
	public int imgWrite(String imgName) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		try{
			con = DbUtil.getConnection();
			ps = con.prepareStatement("insert into img_border values (borderInfo_seq.currval,?)");

			ps.setString(1, imgName);
			result = ps.executeUpdate();
		}finally{
			DbUtil.dbClose(con, ps, null);
		}
		return result;
	}

	/**
	 * 9. 글읽기
	 * 이미지, 지역, 금액, 글내용, id
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
			  	ps.setInt(1, borderNum);
			  	rs = ps.executeQuery();
			  	
			  	if(rs.next()){
			  			border = new BorderDTO(rs.getString("id"), rs.getInt("border_number"),rs.getString("content"),
						rs.getString("itemName"),rs.getInt("money"), rs.getString("dayDate"), rs.getString("category"),
						rs.getString("sub_category"), rs.getString("itemState"));
			  	}
		  }finally{
			  DbUtil.dbClose(con, ps, rs);
		  }
		  
		  return border;
	  }
	
	/**
	 * 8.
	 * */
	@Override
	public List<String> imgRead(int borderNum) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<String> imgList = new ArrayList<>();
		
		try{
			con = DbUtil.getConnection();
			ps = con.prepareStatement("select * from img_Border where border_number=?");

			ps.setInt(1, borderNum);
			rs = ps.executeQuery();
			
			while(rs.next()){

				ImageDTO imageDTO = new ImageDTO(rs.getInt(1), rs.getString(2));
				System.out.println("imageDTO :"+ imageDTO);
				imgList.add(rs.getString("img"));
		}

				

		}finally{
			DbUtil.dbClose(con, ps, null);
		}
		return imgList;
	}
	/**
	 * 10. 구매자 마일리지를 중개자에게
	 * 10, 11, 12, 13순서로 commit, rollback
	 */
	@Override
	public int sendCashAgency(Connection con, String id, int money) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		 
		 ps = con.prepareStatement("update userinfo set cash=(select cash from userinfo where id=?)-? where id=?");
		 ps.setString(1, id);
		 ps.setInt(2, money);
		 ps.setString(3, id);
		  
		 result = ps.executeUpdate();
		 
		 return result;
	}


	/**
	 * 11. 중개자 마일리지를 구매자에게 받은만큼 증가
	 * 중개자는 user_info의 admin으로 추가한다.
	 */
	@Override
	public int receiveCashAgency(Connection con,int money) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		ps = con.prepareStatement("update userinfo set cash = (select cash from userinfo where id='admin') + ? where id='admin'");
		ps.setInt(1, money);
	  
		result = ps.executeUpdate();
  
		return result;
	}

	/**
	 * 12-1. 게시물의 거래 진행상황을 진행중 또는 거래완료로 변경(게시판에서 보여줄것)
	 */
	@Override
	public int borderStateChange(Connection con,BorderDTO border) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
	  ps = con.prepareStatement("update borderInfo set itemState = ? where id=?");
	  ps.setString(1,"거래진행중");
	  ps.setString(2, border.getId());
	  result = ps.executeUpdate();
	  
	  return result;
	}
	
	/**
	 * 12-2. 게시물의 거래 진행상황을 진행중 또는 거래완료로 변경(거래내역에서 보여줄것)
	 */
	@Override
	public int tradeStateChange(Connection con, TradeHistoryDTO trade) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;

		ps = con.prepareStatement("update trade_history set itemState = ? where id=?");
		ps.setString(1,"거래진행중");
		ps.setString(2, trade.getSeller());
		result = ps.executeUpdate();
			  
		return result;
	}

	/**
	 * 13. 거래진행내역 추가
	 */
	@Override
	public int trading(Connection con, String id, int money, BorderDTO border) throws SQLException {
		
		PreparedStatement ps= null;
		int result = 0;

		con = DbUtil.getConnection();
		ps = con.prepareStatement("insert into trade_history values (?,?,?,?,?,?,?)");
		ps.setString(1, id);	//아이디
		ps.setString(2, border.getId()); // 아이디
		ps.setString(3, border.getItemName());
		ps.setInt(4, border.getMoney());
		ps.setInt(5, border.getBorderNumber());
		ps.setString(6, border.getDayDate());
		ps.setString(7, border.getItemState());
			
		result = ps.executeUpdate();

		return result;
		
	}
	
	/**
	 * 15. 해당 게시물에 대한 거래진행내역 검색
	 */
	@Override
	public TradeHistoryDTO selectByBorderTrade(Connection con, int borderNumber) throws SQLException {
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		TradeHistoryDTO tradeHistoryDTO=null;
		
		ps = con.prepareStatement("select * from trade_history where border_number=?");
		ps.setInt(1, borderNumber);
		rs = ps.executeQuery();
		
		if(rs.next()){
			tradeHistoryDTO = new TradeHistoryDTO(rs.getString("buyer"), rs.getString("seller"), rs.getString("itemName"), 
					rs.getInt("cash"), rs.getInt("borderNumber"), rs.getString("dayDate"), rs.getString("tradeState"));
		}
		
		
		return tradeHistoryDTO;
	}

	/**
	 * 16. 중개소 마일리지를 판매자에게
	 * 15, 16, 17, 12, 18순서로 commit 또는 rollback
	 */
	@Override
	public int sendCashSeller(Connection con, String id, int money) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		 ps = con.prepareStatement("update userinfo set cash=(select cash from userinfo where id=?)+? where id=?");
		 ps.setString(1, id);
		 ps.setInt(2, money);
		 ps.setString(3, id);
		  
		 result = ps.executeUpdate();
	
		 return result;
	}

	/**
	 * 17. 중개소의 마일리지 감소
	 */
	@Override
	public int receiveCashSeller(Connection con, int money) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		 
		ps = con.prepareStatement("update userinfo set cash = (select cash from userinfo where id='admin') - ? where id='admin'");
		ps.setInt(1, money);
		  
		result = ps.executeUpdate();
			  
		return result;
	}

	/**
	 * 18-1. 구매완료 진행내역에 삭제
	 */
	@Override
	public int completeBorder(Connection con, BorderDTO border) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		ps = con.prepareStatement("update borderInfo set itemState = ? where id=?");
		ps.setString(1,"거래완료");
		ps.setString(2, border.getId());
		result = ps.executeUpdate();

		return result;
	}
	
	/**
	 * 18-2. 구매완료 진행내역에 삭제(거래내역에서 )
	 */
	@Override
	public int completeTrade(Connection con, TradeHistoryDTO trade) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		ps = con.prepareStatement("update trade_history set itemState = ? where id=?");
		ps.setString(1,"거래완료");
		ps.setString(2, trade.getSeller());
		result = ps.executeUpdate();
			  
		return result;
	}

	/**
	 * 거래중 마일리지 내역 추가
	 * 
	 */
	@Override
	public int updateCashHistory(Connection con, String id, String itemName, int money, int currentCash) throws SQLException {
		
		PreparedStatement ps= null;
		int result = 0;
		
		con = DbUtil.getConnection();
		ps = con.prepareStatement("insert into cash_history values (?,?,?,sysdate,?)");
		ps.setString(1, id);	//아이디
		ps.setString(2, itemName); // 물건이름
		ps.setInt(3, money);
		ps.setInt(4, currentCash);
		
		result = ps.executeUpdate();

		return result;
	}
	/**
	 * 20. 사용자정보삭제
	 * */
	public int userDelete(String id, String pw) throws SQLException{
		Connection con = DbUtil.getConnection();
		PreparedStatement ps = null;
		int result = 0;
		try{
			ps = con.prepareStatement("delete from userinfo where id =? and password =?");
			ps.setString(1, id);
			ps.setString(2, pw);
			result = ps.executeUpdate();
		}finally{
			DbUtil.dbClose(con, ps, null);
		}
		return result;
	}
	/**
	 * 21.사용자정보 수정
	 * */
	@Override
	public int userUpdate(String id , String email, String tel, String location) throws SQLException {
		Connection con = DbUtil.getConnection();
		PreparedStatement ps = null;
		int result =0;
		try{
			ps= con.prepareStatement("update userinfo set email = ? , tel = ? , location = ? where id = ?");
			ps.setString(1,email);
			ps.setString(2,tel);
			ps.setString(3,location);
			ps.setString(4,id);
			result = ps.executeUpdate();
		}finally{
			DbUtil.dbClose(con, ps, null);
		}
		return result;
	}

	@Override
	public int userPasswordUpdate(String id, String password, String newPassword) throws SQLException {
		Connection con =DbUtil.getConnection();
		PreparedStatement ps= null;
		int result = 0;
		try{
			ps = con.prepareStatement("update userinfo set password = ? where id = ? and password = ?");
			ps.setString(1, newPassword);
			ps.setString(2, id);
			ps.setString(3, password);
			result = ps.executeUpdate();
		}finally{
			DbUtil.dbClose(con, ps, null);
		}
		return result;
	}
	/**
	 * 22. 사용자 정보 수정
	 * */

	@Override
	public UserDTO userUpdateCheck(String id, String password) throws SQLException {
		Connection con = DbUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserDTO userDTO=null;
		try{
			con = DbUtil.getConnection();
			System.out.println("id :"+ id+"pw :"+ password);
			ps= con.prepareStatement("select* from userinfo where id = ? and password  = ?" );
			ps.setString(1, id);
			ps.setString(2, password);
			rs= ps.executeQuery();
			if(rs.next()){
				userDTO = new UserDTO(rs.getString("id"),
									  rs.getString("password"),
									  rs.getString("tel"), 
									  rs.getString("email"),
									  rs.getString("location"),
									  rs.getInt("cash"));
				}
			
		}finally{
			
			DbUtil.dbClose(con, ps, rs);
		}
		
		return userDTO;
		
	}
	

}