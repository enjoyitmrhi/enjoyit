package com.prj.enjoy.saleboard.dto;

import java.sql.Timestamp;

public class SbDto {
	private int sbcode;
	private String bunum;
	private String sbpic;
	private String sbtitle;
	private String sbcontent;
	private int sbprice;
	private String sbloc;
	private Timestamp sbdate;
	private String buid;

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

	public int getSbprice() {
		return sbprice;
	}

	public void setSbprice(int sbprice) {
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

}
