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

import com.pe.admin.vo.FaqVo;
import com.pe.admin.vo.QnaVo;

public class QnaDAO {

	private Connection con;

	public QnaDAO() {
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

	public int insertQna(String question, String content, String member) throws SQLException {
		PreparedStatement pstmt = null;
		int insertCount = 0;

		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String date = sdf.format(time);
		try {
			String sql = "INSERT INTO qna (member,question,content,regdate) VALUES (?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member);
			pstmt.setString(2,question);
			pstmt.setString(3,content);
			pstmt.setString(4,date);

			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			con.close();
		}

		return insertCount;
	}
	


	public ArrayList<QnaVo> getQnaList() {
		ArrayList<QnaVo> qnaList = new ArrayList<QnaVo>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		String sql = null;

		try {
			
		   sql = "SELECT * FROM qna order by regdate asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaVo qnavo = new QnaVo();
				qnavo.setNum(rs.getInt("num"));
				qnavo.setMember(rs.getString("member"));
				qnavo.setQuestion(rs.getString("question"));
				qnavo.setContent(rs.getString("content"));
				qnavo.setAnswer(rs.getString("answer"));
				qnavo.setRegdate(rs.getString("regdate"));
				qnavo.setState(rs.getInt("state"));

				qnaList.add(qnavo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return qnaList;
	}

}
