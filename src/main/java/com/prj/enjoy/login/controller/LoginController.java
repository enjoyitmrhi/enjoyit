package com.prj.enjoy.login.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
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
import com.prj.enjoy.message.dao.MsgDao;
import com.prj.enjoy.qna.dao.QnaDao;
import com.prj.enjoy.reserve.dao.ReservDao;
import com.prj.enjoy.review.dao.ReviewDao;

@Controller
public class LoginController {
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private JavaMailSender mailSender;
	@RequestMapping("/")
	public ModelAndView indexpage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/login.pop")
	public String login(HttpSession session) {
		// 세션 삭제
		session.invalidate();

		return "login/login.pop";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		session.invalidate();
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null) {
			for(int i =0; i< cookies.length; i++) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		return "redirect:index";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/loginProc.do")
	@ResponseBody
	public String loginProc(@RequestParam("userid") String cuid, @RequestParam("userpw") String cupw,
		Model model, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		Customer dto = dao.getCustomer(cuid);
		if (dto == null) {
			System.out.println("check id");
			model.addAttribute("alert","check id");
			return "false: check id";
		} else if (!dto.getCupw().equals(cupw)) {
			System.out.println("check pw");
			model.addAttribute("alert","check id");
			return "false: check pw";
		} else {
			model.addAttribute("customer", dto);
			System.out.println("로그인 성공");
//			request.setAttribute("session_cid", cuid);
			Cookie cookie1 = new Cookie("cid",cuid);
			Cookie cookie2 = new Cookie("cname",dto.getCuname());
            response.addCookie(cookie1);response.addCookie(cookie2);
			return "true";
		}

	}

	@RequestMapping(method = RequestMethod.POST, value = "/bLoginProc.do")
	@ResponseBody
	public String bLoginProc(@RequestParam("userid") String buid, @RequestParam("userpw") String bupw,
			HttpServletResponse response, Model model) throws Exception {
		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		Business dto = dao.getBusiness(buid);
		if (dto == null) {
			System.out.println("check id");
			model.addAttribute("alert","check id");
			return "false: check id";
		} else if (!dto.getBupw().equals(bupw)) {
			System.out.println("check pw");
			model.addAttribute("alert","check id");
			return "false: check pw";
		} else {
			model.addAttribute("business", dto);
			System.out.println("로그인 성공");
			Cookie cookie1 = new Cookie("bid",buid);
			Cookie cookie2 = new Cookie("bname",dto.getBuname());
            response.addCookie(cookie1);response.addCookie(cookie2);
            
			return "true";
		}

	}

	@RequestMapping("/join.pop")
	public String join() {
		return "login/join.pop";
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
		String cumonth = request.getParameter("cumonth");
		String cuday = request.getParameter("cuday");
		String cubirth = String.format("%s-%s-%s", cuyear, cumonth, cuday);
		String cutel = request.getParameter("cutel");
		String cuemail = request.getParameter("cuemail");

		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String cuaddr = String.format("%s %s %s", addr1, addr2, addr3);

		String culongY = request.getParameter("longy");
		String culatX = request.getParameter("latx");
		System.out.println("cuaddr2 >>>> " + cuaddr);
		System.out.println("longy>>>" + culongY);
		System.out.println("latx>>>>" + culatX);

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
			dao.createCustomer(cuid, cupw, cuname, cuaddr, culongY, culatX, cuemail, cugender, cubirth, cutel);
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

	@RequestMapping("/bJoin.pop")
	public String bJoin() {
		return "login/bJoin.pop";
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
		// String buaddr = request.getParameter("buaddr");

		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String buaddr = String.format("%s %s %s", addr1, addr2, addr3);

		String bulongY = request.getParameter("longy");
		String bulatX = request.getParameter("latx");
		System.out.println("buaddr2 >>>> " + buaddr);
		System.out.println("entX>>>>" + bulongY);
		System.out.println("entY>>>>" + bulatX);

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
			dao.createBusiness(buid, bupw, buname, buemail, burenum, butel, buaddr, bulongY, bulatX);
			return "redirect:login";
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
		String cuid = (String) session.getAttribute("session_cid");
		System.out.println(cuid);
		LoginDao logdao = sqlSession.getMapper(LoginDao.class);
		QnaDao qnadao = sqlSession.getMapper(QnaDao.class);
		ReviewDao rvdao = sqlSession.getMapper(ReviewDao.class);
		MsgDao msgdao = sqlSession.getMapper(MsgDao.class);
		model.addAttribute("cu", logdao.getCustomer(cuid));
		model.addAttribute("qnacnt", qnadao.qnaboardQcount(cuid));
		model.addAttribute("rvcnt", rvdao.reviewcount(cuid));
		model.addAttribute("newmsg",msgdao.chkMsg(cuid,1));
		model.addAttribute("totmsg",msgdao.chkMsg(cuid,2));

		return "login/cuMypage";
	}

	@RequestMapping("/del_cuself")
	public String del_cuself(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		System.out.println("passing del_cu");
		String cunum = request.getParameter("cunum");
		System.out.println("cunum : " + cunum);
		String cuid = (String) session.getAttribute("session_cid");
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.del_reserv(cuid);
		dao.del_cReview(cuid);
		dao.del_cQna(cuid);
		dao.del_cu(cuid);
		logout(session, request, response);
		return "redirect:index";

	}

	@RequestMapping("/del_buself")
	public String del_buself(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		System.out.println("passing del_bu");
		String bunum = request.getParameter("bunum");
		System.out.println("bunum : " + bunum);
		String buid = (String) session.getAttribute("session_bid");
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.del_bQna(buid);
		dao.del_bReview(buid);
		dao.del_sb(buid);
		dao.del_bu(buid);
		logout(session, request, response);
		return "redirect:index";

	}

	@RequestMapping("/buMypage")
	public String buMypage(HttpSession session, Model model) {
		String buid = (String) session.getAttribute("session_bid");
		LoginDao logdao = sqlSession.getMapper(LoginDao.class);
		QnaDao qnadao = sqlSession.getMapper(QnaDao.class);
		ReviewDao rvdao = sqlSession.getMapper(ReviewDao.class);
		ReservDao rtdao = sqlSession.getMapper(ReservDao.class);
		model.addAttribute("bu", logdao.getBusiness(buid));
		model.addAttribute("qnacnt", qnadao.qnaboardAcount(buid));
		model.addAttribute("rvcnt", rvdao.replycount(buid));
		model.addAttribute("rtcnt", rtdao.cntReserv(buid));
		return "login/buMypage";
	}

	@RequestMapping("/findId")
	public String findId() {

		return "login/findId";
	}

	@RequestMapping("/findPw")
	public String findPw() {
		return "login/findPw";
	}

	@RequestMapping("/popup_findId")
	public String popup_findId(HttpServletRequest request, Model model) {
		String cuname = request.getParameter("cuname");
		String cutel = request.getParameter("cutel");
		String cuyear = request.getParameter("cuyear");
		String cumonth = request.getParameter("cumonth");
		String cuday = request.getParameter("cuday");
		String cubirth = String.format("%s-%s-%s", cuyear, cumonth, cuday);
		// System.out.println(cuname+ cutel + cubirth);
		LoginDao dao = sqlSession.getMapper(LoginDao.class);

		String buname = request.getParameter("buname");
		String butel = request.getParameter("butel");
		String burenum = request.getParameter("burenum");
		// System.out.println(buname+butel+burenum);

		if (cuname != null) {
			model.addAttribute("cuid", dao.popupfindCuid(cuname, cutel, cubirth));
		}
		if (buname != null) {
			model.addAttribute("buid", dao.popupfindBuid(buname, butel, burenum));
		}
		return "login/popup_findId";
	}

	@RequestMapping("/popup_findPw")
	public String popup_findPw(HttpServletRequest request, Model model) {
		String cuid = request.getParameter("cuid");
		String cuname = request.getParameter("cuname");
		String cutel = request.getParameter("cutel");
		String cuyear = request.getParameter("cuyear");
		String cumonth = request.getParameter("cumonth");
		String cuday = request.getParameter("cuday");
		String cubirth = String.format("%s-%s-%s", cuyear, cumonth, cuday);
		LoginDao dao = sqlSession.getMapper(LoginDao.class);

		String buid = request.getParameter("buid");
		String buname = request.getParameter("buname");
		String butel = request.getParameter("butel");
		String burenum = request.getParameter("burenum");

		if (cuname != null) {
			int cntpw = dao.popupfindCupw(cuname, cutel, cubirth, cuid);
			System.out.println(cntpw);
			String ranPw = setRanChar();
			System.out.println(ranPw);
			if (cntpw == 1) {
				// 검색비밀번호가 하나일 시 임시비밀번호로 변경
				dao.chgcpw(cuid, ranPw);
				String cuemail = dao.getCustomer(cuid).getCuemail();
				System.out.println(cuemail);
				sendMail(cuemail, ranPw);
				model.addAttribute("result", "임시비밀번호가 등록된 메일로 전송되었습니다.");
			} else {
				model.addAttribute("result", "입정한정보가 잘못되었습니다. 다시한번 확인해주세요.");
			}
		}
		if (buname != null) {
			int cntpw = dao.popupfindBupw(buname, butel, burenum, buid);
			setRanChar();
			String ranPw = setRanChar();
			if (cntpw == 1) {
				dao.chgbpw(buid, ranPw);
				String buemail = dao.getBusiness(buid).getBuemail();
				sendMail(buemail, ranPw);
				model.addAttribute("result", "임시비밀번호가 등록된 메일로 전송되었습니다.");
			} else {
				model.addAttribute("result", "입정한정보가 잘못되었습니다. 다시한번 확인해주세요.");
			}
		}
		return "login/popup_findPw";
	}

	private String setRanChar() {
		Random ran = new Random();
		char p;
		String pwd = "";

		for (int i = 0; i < 10; i++) {
			int m = ran.nextInt(3) + 1;

			if (m == 1) { // 숫자
				m = ran.nextInt(10);
				pwd += Integer.toString(m);
			} else if (m == 2) {// 대문자
				m = ran.nextInt(25) + 65;
				p = (char) m;
				pwd += Character.toString(p);
			} else {// 소문자
				m = ran.nextInt(25) + 97;
				p = (char) m;
				pwd += Character.toString(p);
			}
		}
		// A-Z 65 ~ 90 25
		// a-z 97 ~ 122

		return pwd;
	}

	@RequestMapping(value = "/sendMail.do")
	public String sendMail(final String setTo, final String ranPw) {
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("enjoy It <goodboyssw@gmail.com>");
				helper.setTo(setTo);
				helper.setSubject("Enjoy It 임시비밀번호");
				helper.setText("변경된 임시비밀번호입니다. 변경 부탁드립니다. " + ranPw, true);
			}
		};

		mailSender.send(preparator);

		return "result";
	}

