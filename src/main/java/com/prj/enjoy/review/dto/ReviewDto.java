package com.prj.enjoy.review.dto;

import java.sql.Timestamp;

public class ReviewDto {
	private String rvtitle;
	private String rvcontent;
	private Timestamp rvdate;
	private String rvpic;
	private int rvgroup;
	private int rvstep;
	private int rvindent;
	private String rvstar;
	private int sbcode;
	private int rvhit;
	private String cunum;
	private String cuid;
	private String bunum;
	private String buid;
	private int rvnum;

	public String getRvtitle() {
		return rvtitle;
	}

	public void setRvtitle(String rvtitle) {
		this.rvtitle = rvtitle;
	}

	public String getRvcontent() {
		return rvcontent;
	}

	public void setRvcontent(String rvcontent) {
		this.rvcontent = rvcontent;
	}

	public Timestamp getRvdate() {
		return rvdate;
	}

	public void setRvdate(Timestamp rvdate) {
		this.rvdate = rvdate;
	}

	public String getRvpic() {
		return rvpic;
	}

	public void setRvpic(String rvpic) {
		this.rvpic = rvpic;
	}

	public int getRvgroup() {
		return rvgroup;
	}

	public void setRvgroup(int rvgroup) {
		this.rvgroup = rvgroup;
	}

	public int getRvstep() {
		return rvstep;
	}

	public void setRvstep(int rvstep) {
		this.rvstep = rvstep;
	}

	public int getRvindent() {
		return rvindent;
	}

	public void setRvindent(int rvindent) {
		this.rvindent = rvindent;
	}

	public String getRvstar() {
		return rvstar;
	}

	public void setRvstar(String rvstar) {
		this.rvstar = rvstar;
	}

	public int getSbcode() {
		return sbcode;
	}

	public void setSbcode(int sbcode) {
		this.sbcode = sbcode;
	}

	public int getRvhit() {
		return rvhit;
	}

	public void setRvhit(int rvhit) {
		this.rvhit = rvhit;
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

	public int getRvnum() {
		return rvnum;
	}

	public void setRvnum(int rvnum) {
		this.rvnum = rvnum;
	}

}
