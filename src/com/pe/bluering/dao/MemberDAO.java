package com.pe.bluering.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.pe.bluering.vo.CouponVO;
import com.pe.bluering.vo.MemberVO;

public class MemberDAO {

	private Connection con;

	public MemberDAO() {
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

	public int insertMember(MemberVO memberVo) throws SQLException {

		PreparedStatement pstmt = null;
		int insertCount = 0;
		
		try {
			String sql = "INSERT INTO hmember (id,pwd,name,email,zipnum,addr1,addr2,gender,phone,useyn,profileimg,lev,indate) VALUES (?,?,?,?,?,?,?,?,?,?,?,1,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberVo.getId());
			pstmt.setString(2, memberVo.getPwd());
			pstmt.setString(3, memberVo.getName());
			pstmt.setString(4, memberVo.getEmail());
			pstmt.setString(5, memberVo.getZipnum());
			pstmt.setString(6, memberVo.getAddr1());
			pstmt.setString(7, memberVo.getAddr2());
			pstmt.setString(8, memberVo.getGender());
			pstmt.setString(9, memberVo.getPhone());
			pstmt.setString(10, "y");
			pstmt.setString(11, memberVo.getProfileimg());

			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			con.close();
		}
		
		return insertCount;
	}

	public int idCheck(String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		
		try {
			String sql = "SELECT id FROM hmember WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 1;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			con.close();
		}

		return 0;
	}
	

	public int loginPro(String id, String pass) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			String sql = "SELECT pwd FROM hmember WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pwd") != null && rs.getString("pwd").equals(pass)) {
					result = 1;  // 암호와 비밀번호가 모두 일치한다.
				}else {
					result = 0; //아이디는 일치하지만 비번이 불일치
				}
			}else {
				result = -1;  //해당 아이디가 존재하지 않는다
			}
			
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			con.close();
		}

		return result;
	}

	public MemberVO getMember(String id) throws SQLException {
		MemberVO mvo = new MemberVO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM hmember WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mvo.setId(rs.getString("id"));
				mvo.setPwd(rs.getString("pwd"));
				mvo.setName(rs.getString("name"));
				mvo.setEmail(rs.getString("email"));
				mvo.setZipnum(rs.getString("zipnum"));
				mvo.setAddr1(rs.getString("addr1"));
				mvo.setAddr2(rs.getString("addr2"));
				mvo.setGender(rs.getString("gender"));
				mvo.setPhone(rs.getString("phone"));
				mvo.setUseyn(rs.getString("useyn"));
				mvo.setProfileimg(rs.getString("profileimg"));
				mvo.setLev(rs.getInt("lev"));
				mvo.setIndate(rs.getString("indate"));
			}
			
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			con.close();
		}
		
		return mvo;
	}

	public int  updateMember(MemberVO memberVo) throws SQLException {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		try {
			String sql = "UPDATE hmember SET pwd = ?, name =?, email = ?, zipnum = ?, addr1 = ?, addr2 = ?, gender =?, phone=?, profileimg=? WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, memberVo.getPwd());
			pstmt.setString(2, memberVo.getName());
			pstmt.setString(3, memberVo.getEmail());
			pstmt.setString(4, memberVo.getZipnum());
			pstmt.setString(5, memberVo.getAddr1());
			pstmt.setString(6, memberVo.getAddr2());
			pstmt.setString(7,memberVo.getGender());
			pstmt.setString(8, memberVo.getPhone());
			pstmt.setString(9, memberVo.getProfileimg());
			pstmt.setString(10, memberVo.getId());
	
			updateCount = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
		
			con.close();
		}
		
		
		return updateCount;
	}

	
	
	//해당 아이디를 가진 유저의 쿠폰리스트 모두 가져오기
	public ArrayList<CouponVO> getCoupon(String id) throws SQLException {
		
		ArrayList<CouponVO> cvo = new ArrayList<CouponVO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM hcoupon WHERE useUser =?" ;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CouponVO cpon = new CouponVO();
				cpon.setCnum(rs.getInt("cnum"));
				cpon.setCname(rs.getString("cname"));
				cpon.setCype(rs.getString("ctype"));
				cpon.setCregdate(rs.getString("cregdate"));
				cpon.setUseUser(rs.getString("useUser"));	
				cvo.add(cpon);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {

			con.close();
		}
		
		return cvo;
	}

	
	//해당 아이디를 가진 유저의 쿠폰 개수 구하기
	public int getCountCoupon(String id) throws SQLException {
		
		System.out.println("넘어온 값:"+id);
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT count(*) as count FROM hcoupon WHERE useUser = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			con.close();
		}
		
		return count;
	}
	

}