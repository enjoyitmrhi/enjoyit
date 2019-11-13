package com.prj.enjoy.reserve.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.prj.enjoy.reserve.dto.Reservation;



@Controller
public class ReservController {
	@RequestMapping("/reservation.pop")
	public String reservation(HttpServletRequest request) {
		System.out.println(request.getParameter("sbcode"));
		Map<String, Reservation> javaMap = new HashMap<String, Reservation>();
//		Reservation rev = new Reservation(cuid, rtsdate, rtedate, confirm);
//		rev.toString();
		
		
		return "sale_board/reserv_pop";
	}
	
	@RequestMapping("/reserv_Apply")
	public void Apply() {
		//신청할꼬야
	}
}
