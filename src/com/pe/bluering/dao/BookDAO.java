package com.pe.bluering.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.pe.admin.vo.BookVo;

public class BookDAO {

	private Connection con;

	public BookDAO() {
		try {

			InputStream is = getClass().getResourceAsStream("jdbc.properties");
		    Properties prop = new Properties();
		    //파일 InputStream을 Properties 객체로 읽어온다
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

	public int insertBook(BookVo bookvo) throws SQLException {
		
		PreparedStatement pstmt = null;
		int insertCount = 0;
		
		try {
			String sql = "INSERT INTO hbook (bookId,bookName,bookSubTitle,author,publishing,publishDay,cost,rate,sellingPrice,pageNum,weight,size,category1,category2,comment,bookImage,bestProduct,todayProduct,hiddenProduct)"
					+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookvo.getBookId());
			pstmt.setString(2, bookvo.getBookName());
			pstmt.setString(3, bookvo.getBookSubTitle());
			pstmt.setString(4, bookvo.getAuthor());
			pstmt.setString(5, bookvo.getPublishing());
			pstmt.setString(6, bookvo.getPublishDay());
			pstmt.setString(7, bookvo.getCost());
			pstmt.setInt(8, bookvo.getRate());
			pstmt.setString(9, bookvo.getSellingPrice());
			pstmt.setInt(10, bookvo.getPageNum());
			pstmt.setInt(11, bookvo.getWeight());
			pstmt.setString(12, bookvo.getSize());
			pstmt.setString(13, bookvo.getCategory1());
			pstmt.setString(14, bookvo.getCategory2());
			pstmt.setString(15, bookvo.getComment());
			pstmt.setString(16, bookvo.getBookImage());
			pstmt.setString(17, bookvo.getBestProduct());
			pstmt.setString(18, bookvo.getTodayProduct());
			pstmt.setString(19, bookvo.getHiddenProduct());
		
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			con.close();
		}
		
		return insertCount;
		
	}

	public ArrayList<BookVo> selectAllBook(int page, int limit) {

		ArrayList<BookVo> bookList = new ArrayList<BookVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int startRow = (page-1) * 10;  // 읽기 시작할 row번호
		try {
			String sql = "SELECT * FROM hbook order by bookId desc limit ?,10";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookVo bookvo = new BookVo();
				bookvo.setBookId(rs.getString("bookId"));
				bookvo.setBookName(rs.getString("bookName"));
				bookvo.setBookSubTitle(rs.getString("bookSubTitle"));
				bookvo.setAuthor(rs.getString("author"));
				bookvo.setPublishing(rs.getString("publishing"));
				bookvo.setPublishDay(rs.getString("publishDay"));
				bookvo.setCost(rs.getString("cost"));
				bookvo.setRate(rs.getInt("rate"));
				bookvo.setSellingPrice(rs.getString("sellingPrice"));
				bookvo.setPageNum(rs.getInt("pageNum"));
				bookvo.setSize(rs.getString("size"));
				bookvo.setCategory1(rs.getString("category1"));
				bookvo.setCategory2(rs.getString("category2"));
				bookvo.setComment(rs.getString("comment"));
				bookvo.setBookImage(rs.getString("bookImage"));
				bookvo.setBestProduct(rs.getString("bestProduct"));
				bookvo.setTodayProduct(rs.getString("todayProduct"));
				bookvo.setHiddenProduct(rs.getString("hiddenProduct"));
				
				bookList.add(bookvo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return bookList;
	}

	public int selectListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT count(*) FROM hbook";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCount;
	}

	public ArrayList<BookVo> selectOneBook(String bookId) {
		ArrayList<BookVo> bookList = new ArrayList<BookVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "SELECT * FROM hbook WHERE bookId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookVo bookvo = new BookVo();
				bookvo.setBookId(rs.getString("bookId"));
				bookvo.setBookName(rs.getString("bookName"));
				bookvo.setBookSubTitle(rs.getString("bookSubTitle"));
				bookvo.setAuthor(rs.getString("author"));
				bookvo.setPublishing(rs.getString("publishing"));
				bookvo.setPublishDay(rs.getString("publishDay"));
				bookvo.setCost(rs.getString("cost"));
				bookvo.setRate(rs.getInt("rate"));
				bookvo.setSellingPrice(rs.getString("sellingPrice"));
				bookvo.setPageNum(rs.getInt("pageNum"));
				bookvo.setSize(rs.getString("size"));
				bookvo.setCategory1(rs.getString("category1"));
				bookvo.setCategory2(rs.getString("category2"));
				bookvo.setComment(rs.getString("comment"));
				bookvo.setBookImage(rs.getString("bookImage"));
				bookvo.setBestProduct(rs.getString("bestProduct"));
				bookvo.setTodayProduct(rs.getString("todayProduct"));
				bookvo.setHiddenProduct(rs.getString("hiddenProduct"));
				
				bookList.add(bookvo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return bookList;
	}
}
