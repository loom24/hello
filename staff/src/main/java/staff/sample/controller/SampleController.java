package staff.sample.controller;

import java.awt.Dialog.ModalExclusionType;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.asm.commons.TryCatchBlockSorter;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import staff.common.common.CommandMap;
import staff.sample.dao.PageDAO;
import staff.sample.dao.StaffDAO;
import staff.sample.dao.StaffDAOImpl;
import staff.sample.dto.StaffDTO;

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="staffDAO")
	private StaffDAO staffDAO;
	
    //시작 페이지
	@RequestMapping(value="staff_index_form.do")
	public String staff_index_form(){
		
		return "/staff/staff_index_form";
	}
	
	
	//staff 데이터 전체 조회
	//vlaue 값은 경로식(staff/staff_search_form)으로 사용하면 안된다.
	@RequestMapping(value="staff_search_form.do")
	public String staff_search_form(@RequestParam(defaultValue="1") int curPage
			,@RequestParam(required=false, defaultValue="")String CNC_NAME, Model model){
		
		//현재 페이지 번호가 curPAge에 전달됨
		//전체 페이지 객수 계산
		int count = staffDAO.boardCount(CNC_NAME);
		//페이지 나누기 관련 정보 설정
		PageDAO pageDao= new PageDAO(count, curPage);
		//현재 페이지의 시작 레코드 번호, 끝 레코드 번호계산
		int start = pageDao.getPageBegin();
		int end = pageDao.getPageEnd();
		
    	List<StaffDTO> list = staffDAO.staffList(start, end, CNC_NAME);
    	model.addAttribute("list", list);
    	model.addAttribute("page",pageDao);
		
		return "/staff/staff_search_form";
	}
	
//	@RequestMapping(value="/staff/staff_search.do")
//	public Staring staffsearch

	
//	staff 데이터 등록 이동
	@RequestMapping(value="staff_insert_form.do")
	public ModelAndView inset() throws Exception{
		ModelAndView mv = new ModelAndView("/staff/staff_insert_form");
		
		return mv;
	}
	//staff 데이터 입력
	@RequestMapping(value="staff_insert.do")
	public ModelAndView insertBoard(StaffDTO into) throws Exception{
		ModelAndView mv = new ModelAndView("/staff/staff_insert_form");
		
		staffDAO.staffInsert(into);
		
		return mv;
	}
	
//  staff inputText 데이터 입력
	@RequestMapping(value="staff_updel_form.do")
	public String staff_updel_form(@RequestParam int CNC_SEQ, Model model) throws Exception{
		
		System.out.println("코드는"+CNC_SEQ);
		
		StaffDTO dto = staffDAO.staffDetail(CNC_SEQ);
		
		model.addAttribute("dto", dto);
		
		return "staff/staff_updel_form";
	}
	
//	staff 삭제
	@RequestMapping(value="staff_del_form.do")
	public String staff_delete(@RequestParam int CNC_SEQ, Model model) throws Exception{
		
		StaffDTO dto = staffDAO.deleteBoard(CNC_SEQ);
		
		model.addAttribute("dto", dto);
		
		return "staff/staff_updel_form";
		
	}
	
//	staff 데이터 수정
	@RequestMapping(value="staff_update_form.do")
	public ModelAndView updateBoard(StaffDTO up) throws Exception{
		ModelAndView mv = new ModelAndView("staff/staff_updel_form");
		
		staffDAO.staffUpdate(up);
		
		return mv;
	}
}
