package com.prj.enjoy.login.dao;


public class SearchVO extends PageVO{
	private String bgno;			//寃뚯떆�뙋洹몃９
	private String searchKeyword ="";	//寃��깋�궎�썙�뱶
	private String searchType = "";		//寃��깋�븘�뱶 �젣紐�, �궡�슜
	private String[] searchTypeArr;	//寃��깋�븘�뱶 諛곗뿴濡� �쟾�솚
	
	public String getBgno() {
		return bgno;
	}
	public void setBgno(String bgno) {
		this.bgno = bgno;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String[] getSearchTypeArr() {
		
		return searchType.split(",");
	}
	
	
}
