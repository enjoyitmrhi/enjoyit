package com.prj.enjoy.reserve.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.prj.enjoy.reserve.dao.ReservDao;
import com.prj.enjoy.reserve.dto.Reservation;



@Controller
public class ReservController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/reservation.pop")
	public String reservation(HttpServletRequest request, Model model) {
		System.out.println("reserv passing");
		String sbcode =request.getParameter("sbcode");
		ReservDao dao = sqlSession.getMapper(ReservDao.class);
		ArrayList<Reservation> schedules = dao.getSchedule(sbcode);
		ArrayList<String> evt =new ArrayList<String>();
		Reservation rev;
		for (Reservation rt : schedules) {
			String cuid = rt.getCuid();
			String rtsdate = rt.getRtsdate();
			String rtedate = rt.getRtedate();
			String rtconfirm = rt.getRtconfirm();
			rev=new Reservation(cuid, rtsdate, rtedate, rtconfirm);
			evt.add(rev.toString());
		}
		System.out.println(evt);
		model.addAttribute("evt",evt);
		model.addAttribute("sbcode",sbcode);
		model.addAttribute("sbtitle",dao.getTitle1(sbcode));
		return "sale_board/reserv.pop";
	}
	
	@RequestMapping("/pop/reserv_Apply")
	public void Apply(HttpServletRequest request) {
		System.out.println("reserv passing");
		String sbcode = request.getParameter("sbcode");
		String cuid = request.getParameter("cuid");
		String rtsdate = request.getParameter("startStr");
		String rtedate = request.getParameter("endStr");
		System.out.println(sbcode  +   cuid  + rtsdate  + rtedate );
		ReservDao dao = sqlSession.getMapper(ReservDao.class);
		dao.applySchedule(sbcode,cuid,rtsdate,rtedate);
	}
	
	@RequestMapping("/onSchedule.pop")
	public String onSchedule(HttpServletRequest request, Model model) {
		String rtnum =request.getParameter("rtnum");
		String id =request.getParameter("cuid");
		ReservDao dao = sqlSession.getMapper(ReservDao.class);
		ArrayList<Reservation> schedules = dao.getConfirm(rtnum);
		ArrayList<String> evt =new ArrayList<String>();
		Reservation rev;
		for (Reservation rt : schedules) {
			String cuid = rt.getCuid();
			String rtsdate = rt.getRtsdate();
			String rtedate = rt.getRtedate();
			String rtconfirm = rt.getRtconfirm();
			rev=new Reservation(cuid, rtsdate, rtedate, rtconfirm);
			evt.add(rev.toString());
		}
		model.addAttribute("cuid", dao.getReservInfo(rtnum).getCuid());
		
		model.addAttribute("evt",evt);
		model.addAttribute("rtnum", rtnum);		
		return "reserve/onSchedule.pop";
	}
	
	@RequestMapping("/pop/reserv_Confirm")
	public void reserv_Confirm(HttpServletRequest request) {
		String rtnum = request.getParameter("rtnum");
		ReservDao dao = sqlSession.getMapper(ReservDao.class);
		dao.apply_Confirm(rtnum);
	}
	
	@RequestMapping("/cancelApply")
	public void cancelApply(HttpServletRequest requst) {
		String rtnum = requst.getParameter("num");
		ReservDao dao = sqlSession.getMapper(ReservDao.class);
		dao.reservCancel(rtnum);
		
	}
	
	@RequestMapping("/cancelMsg")
	public String sendMsg(HttpServletRequest request, Model model) {
//		String rtnum = request.getParameter("rtnum");
		String cuid= request.getParameter("cuid");
		ReservDao dao= sqlSession.getMapper(ReservDao.class);	
		model.addAttribute("cuid", cuid);
		return "reserve/cancelMsg.pop"; 
	}
	
	@RequestMapping("/send")
	public void send(HttpServletRequest request, Model model) {
		String msgtitle = request.getParameter("title");
		String msgfrom = request.getParameter("from");
		String msgto = request.getParameter("to");
		String msgcontent = request.getParameter("content");
		ReservDao dao= sqlSession.getMapper(ReservDao.class);
		dao.cancelMsg(msgtitle,msgfrom,msgto,msgcontent);
		
	}
}
