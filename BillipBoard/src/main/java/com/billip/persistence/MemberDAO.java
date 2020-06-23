package com.billip.persistence;

import com.billip.domain.MemberVO;

public interface MemberDAO {
	
	public int check_id(String id) throws Exception;
	
	public int check_email(String email) throws Exception;
	
	public int join_member(MemberVO member) throws Exception;
	
	public int approval_member(MemberVO member) throws Exception;
	
	// 로그인
	public MemberVO login(String id) throws Exception;
	
	// 접속 시간 업뎃
	public int update_log(String id) throws Exception;
	
	// 아이디 찾기
	public String find_id(String email) throws Exception;
	
	//비밀번호 변경
	public int update_pw(MemberVO member) throws Exception;
	
	//마이페이지
	public int update_mypage(MemberVO member) throws Exception;
	
	// 회원 탈퇴
	public int delete_member(MemberVO member) throws Exception;
	

}
