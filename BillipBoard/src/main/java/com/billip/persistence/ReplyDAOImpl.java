package com.billip.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.billip.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	SqlSession sqlsession = null;
	
	private static String namespace = "com.billip.mapper.ReplyMapper";
	
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".readReply", bno);
	}
	
	@Override
	public void writeReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace + ".writeReply", reply);
		
	}
	
	@Override
	public void updateReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(namespace + ".updateReply", reply);
		
	}
	
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete(namespace +  ".deleteReply", reply);
		
	}
	
	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".selectReply", rno);
	}

}
