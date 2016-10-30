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

	//1. 占싸깍옙占쏙옙
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
	 * 2. 회占쏙옙占쏙옙占쏙옙
	 * 1 - 占쏙옙占쏙옙, 0 - 占쏙옙占쌉쏙옙占쏙옙
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
	 * 4. 占신뤄옙占쏙옙占쏙옙
	 * 占신뤄옙占쏙옙짜, 占쏙옙占쏙옙占쏙옙, 占실몌옙占쏙옙, 占신뤄옙占쏙옙占쏙옙
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
	 * 5. 占쏙옙占싹몌옙占쏙옙 占쏙옙占쏙옙 占쏙옙占�
	 * 占쏙옙占쏙옙占쏙옙짜, 占쏙옙占쏙옙碁占승�, 占쏙옙占쏙옙 占쏙옙占싹몌옙占쏙옙
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
	 * 6. 占쏙옙占싹몌옙占쏙옙 占쏙옙占쏙옙
	 */
	public int addCash(Connection con, String id, int cash) throws SQLException {
		PreparedStatement ps = null;
		int result=0;
	
		ps=con.prepareStatement("update userinfo set cash = (select cash from userinfo where id=?) + ? where id=?");
		ps.setString(1, id);
		ps.setInt(2, cash);
		ps.setString(3, id);

		result = ps.executeUpdate();

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
				ps.setString(3, "%"+word.trim()+"%");
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
	 * 7. 占쌨쏙옙占쏙옙占쏙옙
	 * 占쏙옙占쏙옙占쏙옙占�, 占쏙옙占쏙옙占승삼옙占�, 占쏙옙占쏙옙
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
	 * 8. 占쌜억옙占쏙옙
	 * 占싱뱄옙占쏙옙, 占쏙옙占쏙옙, 占쌥억옙, 占쌜놂옙占쏙옙, id
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
	 * 8. 占쌜억옙占쏙옙
	 * 占싱뱄옙占쏙옙
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
	 * 9. 占쏙옙占싻깍옙
	 * 占싱뱄옙占쏙옙, 占쏙옙占쏙옙, 占쌥억옙, 占쌜놂옙占쏙옙, id
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
	 * 10. 占쏙옙占쏙옙占쏙옙 占쏙옙占싹몌옙占쏙옙占쏙옙 占쌩곤옙占쌘울옙占쏙옙
	 * 10, 11, 12, 13占쏙옙占쏙옙占쏙옙 commit, rollback
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
	 * 11. 占쌩곤옙占쏙옙 占쏙옙占싹몌옙占쏙옙占쏙옙 占쏙옙占쏙옙占쌘울옙占쏙옙 占쏙옙占쏙옙占쏙옙큼 占쏙옙占쏙옙
	 * 占쌩곤옙占쌘댐옙 user_info占쏙옙 admin占쏙옙占쏙옙 占쌩곤옙占싼댐옙.
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
	 * 12-1. 占쌉시뱄옙占쏙옙 占신뤄옙 占쏙옙占쏙옙占싫뀐옙占� 占쏙옙占쏙옙占쏙옙 占실댐옙 占신뤄옙占싹뤄옙占� 占쏙옙占쏙옙(占쌉쏙옙占실울옙占쏙옙 占쏙옙占쏙옙占쌕곤옙)
	 */
	@Override
	public int borderStateChange(Connection con,BorderDTO border) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
	  ps = con.prepareStatement("update borderInfo set itemState = ? where id=?");
	  ps.setString(1,"거래중");
	  ps.setString(2, border.getId());
	  result = ps.executeUpdate();
	  
	  return result;
	}
	
	/**
	 * 12-2. 占쌉시뱄옙占쏙옙 占신뤄옙 占쏙옙占쏙옙占싫뀐옙占� 占쏙옙占쏙옙占쏙옙 占실댐옙 占신뤄옙占싹뤄옙占� 占쏙옙占쏙옙(占신뤄옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쌕곤옙)
	 */
	@Override
	public int tradeStateChange(Connection con, TradeHistoryDTO trade) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		ps = con.prepareStatement("update trade_history set trade_state = '거래중' where buyer=? or seller=?");
		ps.setString(1, trade.getSeller());
		ps.setString(2, trade.getSeller());
		result = ps.executeUpdate();
			  
		return result;
	}

	/**
	 * 13. 占신뤄옙占쏙옙占썅내占쏙옙 占쌩곤옙
	 */
	@Override
	public int trading(Connection con, String id, int money, BorderDTO border) throws SQLException {
		
		PreparedStatement ps= null;
		int result = 0;
		System.out.println(border.getId()+"," + id + "," + border.getItemName()+","+ money + "," + border.getBorderNumber() + "," + border.getItemState());

		con = DbUtil.getConnection();
		ps = con.prepareStatement("insert into trade_history values (?,?,?,?,?,sysdate,?)");
		ps.setString(1, border.getId());	//占쏙옙占싱듸옙
		ps.setString(2, id); // 占쏙옙占싱듸옙
		ps.setString(3, border.getItemName());
		ps.setInt(4, money);
		ps.setInt(5, border.getBorderNumber());
		ps.setString(6, border.getItemState());
			
		result = ps.executeUpdate();

		return result;
		
	}
	
	/**
	 * 15. 占쌔댐옙 占쌉시뱄옙占쏙옙 占쏙옙占쏙옙 占신뤄옙占쏙옙占썅내占쏙옙 占싯삼옙
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
	 * 16. 占쌩곤옙占쏙옙 占쏙옙占싹몌옙占쏙옙占쏙옙 占실몌옙占쌘울옙占쏙옙
	 * 15, 16, 17, 12, 18占쏙옙占쏙옙占쏙옙 commit 占실댐옙 rollback
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
	 * 17. 占쌩곤옙占쏙옙占쏙옙 占쏙옙占싹몌옙占쏙옙 占쏙옙占쏙옙
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
	 * 18-1. 占쏙옙占신완뤄옙 占쏙옙占썅내占쏙옙占쏙옙 占쏙옙占쏙옙
	 */
	@Override
	public int completeBorder(Connection con, BorderDTO border) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		ps = con.prepareStatement("update borderInfo set itemState = ? where id=?");
		ps.setString(1,"占신뤄옙占싹뤄옙");
		ps.setString(2, border.getId());
		result = ps.executeUpdate();

		return result;
	}
	
	/**
	 * 18-2. 占쏙옙占신완뤄옙 占쏙옙占썅내占쏙옙占쏙옙 占쏙옙占쏙옙(占신뤄옙占쏙옙占쏙옙占쏙옙占쏙옙 )
	 */
	@Override
	public int completeTrade(Connection con, TradeHistoryDTO trade) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		ps = con.prepareStatement("update trade_history set itemState = ? where id=?");
		ps.setString(1,"占신뤄옙占싹뤄옙");
		ps.setString(2, trade.getSeller());
		result = ps.executeUpdate();
			  
		return result;
	}

	/**
	 * 占신뤄옙占쏙옙 占쏙옙占싹몌옙占쏙옙 占쏙옙占쏙옙 占쌩곤옙
	 * 
	 */
	@Override
	public int updateCashHistory(Connection con, String id, String itemName, int money, int currentCash) throws SQLException {
		
		PreparedStatement ps= null;
		int result = 0;
		
		con = DbUtil.getConnection();
		ps = con.prepareStatement("insert into cash_history values (?,?,?,sysdate,?)");
		ps.setString(1, id);	//占쏙옙占싱듸옙
		ps.setString(2, itemName); // 占쏙옙占쏙옙占싱몌옙
		ps.setInt(3, money);
		ps.setInt(4, currentCash);
		
		result = ps.executeUpdate();

		return result;
	}
	/**
	 * 20. 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占�
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
	 * 21.占쏙옙占쏙옙占쏙옙占쏙옙占� 占쏙옙占쏙옙
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
	 * 22. 占쏙옙占쏙옙占� 占쏙옙占쏙옙 占쏙옙占쏙옙
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

	/**
	 * 23.��й�ȣ ã��
	 * */

	@Override
	public String userPassWordFind(String id) throws SQLException {
		Connection con = DbUtil.getConnection();
		PreparedStatement ps =null;
		ResultSet rs= null;
		String message="";
		try{
			ps = con.prepareStatement("select password from userinfo where id = ?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				message = rs.getString("password");
			}
		}finally{
			DbUtil.dbClose(con, ps, rs);
		}
		return message;
	}
	
	/**
	 * requestTrade
	 */
	@Override
	public int requestTrade(String buyer, String seller, int cash, int borderNumber) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement("insert into request_trade(buyer, seller, cash, border_number) "
					+ "values(?, ?, ?, ?)");
			ps.setString(1, buyer);
			ps.setString(2, seller);
			ps.setInt(3, cash);
			ps.setInt(4, borderNumber);
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(con, ps, null);
		}
		return result;
	}
	
	/**
	 * selectRequestTrade
	 */
	@Override
	public List<TradeHistoryDTO> selectRequestTrade(String seller) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<TradeHistoryDTO> list = new ArrayList<>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement("select buyer, seller, cash, border_number from request_trade "
					+ "where seller = ?");
			ps.setString(1, seller);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new TradeHistoryDTO(rs.getString("buyer"), rs.getString("seller"),
						rs.getInt("cash"), rs.getInt("border_number")));
			}
		}finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}
}