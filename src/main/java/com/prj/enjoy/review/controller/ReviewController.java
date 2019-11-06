package com.prj.enjoy.review.controller;

import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.prj.enjoy.review.dao.ReviewDao;
import com.prj.enjoy.vopage.SearchVO;

@Controller
public class ReviewController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/review_list")
	public String review_list(HttpServletRequest request, SearchVO searchVO, Model model) {
		String rvtitle = "";
		String rvcontent = "";
		String[] brdtitle = request.getParameterValues("searchType");
		if (brdtitle != null) {
			for (String val : brdtitle) {
				if (val.equals("rvtitle")) {
					model.addAttribute("rvtitle", "true");
					rvtitle = "rvtitle";
				} else if (val.equals("rvcontent")) {
					model.addAttribute("rvcontent", "true");
					rvcontent = "rvcontent";
				}
			}
		}
		String searchKeyword = request.getParameter("sk");
		if (searchKeyword == null) {
			searchKeyword = "";
		}

		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);

		int total = 0;
		if (rvtitle.equals("rvtitle") && rvcontent.equals("")) {
			total = dao.selectBoardCount(searchKeyword, "1");
		} else if (rvtitle.equals("") && rvcontent.equals("rvcontent")) {
			total = dao.selectBoardCount(searchKeyword, "2");
		} else if (rvtitle.equals("rvtitle") && rvcontent.equals("rvcontent")) {
			total = dao.selectBoardCount(searchKeyword, "3");
		} else if (rvtitle.equals("") && rvcontent.equals("")) {
			total = dao.selectBoardCount(searchKeyword, "0");
		}

		String strPage = request.getParameter("page");

		model.addAttribute("searchKeyword", searchKeyword);

		if (strPage == null || strPage.equals("")) {
			strPage = "1";
		}
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);
		searchVO.pageCalculate(total);

		int rowStrat = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();

		if (rvtitle.equals("rvtitle") && rvcontent.equals("")) {
			model.addAttribute("review_list", dao.review_list(rowStrat, rowEnd, searchKeyword, "1"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "1"));
		} else if (rvtitle.equals("") && rvcontent.equals("rvcontent")) {
			model.addAttribute("review_list", dao.review_list(rowStrat, rowEnd, searchKeyword, "2"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "2"));
		} else if (rvtitle.equals("rvtitle") && rvcontent.equals("rvcontent")) {
			model.addAttribute("review_list", dao.review_list(rowStrat, rowEnd, searchKeyword, "3"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "3"));
		} else if (rvtitle.equals("") && rvcontent.equals("")) {
			model.addAttribute("review_list", dao.review_list(rowStrat, rowEnd, searchKeyword, "0"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "0"));
		}
		model.addAttribute("searchVO", searchVO);

		// model.addAttribute("review_list", dao.review_list());

		return "review/review_list";
	}

	@RequestMapping(value = "/review_write_view")
	public String write_view() {

		return "review/review_write_view";

	}

	@RequestMapping("/review_write")
	public String write(HttpServletRequest request, Model model) throws Exception {
		String attachPath = "resources\\upload\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String path = uploadPath + attachPath;

		MultipartRequest req = new MultipartRequest(request, path, 2044 * 1024 * 10, "UTF-8",
				new DefaultFileRenamePolicy());

		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);

		String rvtitle = req.getParameter("rvtitle");
		String rvcontent = req.getParameter("rvcontent");
		String rvstar = req.getParameter("rvstar");

		String rvpic = req.getFilesystemName("rvpic");

		if (rvpic == null) {
			rvpic = "등록된 사진 없음";
		}

		dao.review_write(rvtitle, rvcontent, rvpic, rvstar);


		return "redirect:review_list";
	}

	@RequestMapping("/review_content_view")
	public String content_view(HttpServletRequest request, Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		String strnum = request.getParameter("rvnum");
		int rvnum = Integer.parseInt(strnum);
		hitUp(rvnum);
		model.addAttribute("content_view", dao.contentView(rvnum));
		return "review/review_content_view";
	}

	public void hitUp(int rvnum) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.hitUp(rvnum);
	}

	@RequestMapping("/review_download")
	public String download(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		String path = request.getParameter("p");
		String fname = request.getParameter("f");
		String sbcode = request.getParameter("sbcode");

		response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fname, "UTF-8"));

		String attachPath = "resources\\upload\\";
		String realPath = request.getSession().getServletContext().getRealPath(attachPath) + "\\" + fname;
		FileInputStream fin = new FileInputStream(realPath);
		ServletOutputStream sout = response.getOutputStream();

		byte[] buf = new byte[1024];
		int size = 0;
		while ((size = fin.read(buf, 0, 1024)) != -1) {
			sout.write(buf, 0, size);
		}
		fin.close();
		sout.close();

		return "review_content_view?sbcode=" + sbcode;
	}

	@RequestMapping("/review_modify")
	public String modify(HttpServletRequest request, Model model) throws Exception {
		String attachPath = "resources\\upload\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String path = uploadPath + attachPath;

		MultipartRequest req = new MultipartRequest(request, path, 2044 * 1024 * 10, "UTF-8",
				new DefaultFileRenamePolicy());

		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		String rvtitle = req.getParameter("rvtitle");
		String rvcontent = req.getParameter("rvcontent");
		String strnum = req.getParameter("rvnum");
		int rvnum = Integer.parseInt(strnum);

		String rvpic = dao.getRvpic(rvtitle);

		if (rvpic == null) {
			rvpic = "";
		}
		dao.modify(rvtitle, rvcontent, rvpic, rvnum);
		return "redirect:review_list";
	}

	@RequestMapping("/review_delete")
	public String delete(HttpServletRequest request, Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		// String rvgroup = request.getParameter("rvgroup");
		// String rvstep = request.getParameter("rvstep");
		// String rvindent = request.getParameter("rvindent");
		String strnum = request.getParameter("rvnum");
		int rvnum = Integer.parseInt(strnum);
		dao.delete(rvnum);
		return "redirect:review_list";
	}

	@RequestMapping(value = "/review_reply_view")
	public String reply_view(HttpServletRequest request, Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		String strId = request.getParameter("rvnum");
		if(strId ==null || strId.equals("")) {
			strId = "0";
		}
		int rvnum = Integer.parseInt(strId);
		model.addAttribute("reply_view", dao.reply_view(rvnum));
		return "review/review_reply_view";
	
	

	}

	@RequestMapping("/review_reply_write")
	public String reply_write(HttpServletRequest request, Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		String strId = request.getParameter("bunum");

		model.addAttribute("reply_write", dao.reply_write(strId));

		return "review/review_reply_write";
	}

	@RequestMapping("/review_reply")
	public String reply(HttpServletRequest request, Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		String buid = request.getParameter("buid");
		String rvcontent = request.getParameter("rvcontent");
		String rvgroup = request.getParameter("rvgroup");
		String rvstep = request.getParameter("rvstep");
		String rvindent = request.getParameter("rvindent");

		replyShape(rvgroup, rvstep);

		dao.reply(buid, rvcontent, rvgroup, rvstep, rvindent);

		return "redirect:review_list";
	}

	private void replyShape(String rvgroup, String rvstep) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.replyShape(rvgroup, rvstep);
	}
}
