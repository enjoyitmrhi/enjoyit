package com.prj.enjoy.login.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.prj.enjoy.login.dao.AdminDao;
import com.prj.enjoy.login.dao.LoginDao;
import com.prj.enjoy.login.dto.Business;
import com.prj.enjoy.login.dto.Customer;
import com.prj.enjoy.qna.dao.QnaDao;
import com.prj.enjoy.review.dao.ReviewDao;

@Controller
public class LoginController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		// 세션 삭제
		session.invalidate();

		return "redirect:/login";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/loginProc")
	public String loginProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		String cuid = request.getParameter("cuid");
		String cupw = request.getParameter("cupw");
		Customer dto = dao.getCustomer(cuid);
		if (dto == null) {
			System.out.println("check id");
			return "login/login";
		} else if (!dto.getCupw().equals(cupw)) {
			System.out.println("check pw");

			return "login/login";
		} else {
			model.addAttribute("customer", dto);
			System.out.println("로그인 성공");
			session.setAttribute("session_cid", cuid);
			session.setAttribute("session_cname", dto.getCuname());
			return "redirect:board_list";
		}

	}

	@RequestMapping(method = RequestMethod.POST, value = "/bLoginProc")
	public String bLoginProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		String buid = request.getParameter("buid");
		String bupw = request.getParameter("bupw");
		Business dto = dao.getBusiness(buid);
		if (dto == null) {
			System.out.println("check id");
			return "login/login";
		} else if (!dto.getBupw().equals(bupw)) {
			System.out.println("check pw");
			return "login/login";
		} else {
			model.addAttribute("business", dto);
			System.out.println("로그인 성공");
			session.setAttribute("session_bid", buid);
			session.setAttribute("session_bname", dto.getBuname());
			return "index";
		}

	}

	@RequestMapping("/join")
	public String join() {
		return "login/join";
	}

	@RequestMapping("/joinProc")
	public String joinProc(HttpServletRequest request) throws Exception {
		LoginDao dao = sqlSession.getMapper(LoginDao.class);

		String cuid = request.getParameter("cuid");
		String cupw = request.getParameter("cupw");
		String cupw2 = request.getParameter("cupw2");
		String cuname = request.getParameter("cuname");
		String cugender = request.getParameter("cugender");
		String cuyear = request.getParameter("cuyear");
		String cuaddr = request.getParameter("cuaddr");
		String cumonth = request.getParameter("cumonth");
		String cuday = request.getParameter("cuday");
		String cubirth = String.format("%s-%s-%s", cuyear, cumonth, cuday);
		String cutel = request.getParameter("cutel");
		String cuemail = request.getParameter("cuemail");

		int result = 0;
		/* dao.chkCid(cuid); */ ;

		List<String> errors = new ArrayList();
		if (result > 0) {
			errors.add("check ID");
		}
		if (!cupw.equals(cupw2)) {
			errors.add("check your passwd");
		}

		System.out.println("errors :" + errors.size());
		if (errors.size() > 0) {
			return "login/join";
		} else {
			dao.createCustomer(cuid, cupw, cuname, cuaddr, cuemail, cugender, cubirth, cutel);
			return "redirect:login";
		}

	}

	@RequestMapping("/chk_cid.do")
	private @ResponseBody String chkCid(@RequestParam("userid") String cuid) {
		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		System.out.println("cuid >>>>>>" + cuid);
		String result = dao.chkCid(cuid);
		System.out.println(result);

		return result;
	}

	@RequestMapping("/bJoin")
	public String bJoin() {
		return "login/bJoin";
	}

	@RequestMapping("/bJoinProc")
	public String bJoinProc(HttpServletRequest request) throws Exception {
		LoginDao dao = sqlSession.getMapper(LoginDao.class);

		String buid = request.getParameter("buid");
		String bupw = request.getParameter("bupw");
		String bupw2 = request.getParameter("bupw2");
		String buname = request.getParameter("buname");
		String buemail = request.getParameter("buemail");
		String burenum = request.getParameter("burenum");
		String butel = request.getParameter("butel");
		String buaddr = request.getParameter("buaddr");

		int result = 0;
		ArrayList<String> errors = new ArrayList();
		if (result > 0) {
			errors.add("check ID");
		}
		if (!bupw.equals(bupw2)) {
			errors.add("check your passwd");
		}
		System.out.println("errors :" + errors.size());
		if (errors.size() > 0) {
			return "login/bJoin";
		} else {
			dao.createBusiness(buid, bupw, buname, buemail, burenum, butel, buaddr);
			return "redirect:board_list";
		}

	}

	@RequestMapping("/chk_bid.do")
	private @ResponseBody String chkBid(@RequestParam("userid") String buid) {
		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		System.out.println("buid >>>>>>" + buid);
		String result = dao.chkBid(buid);
		System.out.println(result);

		return result;
	}
	
	@RequestMapping("/cuMypage")
	public String cuMypage(HttpSession session, Model model) {
		String cuid=(String) session.getAttribute("session_cid");
		System.out.println(cuid);
		LoginDao logdao = sqlSession.getMapper(LoginDao.class);
		QnaDao qnadao = sqlSession.getMapper(QnaDao.class);
		ReviewDao rvdao = sqlSession.getMapper(ReviewDao.class);
		model.addAttribute("cu",logdao.getCustomer(cuid));
		model.addAttribute("qnacnt",qnadao.qnaboardcount(cuid));
		model.addAttribute("rvcnt",rvdao.rvboardcount(cuid));
		
		return "login/cuMypage";
	}
	
	@RequestMapping("/del_cuself")
	public String del_cuself(HttpServletRequest request, HttpSession session) {
		System.out.println("passing del_cu");
		String cunum = request.getParameter("cunum");
		System.out.println("cunum : " + cunum);
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.del_cu(cunum);
		logout(session);
		return "redirect:index";

	}
	
	@RequestMapping("/buMypage")
	public String buMypage(HttpSession session, Model model) {
		String buid=(String) session.getAttribute("session_bid");
		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		model.addAttribute("bu",dao.getBusiness(buid));
		return "login/buMypage";
	}
}