	@RequestMapping("/ch_cupw")
	public String ch_cupw() {
		return "/login/ch_cupw";
	}

	@RequestMapping("/ch_cupwProc")
	public String ch_cpwProc(HttpServletRequest request, HttpSession session) {
		String cupw = request.getParameter("cupw");
		String chpw = request.getParameter("chpw");
		String cuid = (String) session.getAttribute("session_cid");
		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		Customer dto = dao.getCustomer(cuid);
		if (dto.getCupw().equals(cupw)) {
			dao.chgcpw(cuid, chpw);
			return "redirect:/cuMypage";
		} else {
			System.out.println("정보 오류 ");
			return "login/ch_cupw";
		}
	}

	@RequestMapping("/ch_bupw")
	public String ch_bupw() {
		return "login/ch_bupw";
	}

	@RequestMapping("/ch_bupwProc")
	public String ch_bpwProc(HttpServletRequest request, HttpSession session) {
		String bupw = request.getParameter("bupw");
		String chpw = request.getParameter("chpw");
		String buid = (String) session.getAttribute("session_bid");
		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		Business dto = dao.getBusiness(buid);
		if (dto.getBupw().equals(bupw)) {
			dao.chgbpw(buid, chpw);
			return "redirect:/buMypage";
		} else {
			System.out.println("정보 오류 ");
			return "login/ch_bupw";
		}
	}

