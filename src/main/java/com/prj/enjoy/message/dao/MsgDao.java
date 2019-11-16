package com.prj.enjoy.message.dao;

import java.util.ArrayList;

import com.prj.enjoy.message.dto.Message;

public interface MsgDao {

	int chkMsg(String cuid, int i);
	
	ArrayList<Message> msgList(String cuid);

	Message msgContent(String msgnum);

	void checking(String msgnum);

	String getPrev(String msgnum, String msgto);

	String getNext(String msgnum, String msgto);

	void msgDel(String msgnum);

	String id_chk(String id);
	
	void send(String msgtitle, String msgfrom, String msgto, String msgcontent);
}
