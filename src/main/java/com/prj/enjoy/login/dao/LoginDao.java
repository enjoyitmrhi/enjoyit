package com.prj.enjoy.login.dao;

import java.util.ArrayList;

import com.prj.enjoy.login.dto.Business;
import com.prj.enjoy.login.dto.Customer;

public interface LoginDao {
	public Customer getCustomer(String cuid);

	public Business getBusiness(String buid);

	public void createCustomer(String cuid, String cupw, String cuname, String cuaddr,String culongY, String culatY ,String cuemail, String cugender,
			String cubirth, String cutel);

	public String chkId(String chkid);

	public void createBusiness(String buid, String bupw, String buname, String buemail, String burenum, String butel,
			String buaddr, String bulongY, String bulatX);

	
	public ArrayList<String> popupfindCuid(String cuname, String cutel, String cubirth);
	
	public ArrayList<String> popupfindBuid(String Buname, String Butel, String burenum);

	public int popupfindCupw(String cuname, String cutel, String cubirth, String cuid);

	public int popupfindBupw(String buname, String butel, String burenum, String buid);

	public void chgcpw(String cuid, String chpw);
	
	public void chgbpw(String buid, String chpw);
}
