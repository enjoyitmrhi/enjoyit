package com.prj.enjoy.login.dao;


import com.prj.enjoy.login.dto.Business;
import com.prj.enjoy.login.dto.Customer;

public interface LoginDao {
	public Customer getCustomer(String cuid); 
	public Business getBusiness(String buid);
	public int createCustomer (String cuid, String cupw, String cuname,String cuaddr, String cuemail, String cugender, String cubirth,  String cutel);
	public int chkCid(String cuid);
	public void createBusiness(String buid, String bupw, String buname, String buemail, String burenum, String butel,String buaddr);
	public int chkBid(String buid);
	
	
}
