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
import com.pe.admin.vo.FaqVo;

public class FaqDAO {

	private Connection con;

	public FaqDAO() {
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

	public int insertFaq(FaqVo faqvo) throws SQLException {
		PreparedStatement pstmt = null;
		int insertCount = 0;

		try {
			
			int last_num = get_last_num(faqvo.getCategory());
			if(last_num==0) {
				last_num = 1;
			}else {
				last_num++;
			}
			
			String sql = "INSERT INTO faq (orders,category,question,answer) VALUES (?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, last_num);
			pstmt.setInt(2, faqvo.getCategory());
			pstmt.setString(3,faqvo.getQuestion());
			pstmt.setString(4,faqvo.getAnswer());

			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			con.close();
		}

		return insertCount;
	}

	private int get_last_num(int category) {
			ResultSet rs = null;
			PreparedStatement pstmt = null;
		   String sql = null;
		   int count = 0;
		   try {
			   if(category == 1) {
				   sql = "SELECT COUNT(orders) AS COUNT FROM faq WHERE category = 1 ORDER BY orders DESC LIMIT 1";
			   }else if(category==2) {
				   sql = "SELECT COUNT(orders) AS COUNT FROM faq WHERE category = 2 ORDER BY orders DESC LIMIT 1";
			   }else if(category==3) {
				   sql = "SELECT COUNT(orders) AS COUNT FROM faq WHERE category = 3 ORDER BY orders DESC LIMIT 1";
			   }
			   
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					 count = rs.getInt("count");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
				   
		   return count;
	}

	public ArrayList<FaqVo> getOrderFaqList() {
		ArrayList<FaqVo> faqList = new ArrayList<FaqVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		String sql = null;

		try {
			
		   sql = "SELECT * FROM faq WHERE category = 1 order by orders asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				FaqVo faqvo = new FaqVo();
				faqvo.setNum(rs.getInt("num"));
				faqvo.setOrder(rs.getInt("orders"));
				faqvo.setCategory(rs.getInt("category"));
				faqvo.setQuestion(rs.getString("question"));
				faqvo.setAnswer(rs.getString("answer"));
				faqList.add(faqvo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return faqList;
	}

	public ArrayList<FaqVo> getDeliveryFaqList() {
		ArrayList<FaqVo> faqList = new ArrayList<FaqVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		String sql = null;

		try {
			
		   sql = "SELECT * FROM faq WHERE category = 2 order by orders asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				FaqVo faqvo = new FaqVo();
				faqvo.setNum(rs.getInt("num"));
				faqvo.setOrder(rs.getInt("orders"));
				faqvo.setCategory(rs.getInt("category"));
				faqvo.setQuestion(rs.getString("question"));
				faqvo.setAnswer(rs.getString("answer"));
				faqList.add(faqvo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return faqList;
	}

	public ArrayList<FaqVo> getMemberFaqList() {
		ArrayList<FaqVo> faqList = new ArrayList<FaqVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		String sql = null;

		try {
			
		   sql = "SELECT * FROM faq WHERE category = 3 order by orders asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				FaqVo faqvo = new FaqVo();
				faqvo.setNum(rs.getInt("num"));
				faqvo.setOrder(rs.getInt("orders"));
				faqvo.setCategory(rs.getInt("category"));
				faqvo.setQuestion(rs.getString("question"));
				faqvo.setAnswer(rs.getString("answer"));
				faqList.add(faqvo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return faqList;
	}

	public int faqUpdate(FaqVo faqvo) throws SQLException {
		PreparedStatement pstmt = null;
		int isSuccess = 0;

		try {
			String sql = "UPDATE faq SET category=?, question=?, answer=? WHERE num = ?";
			System.out.println("Update category" + faqvo.getCategory());
			System.out.println("Update Question" + faqvo.getQuestion());
			System.out.println("Update Answer" + faqvo.getAnswer());
			System.out.println("Update Num " + faqvo.getNum());
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, faqvo.getCategory());
			pstmt.setString(2, faqvo.getQuestion());
			pstmt.setString(3,faqvo.getAnswer());
			pstmt.setInt(4,faqvo.getNum());
			isSuccess = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			con.close();
		}
		return isSuccess;
	}

	public int faqDelete(int num) throws SQLException {
		PreparedStatement pstmt = null;
		int isSuccess = 0;
		try {
			String sql = "DELETE FROM faq WHERE num = ?";
			//System.out.println("category" + category);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			isSuccess = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			con.close();
		}
		return isSuccess;
	}

	
	
	public int getCount(int category) {
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int count = 0;
	   try {
		   if(category == 1) {
			   sql = "SELECT COUNT(*) AS count FROM faq WHERE category = 1";
		   }else if(category==2) {
			   sql = "SELECT COUNT(*) AS count FROM faq WHERE category = 2";
		   }else if(category==3) {
			   sql = "SELECT COUNT(*) AS count FROM faq WHERE category = 3";
		   }
		   System.out.println(sql);
		pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 count = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			   
	   return count;
	}

	public int modifyOrder(ArrayList<FaqVo> faqList, int div) throws SQLException {
		PreparedStatement pstmt = null;
		int isSuccess = 0;

		try {
			if(div==1) {
				for(int i=0; i<faqList.size();i++) {
					String sql = "UPDATE faq SET orders= ? WHERE num = ? and category = 1";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, i+1);
					pstmt.setInt(2, faqList.get(i).getNum());
					System.out.println("orders " + faqList.get(i).getOrder());
					System.out.println("num " + faqList.get(i).getNum());
					isSuccess =   pstmt.executeUpdate();
					pstmt.clearParameters();
				}
			}else if(div==2) {
				for(int i=0; i<faqList.size();i++) {
					String sql = "UPDATE faq SET orders= ? WHERE num = ? and category = 2";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, i+1);
					pstmt.setInt(2, faqList.get(i).getNum());
					System.out.println("orders " + faqList.get(i).getOrder());
					System.out.println("num " + faqList.get(i).getNum());
					isSuccess =   pstmt.executeUpdate();
					pstmt.clearParameters();
				}
			}else if(div==3) {
				for(int i=0; i<faqList.size();i++) {
					String sql = "UPDATE faq SET orders= ? WHERE num = ? and category = 3";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, i+1);
					pstmt.setInt(2, faqList.get(i).getNum());
					System.out.println("orders " + faqList.get(i).getOrder());
					System.out.println("num " + faqList.get(i).getNum());
					isSuccess =   pstmt.executeUpdate();
					pstmt.clearParameters();
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return isSuccess;
	}

}
