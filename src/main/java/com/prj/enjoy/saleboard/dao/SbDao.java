package com.prj.enjoy.saleboard.dao;

import java.util.ArrayList;

import com.prj.enjoy.saleboard.dto.SbDto;
import com.prj.enjoy.review.dto.ReviewDto;

@SuppressWarnings("unused")
public interface SbDao {
	ArrayList<SbDto> board_list();

	void board_write(String buid, String sbpic, String sbtitle, String sbprice, String sbloc);

	SbDto sb_content(String sbcode);

	void delete(String sbcode);

	void sbmodify(String sbcode, String sbprice, String sbtitle, String sbcontent, String sbpic);

	String avgstar(String sbcode);
	
	ArrayList<SbDto> add_list(int sNum, int eNum);
	
	String getSbPic(String sbcode);

}
