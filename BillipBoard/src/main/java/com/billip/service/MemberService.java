package com.billip.service;

import javax.servlet.http.HttpServletResponse;

import com.billip.domain.MemberVO;

public interface MemberService {

	public void check_id(String id, HttpServletResponse response) throws Exception;
	
	public void check_email(String email, HttpServletResponse response) throws Exception;
	
	public int join_member(MemberVO member, HttpServletResponse response) throws Exception;
	
	public String create_key() throws Exception;
	
	public void send_mail(MemberVO member, String div) throws Exception;
	
	public void approval_member(MemberVO member, HttpServletResponse response) throws Exception;
	
	public MemberVO login(MemberVO member, HttpServletResponse response) throws Exception;
	
	public void logout(HttpServletResponse response) throws Exception;
	
	// 아이디 찾기
	public String find_id(HttpServletResponse response, String email) throws Exception;
	
	// 비밀번호 찾기
	public void find_pw(HttpServletResponse response, MemberVO member) throws Exception;
	
	// 회원정보 수정
	public MemberVO update_mypage(MemberVO member) throws Exception;

	//비밀번호 변경
	public MemberVO update_pw(MemberVO member, String old_pw, HttpServletResponse response) throws Exception;
	
	// 회원 탈퇴
	public boolean delete_member(MemberVO member, HttpServletResponse response) throws Exception;
	

}
