package com.prj.enjoy.saleboard.dao;

import java.util.ArrayList;

import com.prj.enjoy.saleboard.dto.SbDto;
import com.prj.enjoy.review.dto.ReviewDto;

@SuppressWarnings("unused")
public interface SbDao {
	ArrayList<SbDto> board_list_seminar();

	ArrayList<SbDto> board_list_practice();
	void board_write(String buid, String sbpic, String sbtitle, String sbprice, String sbloc, String sblongitude, String sblatitude, String sbcontent);

	ArrayList<SbDto> board_list_party();

	void board_write(String buid, String sbpic, String sbtitle, String sbprice, String sbloc, String sblongitude, String sblatitude, String sbtype,String sbcontent);

	SbDto sb_content(String sbcode);

	void delete(String sbcode);
	
	void del_reserv(String sbcode);

	void sbmodify(String sbcode, String sbprice, String sbtitle, String sbcontent, String sbpic, String sbloc, String sblongitude, String sblatitude);

	String avgstar(String sbcode);
	
	ArrayList<SbDto> add_list1(int sNum, int eNum);

	ArrayList<SbDto> add_list2(int sNum, int eNum);

	ArrayList<SbDto> add_list3(int sNum, int eNum);

	String getSbPic(String sbcode);
	

	String getSbloc(String sbcode);

	String getSbLongitude(String sbcode);

	String getSbLatitude(String sbcode);

	String getType(String sbcode);

	void del_Qna(String sbcode);

	void del_Review(String sbcode);
}
