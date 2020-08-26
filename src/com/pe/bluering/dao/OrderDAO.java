package com.pe.bluering.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.pe.admin.vo.BookVo;
import com.pe.bluering.vo.CartVo;
import com.pe.bluering.vo.MemberVO;
import com.pe.bluering.vo.OrderVo;

public class OrderDAO {

	private Connection con;

	public OrderDAO() {
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

	public int addOrder(CartVo cartOneList, MemberVO oneMember) throws SQLException {
		System.out.println("Order DB");
		PreparedStatement pstmt = null;
		int insertCount = 0;
		long order_id = System.currentTimeMillis();
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		String now = format.format(time);
		String addr = oneMember.getAddr1()+" "+oneMember.getAddr2();
		try {
			String sql = "INSERT INTO orders (order_id,member_id,product_id,book_title,price,amount,book_img,buy_date,deliveryTel,deliveryAddr)";
			sql+= " values (?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (int) order_id);
			pstmt.setString(2, oneMember.getId());
			pstmt.setString(3, cartOneList.getProductId());
			pstmt.setString(4, cartOneList.getBookName());
			pstmt.setInt(5, cartOneList.getBookPrice());
			pstmt.setInt(6,cartOneList.getAmount());
			pstmt.setString(7, cartOneList.getBookImg());
			pstmt.setString(8,now);
			pstmt.setString(9, oneMember.getPhone());
			pstmt.setString(10, addr);
		
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			con.close();
		}

		return insertCount;
	}

	public ArrayList<OrderVo> selectAllOrder(String memberId) {
		ArrayList<OrderVo> orderList = new ArrayList<OrderVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "SELECT * FROM orders WHERE member_Id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderVo orderVo = new OrderVo();
				orderVo.setOrder_id(rs.getInt("order_id"));
				orderVo.setMember_id(rs.getString("member_id"));
				orderVo.setProduct_id(rs.getString("product_id"));
				orderVo.setBook_title(rs.getString("book_title"));
				orderVo.setPrice(rs.getInt("price"));
				orderVo.setAmount(rs.getInt("amount"));
				orderVo.setBook_img(rs.getString("book_img"));
				orderVo.setBuy_date(rs.getString("buy_date"));
				orderVo.setDeliveryTel(rs.getString("deliveryTel"));
				orderVo.setDeliveryAddr(rs.getString("deliveryAddr"));
				orderVo.setMessage(rs.getString("message"));
				orderVo.setState(rs.getString("state"));
				orderList.add(orderVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderList;
	}
	
	
}