	@RequestMapping("/edit_cuself")
	public String edit_cu(HttpServletRequest request, Model model) {
		String cunum = request.getParameter("cunum");
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("cu", dao.getCuInfo(cunum));
		return "login/edit_cuself";
	}

	@RequestMapping("/edit_buself")
	public String edit_bu(HttpServletRequest request, Model model) {
		String bunum = request.getParameter("bunum");
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("bu", dao.getBuInfo(bunum));
		return "login/edit_buself";
	}

	@RequestMapping("/editProc_cu")
	public String editProc_cu(HttpServletRequest request, Model model) {
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		String cunum = request.getParameter("cunum");
		String cuid = request.getParameter("cuid");
		String cuname = request.getParameter("cuname");
		String cuaddr = request.getParameter("cuaddr");
		String cuemail = request.getParameter("cuemail");
		String cubirth = request.getParameter("cubirth");
		String cugender = request.getParameter("cugender");
		String cutel = request.getParameter("cutel");
		dao.editProc_cu(cuid, cuname, cuaddr, cuemail, cubirth, cugender, cutel, cunum);
		model.addAttribute("cunum", cunum);
		return "redirect:cuMypage";
	}

	@RequestMapping("/editProc_bu")
	public String editProc_bu(HttpServletRequest request, Model model) {
		System.out.println("editProc_bu passing");
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		String bunum = request.getParameter("bunum");
		String buid = request.getParameter("buid");
		String buname = request.getParameter("buname");
		String buaddr = request.getParameter("buaddr");
		String buemail = request.getParameter("buemail");
		String burenum = request.getParameter("burenum");
		String butel = request.getParameter("butel");
		dao.editProc_bu(buid, buname, buaddr, buemail, burenum, butel, bunum);
		model.addAttribute("bunum", bunum);
		return "redirect:buMypage";
	}

