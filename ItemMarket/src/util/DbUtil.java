package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbUtil {
	static DataSource ds;
	//�ε�
	static {
		try {
			Context initContext = new InitialContext();
			ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/myoracle");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//����
	public static Connection getConnection() {
		Connection con = null;;
		try {
			con = ds.getConnection();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	//�ݱ�
	public static void dbClose(Connection con, Statement stm, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
				rs = null;
			}
			if(stm != null) {
				stm.close();
				stm = null;
			}
			if(con != null) {
				con.close();
				con = null;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
}
