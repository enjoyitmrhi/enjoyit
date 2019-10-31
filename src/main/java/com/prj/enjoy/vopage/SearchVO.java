package com.prj.enjoy.vopage;

public class SearchVO extends PageVO {
	private String bgno; // 게시판 그룹
	private String searchKeyword = ""; // 검색키워드
	private String searchType = ""; // 검색필드 제목,내용
	private String[] searchTypeArr; // 검색필드 배열로 변환

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
