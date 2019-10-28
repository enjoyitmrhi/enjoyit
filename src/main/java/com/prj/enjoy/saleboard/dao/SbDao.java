package com.prj.enjoy.saleboard.dao;

import java.util.ArrayList;

import com.prj.enjoy.saleboard.dto.SbDto;

public interface SbDao {
	ArrayList<SbDto> board_list();
	void board_write(String buid, String sbpic, String sbtitle, String sbprice, String sbloc);
	int checkBid(String id);

}
