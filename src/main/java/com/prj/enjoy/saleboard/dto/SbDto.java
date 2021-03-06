package com.prj.enjoy.saleboard.dto;

import java.sql.Timestamp;

public class SbDto {
	private int sbcode;
	private String bunum;
	private String sbpic;
	private String sbtitle;
	private String sbcontent;
	private long sbprice;
	private String sbloc;
	private Timestamp sbdate;
	private String buid;
	private String sblongitude;
	private String sblatitude;
	private String sbtype;

	public String getSbtype() {
		return sbtype;
	}

	public void setSbtype(String sbtype) {
		this.sbtype = sbtype;
	}

	public int getSbcode() {
		return sbcode;
	}

	public void setSbcode(int sbcode) {
		this.sbcode = sbcode;
	}

	public String getBunum() {
		return bunum;
	}

	public void setBunum(String bunum) {
		this.bunum = bunum;
	}

	public String getSbpic() {
		return sbpic;
	}

	public void setSbpic(String sbpic) {
		this.sbpic = sbpic;
	}

	public String getSbtitle() {
		return sbtitle;
	}

	public void setSbtitle(String sbtitle) {
		this.sbtitle = sbtitle;
	}

	public long getSbprice() {
		return sbprice;
	}

	public void setSbprice(long sbprice) {
		this.sbprice = sbprice;
	}

	public String getSbloc() {
		return sbloc;
	}

	public void setSbloc(String sbloc) {
		this.sbloc = sbloc;
	}

	public Timestamp getSbdate() {
		return sbdate;
	}

	public void setSbdate(Timestamp sbdate) {
		this.sbdate = sbdate;
	}

	public String getBuid() {
		return buid;
	}

	public void setBuid(String buid) {
		this.buid = buid;
	}

	public String getSbcontent() {
		return sbcontent;
	}

	public void setSbcontent(String sbcontent) {
		this.sbcontent = sbcontent;
	}

	public String getSblongitude() {
		return sblongitude;
	}

	public void setSblongitude(String sblongitude) {
		this.sblongitude = sblongitude;
	}

	public String getSblatitude() {
		return sblatitude;
	}

	public void setSblatitude(String sblatitude) {
		this.sblatitude = sblatitude;
	}

}
