package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.dto.BorderDTO;
import model.dto.CashHistoryDTO;
import model.dto.MemoDTO;
import model.dto.TradeHistoryDTO;
import model.dto.UserDTO;
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
		Connection con = null; 
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<TradeHistoryDTO>  tradelist = new ArrayList<>(); 
		
		try {
			con = DbUtil.getConnection();
			// id에 따라 구매내역, 판매 내역 모두 출력하도록 한다.
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
						rs.getString("border_number"), 
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
		 * String id, int borderNumber, String content, String itemName, int money, String dayDate,
		 * String category, String subcategory, String itemState 
		 */
		
			con= DbUtil.getConnection();
			if(word==null) {
				ps = con.prepareStatement("select * from borderinfo where category = ? and sub_category = ?");
				ps.setString(1, category);
				ps.setString(2, subCategory);
			}else {
				ps = con.prepareStatement("select * from borderinfo where category = ? and sub_category = ? and itemName like ?");
				ps.setString(1, category);
				ps.setString(2, subCategory);
				ps.setString(3, "%"+word+"%");
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
				System.out.println(list.get(0).getItemName());
			} 
				
		}finally {
			
			DbUtil.dbClose(con, ps, rs);
		}
	
		return list;
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
			ps = con.prepareStatement("insert into borderInfo values (?,?,?,?,?,sysdate,?,?,?)");
			
			ps.setString(1, border.getId());
			ps.setInt(2, border.getBorderNumber());
			ps.setString(3, border.getContent());
			ps.setString(4, border.getItemName());
			ps.setInt(5, border.getMoney());
			ps.setString(6, border.getCategory());
			ps.setString(7, border.getSubcategory());
			ps.setString(8, border.getItemState());
			
			result = ps.executeUpdate();
		}finally{
			DbUtil.dbClose(con, ps, null);
		}
		return result;
	}
	
	/**
	 * 8. 글쓰기
	 * 이미지를 넣기 위한 메소드
	 * */
	@Override
	public int imgWrite(int borderNumber) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		HttpServletRequest request = null;
		int maxSize = 1024*1024*100;
		String encoding = "UTF-8";
		String saveDir = request.getServletContext().getRealPath("/image");
		MultipartRequest m = null;
		try{
			m = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			String imgName = saveDir + m.getFilesystemName("file");
			con = DbUtil.getConnection();
			ps = con.prepareStatement("insert into img_border values (?,?)");
			ps.setInt(1, borderNumber);
			ps.setString(2, imgName);
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
	 * 10. 구매자 마일리지를 중개자에게
	 * 10, 11, 12, 13순서로 commit, rollback
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
	 * 11. 중개자 마일리지를 구매자에게 받은만큼 증가
	 * 중개자는 user_info의 admin으로 추가한다.
	 */
	@Override
	public int receiveCashAgency(Connection con,int money) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		 try{
			      
			  ps = con.prepareStatement("update userinfo set cash = (select cash from userinfo where id='admin') + ? where id='admin'");
			  ps.setInt(1, money);
			  
			  result = ps.executeUpdate();
			  
		   }finally{
			   DbUtil.dbClose(con, ps, null);
		   }
		   
		   return result;
	}

	/**
	 * 12. 게시물의 거래 진행상황을 진행중 / 거래완료로 변경
	 * 10번이 들어가기전에 borderStateChange를 해서 진행중으로 바꾸고, 버튼이 눌러지면 거래완료로 변경
	 */
	@Override
	public int borderStateChange(Connection con,BorderDTO border) throws SQLException {
		
		PreparedStatement ps = null;
		int result=0;
		
		 try{
			
			  ps = con.prepareStatement("update borderInfo set itemState = ? where id=?");
			  ps.setString(1,"거래중");
			  ps.setString(2, border.getId());
			  result = ps.executeUpdate();
			  
		   }finally{
			   DbUtil.dbClose(con, ps, null);
		   }
		   
		   return result;
	}

	/**
	 * 13. 거래진행내역 추가
	 */
	@Override
	public int trading(Connection con, String id, int money, BorderDTO border) throws SQLException {
		
		PreparedStatement ps= null;
		int result = 0;
		try{
			con = DbUtil.getConnection();
			ps = con.prepareStatement("insert into trade_history values (?,?,?,?,?,?,?)");
			ps.setString(1, id);	//구매하는사람
			ps.setString(2, border.getId()); // 파는사람
			ps.setString(3, border.getItemName());
			ps.setInt(4, border.getMoney());
			ps.setInt(5, border.getBorderNumber());
			ps.setString(6, border.getDayDate());
			ps.setString(7, border.getItemState());
			
			result = ps.executeUpdate();

			con.setAutoCommit(true);//오토커밋을 true로다시변경
		}finally{
			DbUtil.dbClose(con, ps, null);
		  }
		return result;
		
	}
	
	/**
	 * 14. 거래진행내역 검색
	 */
	@Override
	public List<TradeHistoryDTO> selectByIdTrade(String id) throws SQLException {
		  Connection con = null;
		  PreparedStatement ps = null;
		  ResultSet rs = null;
		  List<TradeHistoryDTO> list = new ArrayList<>();
		  
		  try{
			con = DbUtil.getConnection();
			//파는 사람 기준으로 찾는건지? 사는 
			ps = con.prepareStatement("select * from trade_history where seller = ? or buyer=?");
			
			ps.setString(1, id);
			ps.setString(2, id);
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				TradeHistoryDTO dto = new TradeHistoryDTO(rs.getString("buyer"), 
						rs.getString("seller"), 
						rs.getString("itemName"), 
						rs.getInt("cash"),
						rs.getString("border_number"), 
						rs.getString("daydate"),
						rs.getString("trade_state"));
				
				list.add(dto);
			}
			  
		  }finally{
			  DbUtil.dbClose(con, ps, rs);
		  }
		  return list;
	  }

	
	@Override
	public TradeHistoryDTO selectByBorderTrade(int borderNum) throws SQLException {
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

	@Override
	public int updateCashHistory(String id, String itemName, int money, int currentCash) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	



}
