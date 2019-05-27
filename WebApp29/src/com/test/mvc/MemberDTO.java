package com.test.mvc;

public class MemberDTO
{
	// 주요 속성 구성(프로퍼티 구성)
	private String id, pw, name, tel, email; //-- 아이디, 비밀번호, 이름, 전화번호, 이메일
	
	// default 생성자
	public MemberDTO()
	{
		
	}
	
	// 사용자 정의 생성자
	public MemberDTO(String id, String pw, String name, String tel, String email)
	{
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.email = email;
	}
	
	// getter / setter 구성
	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getPw()
	{
		return pw;
	}

	public void setPw(String pw)
	{
		this.pw = pw;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}
	

}
