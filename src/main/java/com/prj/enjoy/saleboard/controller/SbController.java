package com.prj.enjoy.saleboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.prj.enjoy.saleboard.dao.SbDao;

@Controller
public class SbController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/board_list")
	public String boardList(HttpServletRequest request, Model model) {

		SbDao dao = sqlSession.getMapper(SbDao.class);

	

		model.addAttribute("boardlist", dao.board_list());
	
		return "sale_board/board_list";
	}

	

	@RequestMapping(value = "/sbcontent_view")
	public String sbcontent_view(HttpServletRequest request, Model model) {
		String wid = request.getParameter("wid");
		String sbcode = request.getParameter("sbcode");

		model.addAttribute("wid", wid);
		model.addAttribute("sbcode", sbcode);
		return "sale_board/sbcontent_view";
	}

	@RequestMapping(value = "/board_write_view")
	public String board_write_view(HttpServletRequest request, Model model) {
		String strId = request.getParameter("buid");
		model.addAttribute("id", strId);
		return "sale_board/board_write_view";
	}

	@RequestMapping(value = "/board_write")
	public String board_write(HttpServletRequest request, Model model) throws Exception {

		String attachPath = "resources\\upload\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String path = uploadPath + attachPath;
		System.out.println("path >>> " + path);

		MultipartRequest req = new MultipartRequest(request, path, 2044 * 1024 * 10, "UTF-8",
				new DefaultFileRenamePolicy());
		
		
		String buid = req.getParameter("buid");
		String sbpic = req.getFilesystemName("sbpic");
		String sbtitle = req.getParameter("sbtitle");
		String sbprice = req.getParameter("sbprice");
		String sbloc = req.getParameter("sbloc");

		
		
		SbDao dao = sqlSession.getMapper(SbDao.class);
		dao.board_write(buid, sbpic, sbtitle, sbprice, sbloc);

		return "redirect:board_list";
	}
}
