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
	private String cunum;
	private String cuid;
	private String bunum;
	private String buid;

	public final String getRvstar() {
		return rvstar;
	}

	public final void setRvstar(String rvstar) {
		this.rvstar = rvstar;
	}

	public final String getRvtitle() {
		return rvtitle;
	}

	public final void setRvtitle(String rvtitle) {
		this.rvtitle = rvtitle;
	}

	public final String getRvcontent() {
		return rvcontent;
	}

	public final void setRvcontent(String rvcontent) {
		this.rvcontent = rvcontent;
	}

	public final Timestamp getRvdate() {
		return rvdate;
	}

	public final void setRvdate(Timestamp rvdate) {
		this.rvdate = rvdate;
	}

	public final String getRvpic() {
		return rvpic;
	}

	public final void setRvpic(String rvpic) {
		this.rvpic = rvpic;
	}

	public final int getRvgroup() {
		return rvgroup;
	}

	public final void setRvgroup(int rvgroup) {
		this.rvgroup = rvgroup;
	}

	public final int getRvstep() {
		return rvstep;
	}

	public final void setRvstep(int rvstep) {
		this.rvstep = rvstep;
	}

	public final int getRvindent() {
		return rvindent;
	}

	public final void setRvindent(int rvindent) {
		this.rvindent = rvindent;
	}

	public final int getSbcode() {
		return sbcode;
	}

	public final void setSbcode(int sbcode) {
		this.sbcode = sbcode;
	}

	public final String getCunum() {
		return cunum;
	}

	public final void setCunum(String cunum) {
		this.cunum = cunum;
	}

	public final String getCuid() {
		return cuid;
	}

	public final void setCuid(String cuid) {
		this.cuid = cuid;
	}

	public final String getBunum() {
		return bunum;
	}

	public final void setBunum(String bunum) {
		this.bunum = bunum;
	}

	public final String getBuid() {
		return buid;
	}

	public final void setBuid(String buid) {
		this.buid = buid;
	}

	public ReviewDto(String rvtitle, String rvcontent, Timestamp rvdate, String rvpic, int rvgroup, int rvstep,
			int rvindent, int sbcode, String cunum, String cuid, String bunum, String buid) {
		super();
		this.rvtitle = rvtitle;
		this.rvcontent = rvcontent;
		this.rvdate = rvdate;
		this.rvpic = rvpic;
		this.rvgroup = rvgroup;
		this.rvstep = rvstep;
		this.rvindent = rvindent;
		this.sbcode = sbcode;
		this.cunum = cunum;
		this.cuid = cuid;
		this.bunum = bunum;
		this.buid = buid;
	}

	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}

}
