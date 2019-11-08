
package com.prj.enjoy.review.dao;

import java.util.ArrayList;

import com.prj.enjoy.review.dto.ReviewDto;

public interface ReviewDao {

	public ArrayList<ReviewDto> review_list(int rowStrat, int rowEnd, String searchKeyword, String selNum,
			String sbcode);

	public int selectBoardCount(String searchKeyword, String selNum);

	public void review_write(String rvtitle, String rvcontent, String rvpic, int rvstar, int sbcode, String cuid);

	public ReviewDto reply_view(int rvnum);

	public Object reply_write(String strId);

	public void reply(String buid, String rvtitle, String rvcontent, String rvgroup, String rvstep, String rvindent, int sbcode);

	public void replyShape(String rvgroup, String rvstep);

	public ReviewDto contentView(int rvnum);

	public void hitUp(int rvnum);

	public void modify(String rvtitle, String rvcontent, String rvpic, int rvnum, int sbcode, String cuid);

	public void delete(int rvnum);

	public String getRvpic(String rvtitle);

	int rvboardcount(String cuid);

}
