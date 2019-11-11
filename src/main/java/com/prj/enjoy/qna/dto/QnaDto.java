package com.prj.enjoy.qna.dto;

import java.sql.Timestamp;

public class QnaDto {
	private int qanum;
	private String qatitle;
	private int qagroup;
	private int qastep;
	private int qaindent;
	private Timestamp qadate;
	private String qacontent;
	private int sbcode;
	private String bunum;
	private String buid;
	private String cunum;
	private String cuid;
	private String sbproduct;
	private String sbname;

	public int getQanum() {
		return qanum;
	}

	public void setQanum(int qanum) {
		this.qanum = qanum;
	}

	public String getQatitle() {
		return qatitle;
	}

	public void setQatitle(String qatitle) {
		this.qatitle = qatitle;
	}

	public int getQagroup() {
		return qagroup;
	}

	public void setQagroup(int qagroup) {
		this.qagroup = qagroup;
	}

	public int getQastep() {
		return qastep;
	}

	public void setQastep(int qastep) {
		this.qastep = qastep;
	}

	public int getQaindent() {
		return qaindent;
	}

	public void setQaindent(int qaindent) {
		this.qaindent = qaindent;
	}

	public Timestamp getQadate() {
		return qadate;
	}

	public void setQadate(Timestamp qadate) {
		this.qadate = qadate;
	}

	public String getQacontent() {
		return qacontent;
	}

	public void setQacontent(String qacontent) {
		this.qacontent = qacontent;
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

	public String getBuid() {
		return buid;
	}

	public void setBuid(String buid) {
		this.buid = buid;
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

	public String getSbproduct() {
		return sbproduct;
	}

	public void setSbproduct(String sbproduct) {
		this.sbproduct = sbproduct;
	}

	public String getSbname() {
		return sbname;
	}

	public void setSbname(String sbname) {
		this.sbname = sbname;
	}

}
