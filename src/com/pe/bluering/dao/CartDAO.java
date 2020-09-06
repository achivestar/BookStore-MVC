package com.pe.bluering.dao;


import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.vo.CartVo;

public class CartDAO {

	private Connection con;

	public CartDAO() {
		try {

			InputStream is = getClass().getResourceAsStream("jdbc.properties");
			Properties prop = new Properties();
			// 파일 InputStream을 Properties 객체로 읽어온다
			prop.load(is);
			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String password = prop.getProperty("password");

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public int addCart(String memberId, int bookNum, BookVo bookList) throws SQLException {
	
		PreparedStatement pstmt = null;
		int insertCount = 0;

		try {
			String sql = "INSERT INTO cart (memberId,productId,bookName,bookImg,bookPrice,amount)";
			sql+= " values (?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, bookList.getBookId());
			pstmt.setString(3, bookList.getBookName());
			pstmt.setString(4, bookList.getBookImage());
			pstmt.setInt(5, bookList.getSellingPrice());
			pstmt.setInt(6, bookNum);
			
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			con.close();
		}

		return insertCount;
	}


	public ArrayList<CartVo> selectCart(String memberId) {
		ArrayList<CartVo> cartList = new ArrayList<CartVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			sql = "SELECT * FROM cart WHERE memberId = ? and state = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CartVo cartvo = new CartVo();
				cartvo.setCid(rs.getInt("cid"));
				cartvo.setMemberId(memberId);
				cartvo.setProductId(rs.getString("productId"));
				cartvo.setBookName(rs.getString("bookName"));
				cartvo.setBookImg(rs.getString("bookImg"));
				cartvo.setBookPrice(rs.getInt("bookPrice"));
				cartvo.setAmount(rs.getInt("amount"));
				cartList.add(cartvo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cartList;
	}


	public int updateCart(int cart_id, int amount) {

		PreparedStatement pstmt = null;
		int updateCount = 0;
		System.out.println("DB cartId " +cart_id);
		System.out.println("DB amount " + amount);
		try {
			String sql = "UPDATE cart SET amount = ? WHERE cid = ?";
			System.out.println(sql);

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setInt(2, cart_id);

			updateCount = pstmt.executeUpdate();
			System.out.println(updateCount);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return updateCount;
	}


	public int deleteCart(int cart_id) {
		PreparedStatement pstmt = null;
		int deleteCount = 0;
		System.out.println("DB cartId " +cart_id);
		try {
			String sql = "DELETE FROM cart WHERE cid = ?";
			System.out.println(sql);

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cart_id);

			deleteCount = pstmt.executeUpdate();
			System.out.println(deleteCount);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return deleteCount;

	}


	public CartVo selectOneCart(int cart_id) {
	 
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		CartVo cartvo = new CartVo();
		try {
			sql = "SELECT * FROM cart WHERE cid = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cart_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				cartvo.setCid(rs.getInt("cid"));
				cartvo.setMemberId(rs.getString("memberId"));
				cartvo.setProductId(rs.getString("productId"));
				cartvo.setBookName(rs.getString("bookName"));
				cartvo.setBookImg(rs.getString("bookImg"));
				cartvo.setBookPrice(rs.getInt("bookPrice"));
				cartvo.setAmount(rs.getInt("amount"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cartvo;
	}


	public int getCount(String id) {
	
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int count = 0;
		try {
			sql = "SELECT count(*) as count FROM cart WHERE memberid = ? and state = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				 count = rs.getInt("count");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}


	public int getCartCount(String memberId, String bookNum) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int count = 0;
		try {
			sql = "SELECT count(productId) as count FROM cart WHERE memberid = ? and productId = ? and state = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, bookNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				 count = rs.getInt("count");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}


	public int modifyCart(String memberId, int bookNum, String bookId) {
		PreparedStatement pstmt = null;
		int modifyCount = 0;

		try {
			String sql = "UPDATE cart SET amount = amount+? WHERE productId = ? and memberId = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bookNum);
			pstmt.setString(2,bookId);
			pstmt.setString(3, memberId);
			modifyCount = pstmt.executeUpdate();
			System.out.println(modifyCount);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return modifyCount;
	}

	
	
}
