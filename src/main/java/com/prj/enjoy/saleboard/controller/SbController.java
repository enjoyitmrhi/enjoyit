package com.prj.enjoy.saleboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.prj.enjoy.saleboard.dao.SbDao;

@Controller
public class SbController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/board_list")
	public String boardList(HttpServletRequest request, Model model) {

		SbDao dao = sqlSession.getMapper(SbDao.class);

		String id = null;
		id = request.getParameter("id");
		System.out.println(id);
		int result = checkid(id);
		System.out.println("result : " + result);

		if (result == 1) {

			model.addAttribute("checkid", 1);
		} else {
			model.addAttribute("checkid", "");
		}

		model.addAttribute("boardlist", dao.board_list());
		model.addAttribute("id", id);
		return "sale_board/board_list";
	}

	private int checkid(String id) {
		SbDao dao = sqlSession.getMapper(SbDao.class);
		String strId = id;
		int result = 0;
		if (strId != null) {
			result = dao.checkBid(strId);

		}
		return result;
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
	public String board_write(HttpServletRequest request, Model model) {

		String buid = request.getParameter("buid");
		String sbpic = request.getParameter("sbpic");
		String sbtitle = request.getParameter("sbtitle");
		String sbprice = request.getParameter("sbprice");
		String sbloc = request.getParameter("sbloc");

		SbDao dao = sqlSession.getMapper(SbDao.class);
		dao.board_write(buid, sbpic, sbtitle, sbprice, sbloc);

		return "redirect:board_list";
	}
}
