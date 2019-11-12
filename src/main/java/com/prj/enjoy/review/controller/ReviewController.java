package com.prj.enjoy.review.controller;

import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String sbcode= request.getParameter("sbcode");
		String wid= request.getParameter("wid");
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
			total = dao.selectBoardCount(searchKeyword, "1",sbcode);
		} else if (rvtitle.equals("") && rvcontent.equals("rvcontent")) {
			total = dao.selectBoardCount(searchKeyword, "2",sbcode);
		} else if (rvtitle.equals("rvtitle") && rvcontent.equals("rvcontent")) {
			total = dao.selectBoardCount(searchKeyword, "3",sbcode);
		} else if (rvtitle.equals("") && rvcontent.equals("")) {
			total = dao.selectBoardCount(searchKeyword, "0",sbcode);
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
			model.addAttribute("review_list", dao.review_list(rowStrat, rowEnd, searchKeyword, "1", sbcode));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "1",sbcode));
		} else if (rvtitle.equals("") && rvcontent.equals("rvcontent")) {
			model.addAttribute("review_list", dao.review_list(rowStrat, rowEnd, searchKeyword, "2", sbcode));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "2",sbcode));
		} else if (rvtitle.equals("rvtitle") && rvcontent.equals("rvcontent")) {
			model.addAttribute("review_list", dao.review_list(rowStrat, rowEnd, searchKeyword, "3", sbcode));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "3",sbcode));
		} else if (rvtitle.equals("") && rvcontent.equals("")) {
			model.addAttribute("review_list", dao.review_list(rowStrat, rowEnd, searchKeyword, "0", sbcode));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "0",sbcode));
		}
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("sbcode",sbcode);
		model.addAttribute("wid", wid);

		// model.addAttribute("review_list", dao.review_list());

		return "review/review_list";
	}

	@RequestMapping(value = "/review_write_view")
	public String write_view(HttpServletRequest request,Model model) {
		String sbcode= request.getParameter("sbcode");
		String wid= request.getParameter("wid");
		model.addAttribute("sbcode",sbcode);
		model.addAttribute("wid", wid);

		
		

		return "review/review_write_view";

	}

	@RequestMapping("/review_write")
	public String write(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		
		String cuid=(String) session.getAttribute("session_cid");
		String attachPath = "resources\\upload\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String path = uploadPath + attachPath;

		MultipartRequest req = new MultipartRequest(request, path, 2044 * 1024 * 10, "UTF-8",
				new DefaultFileRenamePolicy());
		String sbcode= req.getParameter("sbcode");
		String wid= req.getParameter("wid");
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		System.out.println("sbcode >>>>>>>"+sbcode);
		String rvtitle = req.getParameter("rvtitle");
		String rvcontent = req.getParameter("rvcontent");
		String strstar = req.getParameter("rvstar");
		if (strstar == null || strstar.equals("")) {
			strstar ="0";
		}
		int rvstar = Integer.parseInt(strstar);
		String rvpic = req.getFilesystemName("rvpic");

		if (rvpic == null) {
			rvpic = "no pic";
		}

		dao.review_write(rvtitle, rvcontent, rvpic, rvstar, sbcode, cuid);
		
		model.addAttribute("sbcode",sbcode);
		model.addAttribute("wid", wid);

		return "redirect:review_list";
	}

	@RequestMapping("/review_content_view")
	public String content_view(HttpServletRequest request, Model model) {

		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);

		String strnum = request.getParameter("rvnum");
		String sbcode= request.getParameter("sbcode");
		String wid= request.getParameter("wid");
		int rvnum = Integer.parseInt(strnum);
		


		hitUp(rvnum);

		model.addAttribute("content_view", dao.contentView(rvnum));
		model.addAttribute("sbcode",sbcode);
		model.addAttribute("wid", wid);
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
		String sbcode= request.getParameter("sbcode");
		String wid= request.getParameter("wid");
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


		
		

		model.addAttribute("sbcode",sbcode);
		model.addAttribute("wid", wid);
		return "redirect:review_list";
	}

	@RequestMapping("/review_delete")
	public String delete(HttpServletRequest request, Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		// String rvgroup = request.getParameter("rvgroup");
		// String rvstep = request.getParameter("rvstep");
		// String rvindent = request.getParameter("rvindent");
		String wid= request.getParameter("wid");
		String sbcode= request.getParameter("sbcode");
		String strnum = request.getParameter("rvnum");
		int rvnum = Integer.parseInt(strnum);
		
		dao.delete(rvnum);
		model.addAttribute("sbcode",sbcode);
		model.addAttribute("wid", wid);
		return "redirect:review_list";
	}

	@RequestMapping(value = "/review_reply_view")
	public String reply_view(HttpServletRequest request, Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		String strId = request.getParameter("rvnum");
		String sbcode= request.getParameter("sbcode");
		String wid= request.getParameter("wid");
		if(strId ==null || strId.equals("")) {
			strId = "0";
		}
		int rvnum = Integer.parseInt(strId);
		

		model.addAttribute("reply_view", dao.reply_view(rvnum));
		model.addAttribute("sbcode",sbcode);
		model.addAttribute("wid", wid);
		return "review/review_reply_view";

	}

	@RequestMapping("/review_reply_write")
	public String reply_write(HttpServletRequest request, Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		String strId = request.getParameter("buid");
		String strcode = request.getParameter("sbcode");
		int sbcode = Integer.parseInt(strcode);

		model.addAttribute("reply_write", dao.reply_write(strId, sbcode));

		return "review/review_reply_write";
	}

	@RequestMapping("/review_reply")
	public String reply(HttpServletRequest request, Model model) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		String buid = request.getParameter("buid");
		String rvtitle = request.getParameter("rvtitle");
		String rvcontent = request.getParameter("rvcontent");
		String rvgroup = request.getParameter("rvgroup");
		String rvstep = request.getParameter("rvstep");
		String rvindent = request.getParameter("rvindent");
		String sbcode= request.getParameter("sbcode");
		String wid= request.getParameter("wid");

		replyShape(rvgroup, rvstep);

		dao.reply(buid,rvtitle, rvcontent, rvgroup, rvstep, rvindent,sbcode);
		model.addAttribute("sbcode",sbcode);
		model.addAttribute("wid", wid);
		return "redirect:review_list";
	}

	private void replyShape(String rvgroup, String rvstep) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.replyShape(rvgroup, rvstep);
	}
}
