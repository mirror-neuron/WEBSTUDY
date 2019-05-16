package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.util.DBConn;

public class SalDAO
{
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터베이스 입력 담당 메소드
	public int add(SalDTO dto) throws SQLException 
	{
		int result = 0;
		
		String sql = "INSERT INTO SALGRADE(GRADE, LOSAL, HISAL) VALUES(?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getGrade());
		pstmt.setInt(2, dto.getLosal());
		pstmt.setInt(3, dto.getHisal());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 급여 등급 리스트 출력 담당 메소드
	public ArrayList<SalDTO> lists() throws SQLException
	{
		ArrayList<SalDTO> result = new ArrayList<SalDTO>();
		
		String sql = "SELECT GRADE, LOSAL, HISAL FROM SALGRADE ORDER BY GRADE";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		SalDTO sal = null;
		while (rs.next())
		{
			sal = new SalDTO();
			sal.setGrade(rs.getString("GRADE"));
			sal.setLosal(rs.getInt("LOSAL"));
			sal.setHisal(rs.getInt("HISAL"));
		
			result.add(sal);
		}
		rs.close();
		pstmt.close();
		
		return result;		
	}
	
	// 급여 등급 검색 담당 메소드
	public SalDTO search(String grade) throws SQLException
	{
		SalDTO result = new SalDTO();
		
		String sql = "SELECT GRADE, LOSAL, HISAL FROM SALGRADE WHERE GRADE=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, grade);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setGrade(rs.getString("GRADE"));
			result.setLosal(rs.getInt("LOSAL"));
			result.setHisal(rs.getInt("HISAL"));
		}
		rs.close();
		pstmt.close();
				
		return result;
	}
	
	// 급여 등급 데이터 수정 담당 메소드
	public int modify(SalDTO sal) throws SQLException 
	{
		int result = 0;
		
		String sql = "UPDATE SALGRADE SET LOSAL=?, HISAL=? WHERE GRADE=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, sal.getLosal());
		pstmt.setInt(2, sal.getHisal());
		pstmt.setString(3, sal.getGrade());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 급여 등급 데이터 삭제 담당 메소드
	public int remove(String grade) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE FROM SALGRADE WHERE GRADE=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, grade);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();	
		return result;
	}
	
	// 자식 테이블 참조 데이터 레코드 수 확인
	public int refCount(String grade) throws SQLException 
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM SALGRADE WHERE GRADE=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, grade);
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 데이터베이스 연결 종료 담당 메소드
	public void close() throws SQLException 
	{
		DBConn.close();
	}
	
}
