package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class DeptDAO
{
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	
	// 데이터베이스 입력 담당 메소드
	public int add(DeptDTO dept) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO DEPT(DEPTNO, DNAME, LOC) VALUES((SELECT MAX(DEPTNO) AS DEPTNO FROM DEPT)+10, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dept.getdName());
		pstmt.setString(2, dept.getLoc());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 부서 리스트 출력 담당 메소드
	public ArrayList<DeptDTO> lists() throws SQLException
	{
		ArrayList<DeptDTO> result = new ArrayList<DeptDTO>();
		
		String sql = "SELECT DEPTNO, DNAME, LOC FROM DEPT";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			DeptDTO dto = new DeptDTO();
			
			dto.setDeptNo(rs.getString("DEPTNO"));
			dto.setdName(rs.getString("DNAME"));
			dto.setLoc(rs.getString("LOC"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 부서 수 확인 담당 메소드
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql ="SELECT COUNT(*) AS COUNT FROM DEPT";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
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
	
	// 부서 정보 검색 담당 메소드
	public DeptDTO searchDept(String deptNo) throws SQLException 
	{
		DeptDTO result = new DeptDTO();
		
		String sql = "SELECT DEPTNO, DNAME, LOC FROM DEPT WHERE DEPTNO = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, deptNo);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setDeptNo(rs.getString("DEPTNO"));
			result.setdName(rs.getString("DNAME"));
			result.setLoc(rs.getString("LOC"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 부서 정보 수정 담당 메소드
	public int modify(DeptDTO dept) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE DEPT SET DNAME=?, LOC= ? WHERE DEPTNO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dept.getdName());
		pstmt.setString(2, dept.getLoc());
		pstmt.setString(3, dept.getDeptNo());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 회원 정보 삭제 담당 메소드
	public int remove(String deptNo) throws SQLException 
	{
		int result = 0;
		
		String sql = "DELETE FROM DEPT WHERE DEPTNO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, deptNo);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 자식 테이블의 참조 데이터 레코드 수 확인
	public int refCount(String deptNo) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM EMP WHERE DEPTNO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, deptNo);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		
		return result;
	}
}

