	@RequestMapping("/myQuestion")
	public String myQuestion(HttpSession session, Model model) {
		String cuid = (String) session.getAttribute("session_cid");
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		
		model.addAttribute("qnalist",dao.myqnaclist(cuid));
		return "login//myQuestion";
	}

	@RequestMapping("/myReview")
	public String myReview(HttpSession session, Model model) {
		String cuid = (String) session.getAttribute("session_cid");
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);

		model.addAttribute("reviewlist", dao.myreviewlist(cuid));
		return "login/myReview";
	}

	@RequestMapping("/myAnswer")
	public String myAnswer(HttpSession session, Model model) {
		String buid = (String) session.getAttribute("session_bid");
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		model.addAttribute("qnalist",dao.myqnablist(buid));
		return "login/myAnswer";
	}

	@RequestMapping("/myReply")
	public String myReply(HttpSession session, Model model) {
		String buid = (String) session.getAttribute("session_bid");
		
		return "login/myReply";
	}
	
	@RequestMapping("/myReserv")
	public String myReserv(HttpSession session, Model model) {
		String buid = (String) session.getAttribute("session_bid");
		ReservDao dao = sqlSession.getMapper(ReservDao.class);
		model.addAttribute("rtlist", dao.getReserv(buid));
		return "login/myReserv";
	}
	
	
}
