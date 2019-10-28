package com.prj.enjoy.qna.dao;

import java.util.ArrayList;

import com.prj.enjoy.qna.dto.QnaDto;

public interface QnaDao {

	ArrayList<QnaDto> qnalist(int rowStart, int rowEnd, String searchKeyword, String selNum);

	void qnawrite(String strTitle, String strContent, String strId);

	QnaDto qacontview(String strNum);

	void qnadelete(String strNum);

	void qnamodify(String strNum, String content);

	QnaDto qnaanswer(String number);

	void qnaAnswerWrite(String cuid, int group, int step, int indent, String content, String title);

	void replyShape(int group, int step);

	int selectBoardCount(String searchKeyword, String selNum);
}
