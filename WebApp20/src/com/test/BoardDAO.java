/*=========================
  	   BoardDAO.java
==========================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO
{
	private Connection conn;
	
	// 생성자 정의
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	// 게시물 번호의 최대값 얻어내기
	public int getMaxNum() throws SQLException
	{
		int result  = 0;
		
		String sql = "SELECT NVL(MAX(NUM), 0) AS MAXIMUM FROM TBL_BOARD";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
			result = rs.getInt("MAXIMUM");
		
		rs.close();
		pstmt.close();
		
		return result ;
	}// end getMaxNum()
	
	
	// 게시물 작성 → 데이터 입력
	public int insertData(BoardDTO dto) throws SQLException
	{
		int result = 0;
	
		try
		{
			String sql = "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2,  dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5,  dto.getSubject());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7,  dto.getIpAddr());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
			
		return result;
	}// end insertData()
	
	// DB 레코드의 갯수를 가져오는 메소드 정의
	// → 검색 기능을 작업하며 수정하게 될 메소드
	public int getDataCount() throws SQLException
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		
		return result;
		
	}//end getDataCount()
	
	
	// 특정 영역의(시작번호 ~ 끝번호) 게시물의 목록을 
	// 읽어오는 메소드 정의
	// → 검색 기능을 작업하며 수정하게 될 메소드
	public List<BoardDTO> getLists(int start, int end) throws SQLException
	{
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED ";
			sql += "FROM ";
			sql += "(";
			sql += "	SELECT ROWNUM RNUM,  DATA.*";
			sql += "	FROM ";
			sql += "	(SELECT NUM, NAME, SUBJECT, HITCOUNT";
			sql += ", TO_CHAR(CREATED, 'YYYY-MM-DD')";
			sql += " AS CREATED FROM TBL_BOARD ORDER BY NUM DESC) ";
			sql	+= "DATA )";
			sql += " WHERE RNUM >= ? AND RNUM <= ?";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(1, end);
			
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));
				
				result.add(dto);
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	
		return result;
		
	}//end getLists()
	
	
	// 특정 게시물 조회에 따른 조회 횟수 증가 메소드 정의
	public int updateHitCount(int num)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = " ";
		
		try
		{
			sql = "UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}//end updateHitCount()
	
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의
	public BoardDTO getReadData(int num)
	{
		BoardDTO result = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT,"
				+ ", CONTENT, IPADDR, HITCOUNT, CREATED "
				+ " FROM TBL_BOARD"
				+ " WHERE NUM=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				result = new BoardDTO();
				result.setNum(rs.getInt("NUM"));
				result.setName(rs.getString("NAME"));
				result.setPwd(rs.getString("PWD"));
				result.setEmail(rs.getString("EMAIL"));
				result.setSubject(rs.getString("SUBJECT"));
				result.setContent(rs.getString("CONTENT"));
				result.setIpAddr(rs.getString("IPADDR"));
				result.setHitCount(rs.getInt("HITCOUNT"));
				result.setCreated(rs.getString("CREATED"));
			}	
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}//end getReadData()
	
	
	// 특정 게시물을 삭제하는 기능의 메소드 정의
	public int deleteData(int num)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql = "DELETE FROM TBL_BOARD WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
		
	}//end deleteData()
	
	
	// Article.jsp 페이지 내에서
	// 해당 게시물의 내용을 수정하는 메소드 정의
	public int updateData(BoardDTO dto)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql = "UPDATE TBL_BOARD"
			    + " SET NAME=?, PWD=?, EMAIL=?, SUBJECT=?, CONTENT=?"
			    + " WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(7, dto.getNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}//end updateData()
	
	
	
	
	
	
	
	
	
	
}
