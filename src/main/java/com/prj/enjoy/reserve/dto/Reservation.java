package com.prj.enjoy.reserve.dto;

import java.sql.Timestamp;

public class Reservation {
	private String rtnum;
	private Timestamp rtsdate;
	private Timestamp rtedate;
	private String sbcode;
	private String cunum;
	private String cuid;
	
	public String getRtnum() {
		return rtnum;
	}
	public void setRtnum(String rtnum) {
		this.rtnum = rtnum;
	}
	public Timestamp getRtsdate() {
		return rtsdate;
	}
	public void setRtsdate(Timestamp rtsdate) {
		this.rtsdate = rtsdate;
	}
	public Timestamp getRtedate() {
		return rtedate;
	}
	public void setRtedate(Timestamp rtedate) {
		this.rtedate = rtedate;
	}
	public String getSbcode() {
		return sbcode;
	}
	public void setSbcode(String sbcode) {
		this.sbcode = sbcode;
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
}
