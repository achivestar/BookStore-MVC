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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.pe.admin.vo.BookVo;

public class BookDAO {

	private Connection con;

	public BookDAO() {
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
			pstmt.setInt(7, bookvo.getCost());
			pstmt.setInt(8, bookvo.getRate());
			pstmt.setInt(9, bookvo.getSellingPrice());
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
		} finally {

			con.close();
		}

		return insertCount;

	}

	public ArrayList<BookVo> selectAllBook(int page, int limit, String filter) {

		ArrayList<BookVo> bookList = new ArrayList<BookVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		System.out.println("DB : " + filter);
		String sql = null;
		int startRow = (page - 1) * 10; // 읽기 시작할 row번호
		try {
			
			if(filter.equals("0")) {
				 sql = "SELECT * FROM hbook order by bookId desc limit ?,10";
			}else if(filter.equals("1")) {
			 sql = "SELECT * FROM hbook WHERE category1='IT모바일' order by bookId desc limit ?,10";
			}else if(filter.equals("2")) {
			 sql = "SELECT * FROM hbook WHERE category1='소설/시/희곡' order by bookId desc limit ?,10";
			}else if(filter.equals("3")) {
				 sql = "SELECT * FROM hbook WHERE category1='어린이' order by bookId desc limit ?,10";
		    }else if(filter.equals("4")) {
			 sql = "SELECT * FROM hbook WHERE category1='에세이' order by bookId desc limit ?,10";
			}else if(filter.equals("5")) {
				 sql = "SELECT * FROM hbook WHERE category1='종교' order by bookId desc limit ?,10";
			}
		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BookVo bookvo = new BookVo();
				bookvo.setBookId(rs.getString("bookId"));
				bookvo.setBookName(rs.getString("bookName"));
				bookvo.setBookSubTitle(rs.getString("bookSubTitle"));
				bookvo.setAuthor(rs.getString("author"));
				bookvo.setPublishing(rs.getString("publishing"));
				bookvo.setPublishDay(rs.getString("publishDay"));
				bookvo.setCost(rs.getInt("cost"));
				bookvo.setRate(rs.getInt("rate"));
				bookvo.setSellingPrice(rs.getInt("sellingPrice"));
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

	public int selectListCount(String filter) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			if(filter.equals("0")) {
				 sql = "SELECT count(*) FROM hbook";
			}else if(filter.equals("1")){
				 sql = "SELECT count(*) FROM hbook WHERE  category1='IT모바일'";
			}else if(filter.equals("2")){
				 sql = "SELECT count(*) FROM hbook WHERE  category1='소설/시/희곡'"; 
			}else if(filter.equals("3")){
				 sql = "SELECT count(*) FROM hbook WHERE  category1='어린이'";
			}else if(filter.equals("4")){
				 sql = "SELECT count(*) FROM hbook WHERE  category1='에세이'"; 
			}else if(filter.equals("5")){
				 sql = "SELECT count(*) FROM hbook WHERE  category1='종교'"; 
			}
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCount;
	}

	public BookVo selectOneBook(String bookId) {

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		BookVo bookvo = new BookVo();
		try {
			String sql = "SELECT * FROM hbook WHERE bookId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				bookvo.setBookId(rs.getString("bookId"));
				bookvo.setBookName(rs.getString("bookName"));
				bookvo.setBookSubTitle(rs.getString("bookSubTitle"));
				bookvo.setAuthor(rs.getString("author"));
				bookvo.setPublishing(rs.getString("publishing"));
				bookvo.setPublishDay(rs.getString("publishDay"));
				bookvo.setCost(rs.getInt("cost"));
				bookvo.setRate(rs.getInt("rate"));
				bookvo.setSellingPrice(rs.getInt("sellingPrice"));
				bookvo.setPageNum(rs.getInt("pageNum"));
				bookvo.setWeight(rs.getInt("weight"));
				bookvo.setSize(rs.getString("size"));
				bookvo.setCategory1(rs.getString("category1"));
				bookvo.setCategory2(rs.getString("category2"));
				bookvo.setComment(rs.getString("comment"));
				bookvo.setBookImage(rs.getString("bookImage"));
				bookvo.setBestProduct(rs.getString("bestProduct"));
				bookvo.setTodayProduct(rs.getString("todayProduct"));
				bookvo.setHiddenProduct(rs.getString("hiddenProduct"));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bookvo;
	}
	
	public ArrayList<BookVo> selectAllBook() {
		ArrayList<BookVo> bookList = new ArrayList<BookVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "SELECT * FROM hbook";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BookVo bookvo = new BookVo();
				bookvo.setBookId(rs.getString("bookId"));
				bookvo.setBookName(rs.getString("bookName"));
				bookvo.setBookSubTitle(rs.getString("bookSubTitle"));
				bookvo.setAuthor(rs.getString("author"));
				bookvo.setPublishing(rs.getString("publishing"));
				bookvo.setPublishDay(rs.getString("publishDay"));
				bookvo.setCost(rs.getInt("cost"));
				bookvo.setRate(rs.getInt("rate"));
				bookvo.setSellingPrice(rs.getInt("sellingPrice"));
				bookvo.setPageNum(rs.getInt("pageNum"));
				bookvo.setWeight(rs.getInt("weight"));
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


	public ArrayList<BookVo>  searchBook(String searchKey, String type) {

		ArrayList<BookVo> bookList = new ArrayList<BookVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		//JSONArray arr = new JSONArray();
		try {
			String sql = "SELECT * FROM hbook WHERE bookName LIKE '%" + searchKey + "%' or author LIKE '%"+searchKey+"%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				BookVo bookvo = new BookVo();

				  bookvo.setBookId(rs.getString("bookId")); //
				  bookvo.setBookName(rs.getString("bookName")); //
				  bookvo.setBookSubTitle(rs.getString("bookSubTitle")); //
				  bookvo.setAuthor(rs.getString("author")); //
				  bookvo.setPublishing(rs.getString("publishing")); //
				  bookvo.setPublishDay(rs.getString("publishDay")); //
				  bookvo.setCost(rs.getInt("cost"));
				  bookvo.setRate(rs.getInt("rate")); //
				  bookvo.setSellingPrice(rs.getInt("sellingPrice")); //
				  bookvo.setPageNum(rs.getInt("pageNum")); //
				  bookvo.setSize(rs.getString("size")); //
				  bookvo.setCategory1(rs.getString("category1")); //
				  bookvo.setCategory2(rs.getString("category2")); //
				  bookvo.setComment(rs.getString("comment")); //
				  bookvo.setBookImage(rs.getString("bookImage")); //
				  bookvo.setBestProduct(rs.getString("bestProduct")); //
				  bookvo.setTodayProduct(rs.getString("todayProduct")); //
				  bookvo.setHiddenProduct(rs.getString("hiddenProduct")); // //
				  bookList.add(bookvo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bookList;
	}
	
	
	public ArrayList<BookVo> searchBook(String searchKey) {
		ArrayList<BookVo> bookList = new ArrayList<BookVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		//JSONArray arr = new JSONArray();
		try {
			String sql = "SELECT * FROM hbook WHERE bookName LIKE '%" + searchKey + "%' or author LIKE '%"+searchKey+"%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				BookVo bookvo = new BookVo();

				  bookvo.setBookId(rs.getString("bookId")); //
				  bookvo.setBookName(rs.getString("bookName")); //
				  bookvo.setBookSubTitle(rs.getString("bookSubTitle")); //
				  bookvo.setAuthor(rs.getString("author")); //
				  bookvo.setPublishing(rs.getString("publishing")); //
				  bookvo.setPublishDay(rs.getString("publishDay")); //
				  bookvo.setCost(rs.getInt("cost")); 
				  bookvo.setRate(rs.getInt("rate")); //
				  bookvo.setSellingPrice(rs.getInt("sellingPrice")); //
				  bookvo.setPageNum(rs.getInt("pageNum")); //
				  bookvo.setSize(rs.getString("size")); //
				  bookvo.setCategory1(rs.getString("category1")); //
				  bookvo.setCategory2(rs.getString("category2")); //
				  bookvo.setComment(rs.getString("comment")); //
				  bookvo.setBookImage(rs.getString("bookImage")); //
				  bookvo.setBestProduct(rs.getString("bestProduct")); //
				  bookvo.setTodayProduct(rs.getString("todayProduct")); //
				  bookvo.setHiddenProduct(rs.getString("hiddenProduct")); // //
				  bookList.add(bookvo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bookList;
	}

	public int bookUpdate(BookVo bookvo) throws SQLException {
		
		PreparedStatement pstmt = null;
		int isSuccess = 0;

		try {
			String sql = "UPDATE hbook SET bookName =?,bookSubTitle=?, author=?, publishing=?,publishDay=?,cost=?,rate=?,sellingPrice=?"
					+ ",pageNum=?,weight=?,size=?,category1=?,category2=?,comment=?,bookImage=?,bestProduct=?,todayProduct=?,hiddenProduct=? WHERE bookId = ?";


			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bookvo.getBookName());
			pstmt.setString(2, bookvo.getBookSubTitle());
			pstmt.setString(3, bookvo.getAuthor());
			pstmt.setString(4, bookvo.getPublishing());
			pstmt.setString(5, bookvo.getPublishDay());
			pstmt.setInt(6, bookvo.getCost());
			pstmt.setInt(7, bookvo.getRate());
			pstmt.setInt(8, bookvo.getSellingPrice());
			pstmt.setInt(9, bookvo.getPageNum());
			pstmt.setInt(10, bookvo.getWeight());
			pstmt.setString(11, bookvo.getSize());
			pstmt.setString(12, bookvo.getCategory1());
			pstmt.setString(13, bookvo.getCategory2());
			pstmt.setString(14, bookvo.getComment());
			pstmt.setString(15, bookvo.getBookImage());
			pstmt.setString(16, bookvo.getBestProduct());
			pstmt.setString(17, bookvo.getTodayProduct());
			pstmt.setString(18, bookvo.getHiddenProduct());
			pstmt.setString(19, bookvo.getBookId());

			isSuccess = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			con.close();
		}
		System.out.println("UPDATA DAO "+isSuccess);
		return isSuccess;
	}

	public int bookDelete(String bookId) throws SQLException{
		int deleteCount = 0;
		PreparedStatement pstmt = null;
		String sql = null;
		System.out.println("DB"+bookId);
		try {
			sql = "DELETE FROM hbook WHERE bookId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookId);
			
			deleteCount = pstmt.executeUpdate();
			System.out.println("DAO DB "+deleteCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deleteCount;

	}

	public ArrayList<BookVo> selectAllCountBook() {
		ArrayList<BookVo> bookList = new ArrayList<BookVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		//JSONArray arr = new JSONArray();
		try {
			String sql = "SELECT category1, count(category1) as booksCount FROM hbook GROUP BY category1 ";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				  BookVo bookvo = new BookVo();
				  bookvo.setCategory1(rs.getString("category1")); 
				  bookvo.setBooksCount(rs.getInt("booksCount"));
				  bookList.add(bookvo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bookList;
	}

	public int totalBookCount() {
		int totalBookCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			sql = "SELECT count(*) FROM hbook";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalBookCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalBookCount;
	}

	public JSONArray getAllBookLoading() {
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		JSONArray arr = new JSONArray();
		try {
			String sql = "SELECT * FROM hbook order by bookId desc limit 20";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				 JSONObject obj = new JSONObject(); 
			    obj.put("bookId",rs.getString("bookId"));
			    obj.put("bookName",rs.getString("bookName"));
			    obj.put("bookSubTitle",rs.getString("bookSubTitle"));
				obj.put("author",rs.getString("author"));
				obj.put("publishing",rs.getString("publishing"));
			    obj.put("publishDay",rs.getString("publishDay"));
			    obj.put("cost",rs.getString("cost"));
			    obj.put("rate",rs.getInt("rate"));
				obj.put("sellingPrice",rs.getString("sellingPrice"));
				obj.put("pageNum",rs.getInt("pageNum"));
			    obj.put("size",rs.getString("size"));
				obj.put("category1",rs.getString("category1"));
			    obj.put("category2",rs.getString("category2"));
			    obj.put("comment",rs.getString("comment"));
			    obj.put("bookImage",rs.getString("bookImage"));
			    obj.put("bestProduct",rs.getString("bestProduct"));
			    obj.put("todayProduct",rs.getString("todayProduct"));
			    obj.put("hiddenProduct",rs.getString("hiddenProduct"));

			    if(obj != null) 
			    	arr.add(obj);
			}
			
			//System.out.println(arr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
		
	}

	public JSONArray getCateBookLoading(int cate) {
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		JSONArray arr = new JSONArray();
		String sql = null;
		try {
			if(cate==1) {
				 sql = "SELECT * FROM hbook WHERE category1 ='IT모바일' order by bookId desc limit 20";
			}else if(cate==2) {
				 sql = "SELECT * FROM hbook WHERE category1 ='소설/시/희곡' order by bookId desc limit 20";
			}else if(cate==3) {
				 sql = "SELECT * FROM hbook WHERE category1 ='어린이' order by bookId desc limit 20";
			}else if(cate==4) {
				 sql = "SELECT * FROM hbook WHERE category1 ='에세이' order by bookId desc limit 20";
			}else if(cate==5) {
				 sql = "SELECT * FROM hbook WHERE category1 ='종교' order by bookId desc limit 20";
			}
			
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				 JSONObject obj = new JSONObject(); 
			    obj.put("bookId",rs.getString("bookId"));
			    obj.put("bookName",rs.getString("bookName"));
			    obj.put("bookSubTitle",rs.getString("bookSubTitle"));
				obj.put("author",rs.getString("author"));
				obj.put("publishing",rs.getString("publishing"));
			    obj.put("publishDay",rs.getString("publishDay"));
			    obj.put("cost",rs.getInt("cost"));
			    obj.put("rate",rs.getInt("rate"));
				obj.put("sellingPrice",rs.getInt("sellingPrice"));
				obj.put("pageNum",rs.getInt("pageNum"));
			    obj.put("size",rs.getString("size"));
				obj.put("category1",rs.getString("category1"));
			    obj.put("category2",rs.getString("category2"));
			    obj.put("comment",rs.getString("comment"));
			    obj.put("bookImage",rs.getString("bookImage"));
			    obj.put("bestProduct",rs.getString("bestProduct"));
			    obj.put("todayProduct",rs.getString("todayProduct"));
			    obj.put("hiddenProduct",rs.getString("hiddenProduct"));

			    if(obj != null) 
			    	arr.add(obj);
			}
			
			//System.out.println(arr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
		
	}

	public JSONArray getSearchBookLoading(String searchKey) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		JSONArray arr = new JSONArray();
		String sql = null;
		try {
			sql =  "SELECT * FROM hbook WHERE bookName LIKE '%" + searchKey + "%' or author LIKE '%"+searchKey+"%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				 JSONObject obj = new JSONObject(); 
			    obj.put("bookId",rs.getString("bookId"));
			    obj.put("bookName",rs.getString("bookName"));
			    obj.put("bookSubTitle",rs.getString("bookSubTitle"));
				obj.put("author",rs.getString("author"));
				obj.put("publishing",rs.getString("publishing"));
			    obj.put("publishDay",rs.getString("publishDay"));
			    obj.put("cost",rs.getInt("cost"));
			    obj.put("rate",rs.getInt("rate"));
				obj.put("sellingPrice",rs.getInt("sellingPrice"));
				obj.put("pageNum",rs.getInt("pageNum"));
			    obj.put("size",rs.getString("size"));
				obj.put("category1",rs.getString("category1"));
			    obj.put("category2",rs.getString("category2"));
			    obj.put("comment",rs.getString("comment"));
			    obj.put("bookImage",rs.getString("bookImage"));
			    obj.put("bestProduct",rs.getString("bestProduct"));
			    obj.put("todayProduct",rs.getString("todayProduct"));
			    obj.put("hiddenProduct",rs.getString("hiddenProduct"));

			    if(obj != null) 
			    	arr.add(obj);
			}
			
			//System.out.println(arr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
	}

	public JSONArray getAllBestBookLoading() {
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		JSONArray arr = new JSONArray();
		try {
			String sql = "SELECT * FROM hbook WHERE bestProduct = 'y' order by bookId desc limit 20";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				 JSONObject obj = new JSONObject(); 
			    obj.put("bookId",rs.getString("bookId"));
			    obj.put("bookName",rs.getString("bookName"));
			    obj.put("bookSubTitle",rs.getString("bookSubTitle"));
				obj.put("author",rs.getString("author"));
				obj.put("publishing",rs.getString("publishing"));
			    obj.put("publishDay",rs.getString("publishDay"));
			    obj.put("cost",rs.getInt("cost"));
			    obj.put("rate",rs.getInt("rate"));
				obj.put("sellingPrice",rs.getInt("sellingPrice"));
				obj.put("pageNum",rs.getInt("pageNum"));
			    obj.put("size",rs.getString("size"));
				obj.put("category1",rs.getString("category1"));
			    obj.put("category2",rs.getString("category2"));
			    obj.put("comment",rs.getString("comment"));
			    obj.put("bookImage",rs.getString("bookImage"));
			    obj.put("bestProduct",rs.getString("bestProduct"));
			    obj.put("todayProduct",rs.getString("todayProduct"));
			    obj.put("hiddenProduct",rs.getString("hiddenProduct"));

			    if(obj != null) 
			    	arr.add(obj);
			}
			
			//System.out.println(arr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
		
	}

	public JSONArray getCateBestBookLoading(int cate) {
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		JSONArray arr = new JSONArray();
		String sql = null;
		try {
			if(cate==1) {
				 sql = "SELECT * FROM hbook WHERE category1 ='IT모바일' and bestProduct='y' order by bookId desc limit 20";
			}else if(cate==2) {
				 sql = "SELECT * FROM hbook WHERE category1 ='소설/시/희곡' and bestProduct='y'  order by bookId desc limit 20";
			}else if(cate==3) {
				 sql = "SELECT * FROM hbook WHERE category1 ='어린이' and bestProduct='y'  order by bookId desc limit 20";
			}else if(cate==4) {
				 sql = "SELECT * FROM hbook WHERE category1 ='에세이' and bestProduct='y'  order by bookId desc limit 20";
			}else if(cate==5) {
				 sql = "SELECT * FROM hbook WHERE category1 ='종교' and bestProduct='y' order by bookId desc limit 20";
			}
			
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				 JSONObject obj = new JSONObject(); 
			    obj.put("bookId",rs.getString("bookId"));
			    obj.put("bookName",rs.getString("bookName"));
			    obj.put("bookSubTitle",rs.getString("bookSubTitle"));
				obj.put("author",rs.getString("author"));
				obj.put("publishing",rs.getString("publishing"));
			    obj.put("publishDay",rs.getString("publishDay"));
			    obj.put("cost",rs.getInt("cost"));
			    obj.put("rate",rs.getInt("rate"));
				obj.put("sellingPrice",rs.getInt("sellingPrice"));
				obj.put("pageNum",rs.getInt("pageNum"));
			    obj.put("size",rs.getString("size"));
				obj.put("category1",rs.getString("category1"));
			    obj.put("category2",rs.getString("category2"));
			    obj.put("comment",rs.getString("comment"));
			    obj.put("bookImage",rs.getString("bookImage"));
			    obj.put("bestProduct",rs.getString("bestProduct"));
			    obj.put("todayProduct",rs.getString("todayProduct"));
			    obj.put("hiddenProduct",rs.getString("hiddenProduct"));

			    if(obj != null) 
			    	arr.add(obj);
			}
			
			//System.out.println(arr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
	}

	

	
	
}
