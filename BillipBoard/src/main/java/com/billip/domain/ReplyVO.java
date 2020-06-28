package com.billip.domain;

import java.util.Date;

public class ReplyVO {
	
	private Integer bno;
	private int rno;
	private String content;
	private String writer;
	private Date regdate;
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "ReplyVO [bno=" + bno + ", rno = " + rno + ", content=" + content + ", writer=" + writer + ", regdate=" + regdate + "]";
	}
	

}
