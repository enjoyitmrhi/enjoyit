package com.prj.enjoy.login.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.prj.enjoy.login.dto.Administrator;
import com.prj.enjoy.login.dto.Business;
import com.prj.enjoy.login.dto.Customer;

public interface AdminDao {
	public Administrator getAdmin(String adid);

	public ArrayList<Customer> getCustomer(@Param("cusort") String cusort, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);

	public ArrayList<Business> getBusiness(@Param("busort") String busort, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);

//	public ArrayList<Customer> getCustomer();
//
//	public ArrayList<Business> getBusiness();

	public Customer getCuInfo(String cunum);

	public Business getBuInfo(String bunum);

	public void del_cu(String cuid);

	public void del_reserv(String cuid);

	public void del_cReview(String cuid);
	
	public void del_cQna(String cuid);
	
	public void del_bu(String buid);
	
	public void del_sb(String buid);

	public void del_bReview(String buid);
	
	public void del_bQna(String bsuid);

	public int editProc_cu(String cuid, String cuname, String cuaddr, String cuemail, String cubirth, String cugender,
			String cutel, String cunum);

	public int editProc_bu(String buid, String buname, String buaddr, String buemail, String burenum, String butel,
			String bunum);

	public int selectCuCount();
	public int selectBuCount();
}
