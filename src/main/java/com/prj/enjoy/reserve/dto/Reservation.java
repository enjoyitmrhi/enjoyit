package com.prj.enjoy.reserve.dto;

import java.sql.Timestamp;

public class Reservation {
	private String rtnum;
	private String rtsdate;
	private String rtedate;
	private String sbcode;
	private String cunum;
	private String cuid;
	private String confirm;
	
	public Reservation(String cuid, String rtsdate, String rtedate, String confirm) {	
		this.rtsdate = rtsdate;
		this.rtedate = rtedate;		
		this.cuid = cuid;
		this.confirm = confirm;
	}
	
	@Override
	public String toString() {
		return 	"Reservation [title=" + cuid + ", start :" + rtsdate + ", end :" + rtedate +  ", confirm :" + confirm + "]";
	}
	public String getRtnum() {
		return rtnum;
	}
	public void setRtnum(String rtnum) {
		this.rtnum = rtnum;
	}
	public String getRtsdate() {
		return rtsdate;
	}
	public void setRtsdate(String rtsdate) {
		this.rtsdate = rtsdate;
	}
	public String getRtedate() {
		return rtedate;
	}
	public void setRtedate(String rtedate) {
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
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
}
