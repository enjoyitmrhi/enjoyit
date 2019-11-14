package com.prj.enjoy.reserve.dao;

import java.util.ArrayList;

import com.prj.enjoy.reserve.dto.Reservation;

public interface ReservDao {

	public ArrayList<Reservation> getSchedule(String sbcode);

	public String getTitle1(String sbcode);
	
	public String getTitle2(String buid);

	public void applySchedule(String sbcode, String cuid, String rtsdate, String rtedate);
	
	public int cntReserv(String buid);
	
	public ArrayList<Reservation> getReserv(String buid);

	public ArrayList<Reservation> getConfirm(String rtnum);

	public void apply_Confirm(String rtnum);
	
}
