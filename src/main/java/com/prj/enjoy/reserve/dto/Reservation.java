package com.prj.enjoy.reserve.dto;

public class Reservation {
	private int rtnum;
	private String rtsdate;
	private String rtedate;
	private String sbcode;
	private String cunum;
	private String cuid;
	private String rtconfirm;
	private String color= "";
	private String sbtitle;
	
	public Reservation() {
		
	}

	public Reservation(String cuid, String rtsdate, String rtedate, String rtconfirm) {	
		this.rtsdate = rtsdate;
		this.rtedate = rtedate;		
		this.cuid = cuid;
		this.rtconfirm = rtconfirm;
		if (rtconfirm.equals("true")) {
			setColor("red");
		}else if (rtconfirm.equals("false")) {
			setColor("yellow");
		}
	}
	
	@Override
	public String toString() {
		return 	"{title:'" + cuid + "', start :'" + rtsdate + "', end :'" + rtedate +  "', color :'"+ color+"', rendering: 'background'}";
	}

	public int getRtnum() {
		return rtnum;
	}

	public void setRtnum(int rtnum) {
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

	public String getRtconfirm() {
		return rtconfirm;
	}

	public void setRtconfirm(String rtconfirm) {
		this.rtconfirm = rtconfirm;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSbtitle() {
		return sbtitle;
	}

	public void setSbtitle(String sbtitle) {
		this.sbtitle = sbtitle;
	}
	
}
