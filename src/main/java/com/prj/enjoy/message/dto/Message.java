package com.prj.enjoy.message.dto;

import java.sql.Timestamp;

public class Message {
	private String msgnum;
	private String msgtitle;
	private String msgfrom;
	private String msgto;
	private String msgcontent;
	private Timestamp msgdate;
	private String msgchk;
	public String getMsgnum() {
		return msgnum;
	}
	public void setMsgnum(String msgnum) {
		this.msgnum = msgnum;
	}
	public String getMsgtitle() {
		return msgtitle;
	}
	public void setMsgtitle(String msgtitle) {
		this.msgtitle = msgtitle;
	}
	public String getMsgfrom() {
		return msgfrom;
	}
	public void setMsgfrom(String msgfrom) {
		this.msgfrom = msgfrom;
	}
	public String getMsgto() {
		return msgto;
	}
	public void setMsgto(String msgto) {
		this.msgto = msgto;
	}
	public String getMsgcontent() {
		return msgcontent;
	}
	public void setMsgcontent(String msgcontent) {
		this.msgcontent = msgcontent;
	}
	public Timestamp getMsgdate() {
		return msgdate;
	}
	public void setMsgdate(Timestamp msgdate) {
		this.msgdate = msgdate;
	}
	public String getMsgchk() {
		return msgchk;
	}
	public void setMsgchk(String msgchk) {
		this.msgchk = msgchk;
	}
}
