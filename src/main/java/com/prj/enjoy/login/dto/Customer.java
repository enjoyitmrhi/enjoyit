package com.prj.enjoy.login.dto;

import java.util.Date;

public class Customer {
	private String cunum;
	private String cuid;
	private String cupw;
	private String cuname;
	private String cuaddr;
	private String cuemail;
	private String cugender;
	private String cubirth;
	private String cutel;
	private Date cudate;
	private String culongitude;
	private String culatitude;
	
	public String toString(String cuid, String culongitude, String culatitude) {
		return "{content:'<div>"+cuid+"</div>',latlng: new kakao.maps.LatLng("+culongitude+","+culatitude+")}";
	}
	
	public String getCunum() {
		return cunum;
	}

	public void setCunum(String cunum) {
		this.cunum = cunum;
	}

	public String getCuid() {
		return cuid;
	}

	public void setCuid(String cuid) {
		this.cuid = cuid;
	}

	public String getCupw() {
		return cupw;
	}

	public void setCupw(String cupw) {
		this.cupw = cupw;
	}

	public String getCuname() {
		return cuname;
	}

	public void setCuname(String cuname) {
		this.cuname = cuname;
	}

	public String getCuaddr() {
		return cuaddr;
	}

	public void setCuaddr(String cuaddr) {
		this.cuaddr = cuaddr;
	}

	public String getCuemail() {
		return cuemail;
	}

	public void setCuemail(String cuemail) {
		this.cuemail = cuemail;
	}

	public String getCugender() {
		return cugender;
	}

	public void setCugender(String cugender) {
		this.cugender = cugender;
	}

	public String getCubirth() {
		return cubirth;
	}

	public void setCubirth(String cubirth) {
		this.cubirth = cubirth;
	}

	public String getCutel() {
		return cutel;
	}

	public void setCutel(String cutel) {
		this.cutel = cutel;
	}

	public Date getCudate() {
		return cudate;
	}

	public void setCudate(Date cudate) {
		this.cudate = cudate;
	}

	public String getCulongitude() {
		return culongitude;
	}

	public void setCulongitude(String culongitude) {
		this.culongitude = culongitude;
	}

	public String getCulatitude() {
		return culatitude;
	}

	public void setCulatitude(String culatitude) {
		this.culatitude = culatitude;
	}

}
