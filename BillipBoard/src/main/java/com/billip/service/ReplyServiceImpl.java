package com.billip.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.billip.domain.ReplyVO;
import com.billip.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO manager;
	
	
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		// TODO Auto-generated method stub
		return manager.readReply(bno);
	}
	
	@Override
	public void writeReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		manager.writeReply(reply);
	}
	
	@Override
	public void updateReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		manager.updateReply(reply);
		
	}
	
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		manager.deleteReply(reply);
		
	}
	
	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return manager.selectReply(rno);
	}

}
