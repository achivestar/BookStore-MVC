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


	public ArrayList<OrderVo> selectAllOrder(String memberId) {
		ArrayList<OrderVo> orderList = new ArrayList<OrderVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");
		Date time = new Date();
				
		String now = format.format(time);
		try {
			String sql = "SELECT * FROM orders WHERE member_Id = ? and buy_date = ? order by buy_date";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2,now );
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

	public int addOrder(String memberId, ArrayList<OrderVo> orderList, int availPoint, int addPoint) throws SQLException {
		System.out.println("Order DB");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int point = 0;
		int insertCount = 0;
		try {
			for(int i=0; i<orderList.size();i++) {
			String sql = "INSERT INTO orders (order_id,cart_id,member_id,product_id,book_title,price,amount,book_img,buy_date,deliveryTel,deliveryAddr,message)";
			sql+= " values (?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, orderList.get(i).getOrder_id());
			pstmt.setInt(2, orderList.get(i).getCart_id());
			pstmt.setString(3, orderList.get(i).getMember_id());
			pstmt.setString(4, orderList.get(i).getProduct_id());
			pstmt.setString(5, orderList.get(i).getBook_title());
			pstmt.setInt(6, orderList.get(i).getPrice());
			pstmt.setInt(7, orderList.get(i).getAmount());
			pstmt.setString(8, orderList.get(i).getBook_img());
			pstmt.setString(9, orderList.get(i).getBuy_date());
			pstmt.setString(10, orderList.get(i).getDeliveryTel());
			pstmt.setString(11, orderList.get(i).getDeliveryAddr());
			pstmt.setString(12, orderList.get(i).getMessage());
			insertCount = pstmt.executeUpdate();
			pstmt = null;
			};
			
			String pointSql = "SELECT point FROM hmember WHERE id = ?";
			pstmt = con.prepareStatement(pointSql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				point = rs.getInt("point");
			}
			pstmt = null;
			String sqlMember = "UPDATE hmember SET point = ? WHERE id  = ?";
			System.out.println("availPoint" + availPoint);
			System.out.println("point " + point);
			pstmt = con.prepareStatement(sqlMember);
			pstmt.setInt(1, point-availPoint);
			pstmt.setString(2, memberId);
			pstmt.executeUpdate();
			
			pstmt = null;
			
			String pointSql2 = "SELECT point FROM hmember WHERE id = ?";
			pstmt = con.prepareStatement(pointSql2);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				point = rs.getInt("point");
			}
			
			
			String sqlMember2 = "UPDATE hmember SET point = ? WHERE id  = ?";
			System.out.println("availPoint" + availPoint);
			System.out.println("addPoint " + addPoint);
			pstmt = con.prepareStatement(sqlMember2);
			pstmt.setInt(1,point+addPoint);
			pstmt.setString(2, memberId);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			con.close();
		}

		return insertCount;
	}


	public void modifyOrder(int[] cart_id) throws SQLException {
		
		PreparedStatement pstmt = null;
		
		try {
			for(int i=0; i<cart_id.length;i++) {
				String sql = "UPDATE cart SET state=1 WHERE cid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,cart_id[i]);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}

	}

	
	
}
