package com.pe.bluering.dao;

import static com.pe.bluering.db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.pe.bluering.vo.BoardBean;

public class BoardDAO {
	
	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;
	
	private BoardDAO() {
		
	}
	
	public static BoardDAO getInstance() {
		if(boardDAO ==  null)
			boardDAO = new BoardDAO();
		
		return boardDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	
	//글의 개수
	public int selectListCount() {
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT count(*) FROM hboard";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					listCount = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return listCount;
	}
	
	
	public ArrayList<BoardBean> selectArticleList(int page, int limit) {
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT *  FROM hboard order by re_ref desc, re_lev asc limit ?,10";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow = (page-1) * 10; //읽기 시작할  row 번호
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board = new BoardBean();
				board.setBoard_num(rs.getInt("board_num"));
				board.setBoard_name(rs.getString("board_name"));
				board.setBoard_pass(rs.getString("board_pass"));
				board.setBoard_subject(rs.getString("board_subject"));
				board.setBoard_content(rs.getString("board_content"));
				board.setBoard_file(rs.getString("board_file"));
				board.setRe_ref(rs.getInt("re_ref"));
				board.setRe_lev(rs.getInt("re_lev"));
				board.setRe_step(rs.getInt("re_step"));
				board.setBoard_readcount(rs.getInt("board_readcount"));
				board.setDate(rs.getString("board_date"));
				articleList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return articleList;
	}

	public int insertArticle(BoardBean boardBean) {
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		int insertCount = 0;
		
		try {
			String sql = "INSERT INTO hboard (board_subject, board_content, board_file) VALUES (?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardBean.getBoard_subject());
			pstmt.setString(2, boardBean.getBoard_content());
			pstmt.setString(3, boardBean.getBoard_file());
			
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return insertCount;
	}

}
