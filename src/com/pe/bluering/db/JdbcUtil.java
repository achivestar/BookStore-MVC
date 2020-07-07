package com.pe.bluering.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcUtil {

	public static Connection getConnection() {
		 Connection con = null;
		 
		 try {
			 
			 InitialContext initCtx = new InitialContext();
			 DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/kkameun12");
			 con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		 return con;
	}
	
	public static void close(Connection con) {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(PreparedStatement pstmt) {
		try {
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
