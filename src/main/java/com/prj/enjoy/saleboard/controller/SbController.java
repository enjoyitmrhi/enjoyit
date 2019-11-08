package com.prj.enjoy.saleboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.prj.enjoy.saleboard.dao.SbDao;
import com.prj.enjoy.saleboard.dto.SbDto;

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

	@ResponseBody
	@RequestMapping(value = "/add_list")
	public ArrayList<SbDto> jsonBoardList(HttpServletRequest request, HttpServletResponse response) {

		SbDao dao = sqlSession.getMapper(SbDao.class);
		int sNum = Integer.parseInt(request.getParameter("num")) + 1;
		int eNum = Integer.parseInt(request.getParameter("num")) + 6;

		ArrayList<SbDto> addDto = dao.add_list(sNum, eNum);

		return addDto;

	}

	@RequestMapping(value = "/sbcontent_view")
	public String sbcontent_view(HttpServletRequest request, Model model) {
		String wid = request.getParameter("wid");
		String sbcode = request.getParameter("sbcode");

		SbDao dao = sqlSession.getMapper(SbDao.class);

		String avgstar;
		avgstar = dao.avgstar(sbcode);
		if (avgstar == null || avgstar.equals("0")) {
			avgstar = "1";
		}
		model.addAttribute("wid", wid);
		model.addAttribute("avgstar", avgstar);
		model.addAttribute("sbcontent_view", dao.sb_content(sbcode));
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

	@RequestMapping(value = "/sbdelete")
	public String sbdelete(HttpServletRequest request, Model model) {
		SbDao dao = sqlSession.getMapper(SbDao.class);
		String sbcode = request.getParameter("sbcode");

		dao.delete(sbcode);
		return "redirect:board_list";

	}

	@RequestMapping(value = "/sbmodify")
	public String sbmodify(HttpServletRequest request, Model model) throws Exception {
		String attachPath = "resources\\upload\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String path = uploadPath + attachPath;
		
		MultipartRequest req = new MultipartRequest(request, path, 2044 * 1024 * 10, "UTF-8",
				new DefaultFileRenamePolicy());

		
		SbDao dao = sqlSession.getMapper(SbDao.class);
		String sbcode = req.getParameter("sbcode");
		String sbprice = req.getParameter("sbprice");
		String sbtitle = req.getParameter("sbtitle");
		String sbcontent = req.getParameter("sbcontent");

		String sbpic = dao.getSbPic(sbcode);
		if (sbpic == null) {
			sbpic = "";
		}
		
		dao.sbmodify(sbcode, sbprice, sbtitle, sbcontent,sbpic);
		return "redirect:board_list";

	}

}
