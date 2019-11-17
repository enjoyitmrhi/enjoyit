package com.prj.enjoy.qna.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.prj.enjoy.qna.dao.QnaDao;
import com.prj.enjoy.qna.dto.QnaDto;
import com.prj.enjoy.vopage.SearchVO;

@Controller
public class QnaController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/qna_list")
	public String qnaList(HttpServletRequest request, SearchVO searchVO, Model model) {

		QnaDao dao = sqlSession.getMapper(QnaDao.class);

		String sbcode = request.getParameter("sbcode");
		String wid = request.getParameter("wid");
		String sbtype = dao.getType(sbcode);
		model.addAttribute("sbcode", sbcode);
		model.addAttribute("wid", wid);
		model.addAttribute("sbtype", sbtype);
		String qatitle = "";
		String qacontent = "";

		String[] brdtitle = request.getParameterValues("searchType");
		if (brdtitle != null) {
			for (String val : brdtitle) {
				System.out.println("value >>>>>>>>>>>>>>>>>>>>> " + val);
				if (val.equals("qatitle")) {
					model.addAttribute("qatitle", "true");
					qatitle = "qatitle";
				} else if (val.equals("qacontent")) {
					model.addAttribute("qacontent", "true");
					qacontent = "qacontent";
				}
			}
		}

		String searchKeyword = request.getParameter("sk");

		if (searchKeyword == null) {
			searchKeyword = "";
		}

		int total = 0;

		if (qatitle.equals("qatitle") && qacontent.equals("")) {
			total = dao.selectBoardCount(searchKeyword, "1",sbcode);
		} else if (qatitle.equals("") && qacontent.equals("qacontent")) {
			total = dao.selectBoardCount(searchKeyword, "2",sbcode);

		} else if (qatitle.equals("qatitle") && qacontent.equals("qacontent")) {
			total = dao.selectBoardCount(searchKeyword, "3",sbcode);

		} else if (qatitle.equals("") && qacontent.equals("")) {
			total = dao.selectBoardCount(searchKeyword, "0",sbcode);

		}

		System.out.println(total);
		String strPage = request.getParameter("page");
		model.addAttribute("searchKeyword", searchKeyword);

		if (strPage == null || strPage.equals("")) {
			strPage = "1";
		}

		int page = Integer.parseInt(strPage);

		searchVO.setPage(page);
		searchVO.pageCalculate(total);

		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();

		model.addAttribute("searchVO", searchVO);

		if (qatitle.equals("qatitle") && qacontent.equals("")) {
			model.addAttribute("qnalist", dao.qnalist(rowStart, rowEnd, searchKeyword, "1", sbcode));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "1",sbcode));

		} else if (qatitle.equals("") && qacontent.equals("qacontent")) {
			model.addAttribute("qnalist", dao.qnalist(rowStart, rowEnd, searchKeyword, "2", sbcode));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "2",sbcode));

		} else if (qatitle.equals("qatitle") && qacontent.equals("qacontent")) {
			model.addAttribute("qnalist", dao.qnalist(rowStart, rowEnd, searchKeyword, "3", sbcode));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "3",sbcode));

		} else if (qatitle.equals("") && qacontent.equals("")) {
			model.addAttribute("qnalist", dao.qnalist(rowStart, rowEnd, searchKeyword, "0", sbcode));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "0",sbcode));

		}
		return "qna/qna_list";

	}

	@RequestMapping(value = "answer_view.do", produces = "application/text; charset=utf8")
	public @ResponseBody String answer_view(@RequestParam("ID")String qanum) throws Exception {
		System.out.println("ID >>>"+qanum);
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		String data = dao.answer_view(qanum);
//		String encode= URLEncoder.encode(data , "UTF-8");
//		System.out.println(encode);
		return data;

	}

	@RequestMapping(value = "/qna_write_view")
	public String qna_write_view(HttpServletRequest request, Model model) {
		String sbcode = request.getParameter("sbcode");
		String strId = request.getParameter("id");
		String wid = request.getParameter("wid");
		
		model.addAttribute("wid", wid);
		model.addAttribute("sbcode", sbcode);
		model.addAttribute("id", strId);

		return "qna/qna_write_view";
	}

	@RequestMapping(value = "/qna_write")
	public String write(HttpServletRequest request, Model model) throws IOException {

		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		
		String sbcode = request.getParameter("sbcode");
		String strContent = request.getParameter("qcontent");
		String strTitle = request.getParameter("qtitle");
		String strId = request.getParameter("qid");
		String wid = request.getParameter("wid");

		System.out.println("strContent = " + strContent);
		System.out.println("strTitle = " + strTitle);
		System.out.println("strId = " + strId);

		dao.qnawrite(strTitle, strContent, strId,sbcode);
		model.addAttribute("id", strId);
		model.addAttribute("wid",wid);
		model.addAttribute("sbcode",sbcode);

		return "redirect:qna_list?sbcode="+sbcode;
	}

	@RequestMapping("/qnacontent_view")
	public String qnacontentview(HttpServletRequest request, Model model, HttpSession session) {
		String strNum = request.getParameter("num");
		String wid = request.getParameter("wid");
		model.addAttribute("num", strNum);
		model.addAttribute("wid", wid);
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		QnaDto dto = dao.qacontview(strNum);

		model.addAttribute("content_view", dto);

		return "/qna/qna_content_view";
		
		
	}

	@RequestMapping("/qnadelete")
	public String qnadelete(HttpServletRequest request, Model model) {
		String strNum = request.getParameter("qanum");
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		String wid = request.getParameter("wid");
		String sbcode = request.getParameter("sbcode");

		dao.qnadelete(strNum);

		return "redirect:qna_list?wid="+wid+"&sbcode="+sbcode;
	}

	@RequestMapping("/qnamodify")
	public String qnamodify(HttpServletRequest request, Model model) {
		String strNum = request.getParameter("qanum");
		String content = request.getParameter("content");
		String wid = request.getParameter("wid");
		String sbcode = request.getParameter("sbcode");

		QnaDao dao = sqlSession.getMapper(QnaDao.class);

		dao.qnamodify(strNum, content);

		return "redirect:qna_list?wid="+wid+"&sbcode="+sbcode;
	}

	@RequestMapping("/qnaanswerview")
	public String qnaAnswer(HttpServletRequest request, Model model) {
		String qanum = request.getParameter("qanum");
		String wid = request.getParameter("wid");
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		QnaDto dto = dao.qnaanswer(qanum);

		model.addAttribute("answerview", dto);
		model.addAttribute("wid",wid);

		return "qna/qnaans_view";
	}

	@RequestMapping("/qnaanswer_write")
	public String qnaanswer_write(HttpServletRequest request, Model model) {
		QnaDao dao = sqlSession.getMapper(QnaDao.class);

		String sbcode = request.getParameter("sbcode");
		String id = request.getParameter("id");
		String num = request.getParameter("num");
		int group = Integer.parseInt(request.getParameter("group"));
		int step = Integer.parseInt(request.getParameter("step"));
		int indent = Integer.parseInt(request.getParameter("indent"));
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String buid = request.getParameter("id");

		replyShape(group, step);

		

		dao.qnaAnswerWrite(buid, group, step, indent, content, title,sbcode);

		return "redirect:qna_list?wid="+id+"&sbcode="+sbcode;
	}

	private void replyShape(int group, int step) {
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		dao.replyShape(group, step);
	}
	
	@RequestMapping("/qna_edit")
	public String qna_edit(HttpServletRequest request, Model model) {
		String qanum = request.getParameter("num");
		QnaDao dao =sqlSession.getMapper(QnaDao.class);
		dao.qacontview(qanum);
		model.addAttribute("qa",dao.qacontview(qanum));
		
		return "/login/qna_edit";
	}
	
}