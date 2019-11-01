package com.prj.enjoy.qna.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		model.addAttribute("sbcode", sbcode);
		model.addAttribute("wid", wid);

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
			total = dao.selectBoardCount(searchKeyword, "1");
		} else if (qatitle.equals("") && qacontent.equals("qacontent")) {
			total = dao.selectBoardCount(searchKeyword, "2");

		} else if (qatitle.equals("qatitle") && qacontent.equals("qacontent")) {
			total = dao.selectBoardCount(searchKeyword, "3");

		} else if (qatitle.equals("") && qacontent.equals("")) {
			total = dao.selectBoardCount(searchKeyword, "0");

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
			model.addAttribute("qnalist", dao.qnalist(rowStart, rowEnd, searchKeyword, "1"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "1"));

		} else if (qatitle.equals("") && qacontent.equals("qacontent")) {
			model.addAttribute("qnalist", dao.qnalist(rowStart, rowEnd, searchKeyword, "2"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "2"));

		} else if (qatitle.equals("qatitle") && qacontent.equals("qacontent")) {
			model.addAttribute("qnalist", dao.qnalist(rowStart, rowEnd, searchKeyword, "3"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "3"));

		} else if (qatitle.equals("") && qacontent.equals("")) {
			model.addAttribute("qnalist", dao.qnalist(rowStart, rowEnd, searchKeyword, "0"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "0"));

		}
		return "qna/qna_list";

	}
	
	@RequestMapping(value = "answer_view.do")
	public @ResponseBody ModelAndView answer_view(@RequestParam("qnum") String qanum) {
		System.out.println(qanum);
		QnaDao dao=sqlSession.getMapper(QnaDao.class);
		ModelAndView mav= new ModelAndView();
		System.out.println("뭔내용인교>>>"+ dao.answer_view(qanum));
		mav.addObject("content", dao.answer_view(qanum));
		return mav;
	}
	

	@RequestMapping(value = "/qna_write_view")
	public String qna_write_view(HttpServletRequest request, Model model) {

		String strId = request.getParameter("id");
		model.addAttribute("id", strId);

		return "qna/qna_write_view";
	}

	@RequestMapping(value = "/qna_write")
	public String write(HttpServletRequest request, Model model) throws IOException {
		/*String attachPath = "resources\\upload\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String path = uploadPath + attachPath;
		System.out.println("path >>> " + path);

		MultipartRequest req = new MultipartRequest(request, path, 2044 * 1024 * 10, "UTF-8",
				new DefaultFileRenamePolicy());
*/
		QnaDao dao = sqlSession.getMapper(QnaDao.class);

		String strContent = request.getParameter("qcontent");
		String strTitle = request.getParameter("qtitle");
		String strId = request.getParameter("qid");
		

		System.out.println("strContent = " + strContent);
		System.out.println("strTitle = " + strTitle);
		System.out.println("strId = " + strId);

		dao.qnawrite(strTitle, strContent, strId);
		model.addAttribute("id", strId);

		return "redirect:qna_list";
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
		String strNum = request.getParameter("num");
		QnaDao dao = sqlSession.getMapper(QnaDao.class);

		dao.qnadelete(strNum);

		return "redirect:qna_list";
	}

	@RequestMapping("/qnamodify")
	public String qnamodify(HttpServletRequest request, Model model) {
		String strNum = request.getParameter("num");
		String content = request.getParameter("content");

		QnaDao dao = sqlSession.getMapper(QnaDao.class);

		dao.qnamodify(strNum, content);

		return "redirect:qna_list";
	}

	@RequestMapping("/qnaanswerview")
	public String qnaAnswer(HttpServletRequest request, Model model) {
		String number = request.getParameter("num");
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		QnaDto dto = dao.qnaanswer(number);

		model.addAttribute("answerview", dto);

		return "qna/qnaans_view";
	}

	@RequestMapping("/qnaanswer_write")
	public String qnaanswer_write(HttpServletRequest request, Model model) {
		QnaDao dao = sqlSession.getMapper(QnaDao.class);

		String num = request.getParameter("num");
		int group = Integer.parseInt(request.getParameter("group"));
		int step = Integer.parseInt(request.getParameter("step"));
		int indent = Integer.parseInt(request.getParameter("indent"));
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String buid = request.getParameter("id");

		replyShape(group, step);

		System.out.println(group + " " + step + " " + indent);

		dao.qnaAnswerWrite(buid, group, step, indent, content, title);

		return "redirect:qna_list";
	}

	private void replyShape(int group, int step) {
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		dao.replyShape(group, step);
	}
}