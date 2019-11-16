package com.prj.enjoy.message.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.prj.enjoy.message.dao.MsgDao;
import com.prj.enjoy.reserve.dao.ReservDao;

@Controller
public class MsgController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/message.pop")
	public String message(HttpSession session, Model model) {
		System.out.println("passing msgBox");
		String cuid = (String) session.getAttribute("session_cid");
		MsgDao dao = sqlSession.getMapper(MsgDao.class);
		model.addAttribute("msg_list", dao.msgList(cuid));
		
		return "message/msg_list.pop";
	}
	
	@RequestMapping("/sendMsg.pop")
	public String sendMsg() {
		System.out.println("passing sendMsg");
		
		return "message/sendMsg.pop";
	}
	
	@RequestMapping("/msg_content.pop")
	public String msg_content(HttpServletRequest request, HttpSession session, Model model) {
		String msgnum = request.getParameter("num");
		String msgto =(String) session.getAttribute("session_cid");
		MsgDao dao = sqlSession.getMapper(MsgDao.class);
		System.out.println(msgnum);
		dao.checking(msgnum);
		model.addAttribute("content", dao.msgContent(msgnum));
		model.addAttribute("prev",dao.getPrev(msgnum,msgto));
		model.addAttribute("next",dao.getNext(msgnum,msgto));
		return "message/msg_content.pop";
	}
	
	@RequestMapping("/msg_del")
	public String msg_del(HttpServletRequest request) {
		String msgnum = request.getParameter("num");
		MsgDao dao = sqlSession.getMapper(MsgDao.class);
		dao.msgDel(msgnum);
		
		return "redirect:message.pop";
	}
	
	@RequestMapping("/id_check.do")
	@ResponseBody
	public String id_chk(@RequestParam("userid")String id ) {
		System.out.println(id);
		MsgDao dao = sqlSession.getMapper(MsgDao.class);
		String result =dao.id_chk(id);
		System.out.println(result);
		
		return result;
	}
	
	@RequestMapping("/sendMsg")
	public void send(HttpServletRequest request) {
		String msgtitle=request.getParameter("title");
		String msgfrom=request.getParameter("from");
		String msgto=request.getParameter("to");
		String msgcontent=request.getParameter("content");
		MsgDao dao = sqlSession.getMapper(MsgDao.class);
		dao.send(msgtitle,msgfrom,msgto,msgcontent);
	}
}
