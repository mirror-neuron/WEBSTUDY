package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.util.DBConn;

public class MemberDAO
{
	private Connection conn;
	
	// 데이터베이스 연결 → 생성자 형태로 정희
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터 입력 메소드 정의
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		String sql = "INSERT INTO TBL_MEMBERLIST (ID, PW, NAME, TEL, EMAIL)"
				+ " VALUES(?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,  dto.getId());
		pstmt.setString(2, dto.getPw());
		pstmt.setString(3, dto.getName());
		pstmt.setString(4, dto.getTel());
		pstmt.setString(5, dto.getEmail());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}//end Add()
	
	// 전체 회원수 출력 메소드 정의
	public int count() throws SQLException 
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}//end count()
	

	// 전체 리스트 출력 메소드 정의
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT ID, PW, NAME, TEL, EMAIL FROM TBL_MEMBERLIST ORDER BY ID";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			dto.setId(rs.getString("ID"));
			dto.setId(rs.getString("PW"));
			dto.setId(rs.getString("NAME"));
			dto.setId(rs.getString("TEL"));
			dto.setId(rs.getString("EMAIL"));
		
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;
		
	}
	
	// 데이터베이스 연결 종료 담당 메소드 정의
	public void close() throws SQLException 
	{
		DBConn.close();
	}
	
}
