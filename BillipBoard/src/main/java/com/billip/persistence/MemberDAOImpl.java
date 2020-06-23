package com.billip.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.billip.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlsession = null;
	
	private static String namespace = "com.billip.mapper.MemberMapper";
	
	@Override
	public int check_id(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".check_id", id);
	}

	@Override
	public int check_email(String email) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".check_email", email);
	}

	@Override
	public int join_member(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.insert(namespace + ".join_member", member);
	}

	@Override
	public int approval_member(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace + ".approval_member", member);
	}
	
	@Override
	public MemberVO login(String id) throws Exception
	{
		return sqlsession.selectOne(namespace + ".login", id);
	}
	
	@Transactional
	public int update_log(String id) throws Exception
	{
		return sqlsession.update(namespace + ".update_log", id);
	}
	
	@Override
	public String find_id(String email) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".find_id", email);
	}
	
	@Transactional
	public int update_pw(MemberVO member) throws Exception{
		return sqlsession.update(namespace + ".update_pw", member);
	}
	
	@Transactional
	public int update_mypage(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+ ".update_mypage", member);
	}
}
