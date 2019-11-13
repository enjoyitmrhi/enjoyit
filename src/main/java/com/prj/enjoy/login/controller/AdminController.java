package com.prj.enjoy.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.prj.enjoy.login.dao.AdminDao;
import com.prj.enjoy.login.dto.bSearchVO;
import com.prj.enjoy.login.dto.cSearchVO;

@Controller
public class AdminController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}

	@RequestMapping("/adminLoginProc")
	public String adminLogin(HttpServletRequest request) {
		String adid = request.getParameter("adid");
		String adpw = request.getParameter("adpw");
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		if (dao.getAdmin(adid) == null) {
			System.out.println("no id");
			return "/admin";
		} else if (!dao.getAdmin(adid).getAdpw().equals(adpw)) {
			System.out.println("wrong pw");
			return "/admin";
		} else {
			System.out.println("login success");
			return "redirect:adminMain";
		}
		
	}

	@RequestMapping("/adminMain")
	public String adminMain() {
		
		return "admin/adminMain";
	}

	@RequestMapping("/cuManagement")
	public String cuManagement(HttpServletRequest request, Model model) {
		String cunum = request.getParameter("cunum");
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("cu", dao.getCuInfo(cunum));

		return "admin/cuManagement";
	}

	@RequestMapping("/buManagement")
	public String buManagement(HttpServletRequest request, Model model) {
		String bunum = request.getParameter("bunum");
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("bu", dao.getBuInfo(bunum));

		return "admin/buManagement";
	}

	@RequestMapping("/del_cu")
	public String del_cu(HttpServletRequest request) {
		System.out.println("passing del_cu");
		String cuid = request.getParameter("cuid");
		System.out.println("cuid : " + cuid);
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.del_reserv(cuid);
		dao.del_cReview(cuid);
		dao.del_cQna(cuid);
		dao.del_cu(cuid);
		return "redirect:admin_cuMember";

	}

	@RequestMapping("/del_bu")
	public String del_bu(HttpServletRequest request) {
		System.out.println("passing del_bu");
		String buid = request.getParameter("buid");
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.del_bQna(buid);
		dao.del_bReview(buid);
		dao.del_sb(buid);
		dao.del_bu(buid);
		return "redirect:admin_buMember";

	}

	@RequestMapping("/edit_cu")
	public String edit_cu(HttpServletRequest request, Model model) {
		String cunum = request.getParameter("cunum");
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("cu", dao.getCuInfo(cunum));
		return "admin/edit_cu";
	}

	@RequestMapping("/edit_bu")
	public String edit_bu(HttpServletRequest request, Model model) {
		String bunum = request.getParameter("bunum");
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("bu", dao.getBuInfo(bunum));
		return "admin/edit_bu";
	}

	@RequestMapping("/cu_editProc")
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
		System.out.println("cunum >>>> "+ cunum);
		System.out.println("cuid >>>> "+ cuid);
		System.out.println("cuname >>>> "+ cuname);
		System.out.println("cuaddr >>>> "+ cuaddr);
		System.out.println("cuemail >>>> "+ cuemail);
		System.out.println("cubirth >>>> "+ cubirth);
		System.out.println("cugender >>>> "+ cugender);
		System.out.println("cutel >>>> "+ cutel);
		
		
		
		
		dao.editProc_cu(cuid, cuname, cuaddr, cuemail, cubirth, cugender, cutel, cunum);
		model.addAttribute("cunum", cunum);
		return "redirect:cuManagement";
	}

	@RequestMapping("/bu_editProc")
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
		return "redirect:buManagement";
	}
	@RequestMapping("/admin_cuMember")
	public String admin_cuMember(HttpServletRequest request, cSearchVO csearchVO, bSearchVO bsearchVO, Model model) {
		System.out.println("passing adminMain");
//		Map<String, String> map =new HashMap<String, String>();
		String cusort = "";
		String busort = "";
		String sort= request.getParameter("sort");
		if(sort != null) {
		if (sort.equals("num")) {
			model.addAttribute("num","true");
		}else if (sort.equals("name")) {
			model.addAttribute("name","true");
		}else if (sort.equals("date")) {
			model.addAttribute("date","true");
		}
	}
			
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		int ctotal = 0 ; 
		ctotal = dao.selectCuCount();
		String strPage = request.getParameter("cpage");
		if (strPage == null || strPage.equals("")) {
			strPage = "1";
		}
		int cpage =Integer.parseInt(strPage);
		csearchVO.setPage(cpage);
		csearchVO.pageCalculate(ctotal);
		
		int rowStart = csearchVO.getRowStart();
		int rowEnd = csearchVO.getRowEnd();
		if (sort==null || sort.equals("")) {
			cusort=null;
			busort=null;
		}
		else if (sort !=null ) {
			cusort = "cu" + sort;
			System.out.println(cusort);
			busort = "bu" + sort;
			System.out.println(busort);
		}
		
		
		System.out.println(cusort);
		model.addAttribute("clist", dao.getCustomer(cusort, rowStart, rowEnd));
		model.addAttribute("cSearchVO",csearchVO);
		
		int btotal = 0 ; 
		btotal = dao.selectBuCount();
		strPage = request.getParameter("bpage");
		if (strPage == null || strPage.equals("")) {
			strPage = "1";
		}
		
		int bpage =Integer.parseInt(strPage);
		bsearchVO.setPage(bpage);
		bsearchVO.pageCalculate(btotal);
		
		rowStart = bsearchVO.getRowStart();
		rowEnd = bsearchVO.getRowEnd();
		
		model.addAttribute("blist", dao.getBusiness(busort, rowStart, rowEnd));
		model.addAttribute("bSearchVO",bsearchVO);
		
		return"admin/admin_cuMember";
	}
	@RequestMapping("/admin_buMember")
	public String admin_buMember(HttpServletRequest request, cSearchVO csearchVO, bSearchVO bsearchVO, Model model) {
		System.out.println("passing adminMain");
//		Map<String, String> map =new HashMap<String, String>();
		String cusort = "";
		String busort = "";
		String sort= request.getParameter("sort");
		if(sort != null) {
		if (sort.equals("num")) {
			model.addAttribute("num","true");
		}else if (sort.equals("name")) {
			model.addAttribute("name","true");
		}else if (sort.equals("date")) {
			model.addAttribute("date","true");
		}
	}
			
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		int ctotal = 0 ; 
		ctotal = dao.selectCuCount();
		String strPage = request.getParameter("cpage");
		if (strPage == null || strPage.equals("")) {
			strPage = "1";
		}
		int cpage =Integer.parseInt(strPage);
		csearchVO.setPage(cpage);
		csearchVO.pageCalculate(ctotal);
		
		int rowStart = csearchVO.getRowStart();
		int rowEnd = csearchVO.getRowEnd();
		if (sort==null || sort.equals("")) {
			cusort=null;
			busort=null;
		}
		else if (sort !=null ) {
			cusort = "cu" + sort;
			System.out.println(cusort);
			busort = "bu" + sort;
			System.out.println(busort);
		}
		
		
		System.out.println(cusort);
		model.addAttribute("clist", dao.getCustomer(cusort, rowStart, rowEnd));
		model.addAttribute("cSearchVO",csearchVO);
		
		int btotal = 0 ; 
		btotal = dao.selectBuCount();
		strPage = request.getParameter("bpage");
		if (strPage == null || strPage.equals("")) {
			strPage = "1";
		}
		
		int bpage =Integer.parseInt(strPage);
		bsearchVO.setPage(bpage);
		bsearchVO.pageCalculate(btotal);
		
		rowStart = bsearchVO.getRowStart();
		rowEnd = bsearchVO.getRowEnd();
		
		model.addAttribute("blist", dao.getBusiness(busort, rowStart, rowEnd));
		model.addAttribute("bSearchVO",bsearchVO);
		return"admin/admin_buMember";
	}
	
}