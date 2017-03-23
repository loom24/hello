package first.sample.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.sample.dao.SampleDAO;
import first.sample.dto.EmployeesDTO;
import first.sample.dto.StaffDTO;
import first.sample.service.SampleService;

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="sampleService")
	private SampleService sampleService;
	
	//sample 데이터 입력 페이지 이동
	@RequestMapping(value="/sample/openInput_EMP.do")
    public ModelAndView openBoardList() throws Exception{
		//view 이름 명시적 지정
    	ModelAndView mv = new ModelAndView("/sample/input_emp");
    	
    	return mv;
    }
	
	//smaple 데이터 입력시 id 중복 확인
	@RequestMapping(value="/sample/idconfirm.do", method=RequestMethod.GET)
	public void AjaxView(
        @RequestParam("CONFIRM_ID") String id,		
        HttpServletResponse response) throws Exception {
		
		String personJson;
		
		System.out.println("==============");
		
		if(sampleService.idconfirm(id)==1){
			
	        personJson = "{\"id\":\"Y"+"\"}";
	        
		}else{
			
			personJson = "{\"id\":\"N"+"\"}";
		}try {
	        response.getWriter().print(personJson);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }  
	}
	
	//sample 입력후 대기 페이지
	@RequestMapping(value="/sample/wait.do")
	public ModelAndView insertBoard(EmployeesDTO input) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/wait");
		
		sampleService.insertBoard(input);
		
		return mv;
	}
	
	//sample 대기후 로그인 페이지
	@RequestMapping(value="/sample/login.do")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/login");
		
		return mv;
	}
	
	//sample 로그인 페이지 id/pw DB 조회
	@RequestMapping(value="/sample/login_result.do")
	public ModelAndView openBoardUpdate(EmployeesDTO input) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		if(sampleService.idcheck(input)==1){//로그인페이지에서 입력한 id와 pw가 동일한건이 있으면...
			mv.setViewName("/sample/login_success");
		}else{
			mv.setViewName("/sample/login_fail");
		}
	
		return mv;
	}
	
	//sample flag 로그인 승인
	@RequestMapping(value="/sample/idAgree.do", method=RequestMethod.GET)
	public void AjaxAgree(
			@RequestParam("CONFIRM_FLAG") String ag,
			HttpServletResponse response
			) throws Exception{
		String personJson;
		
		System.out.println("==============");
		
		if(sampleService.idagree(ag)==1){
			
			personJson = "{\"ag\":\"Y"+"\"}";
			
		}else{
			
			personJson = "{\"ag\":\"N"+"\"}";
		}try {
			response.getWriter().print(personJson);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	
	//staff 데이터 전체 조회
	@RequestMapping(value="/staff/staff_search_form.do")
	public ModelAndView searchList(EmployeesDTO search) throws Exception{
		ModelAndView mv = new ModelAndView("/staff/staff_search_form");
		
    	List<Map<String,Object>> list = sampleService.staffList(null);
    	mv.addObject("list", list);
		
		return mv;
	}
	
	//staff 데이터 전체 조회(ajax)
	@RequestMapping(value="/staff/staff_search.do", method=RequestMethod.POST)
    @ResponseBody
    public List<Map<String, Object>> searchList(@RequestParam HashMap<String, Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/staff/staff_search_form");
		
		
//		if("".equals(commandMap.get("CNC_NAME")) || commandMap.get("CNC_NAME") == null){
//			commandMap.put("CNC_NAME","여자");
//		}
		
		List<Map<String, Object>> list = sampleService.staffList(commandMap);
		mv.addObject("list", list);
		return list;
	}
	
//	staff 데이터 등록 이동
	@RequestMapping(value="/staff/staff_insert_form.do")
	public ModelAndView inset() throws Exception{
		ModelAndView mv = new ModelAndView("/staff/staff_insert_form");
		
		return mv;
	}
	
//	staff 데이터 입력
	@RequestMapping(value="/staff/staff_into.do")
	public ModelAndView intotBoard(StaffDTO into) throws Exception{
		ModelAndView mv = new ModelAndView("/staff/staff_insert_form");
		
		sampleService.intoBoard(into);
		
		return mv;
	}
	
	//새로운 시도
//	@RequestMapping("/staff/staff_updel_form.do")
//	public int staff_updel_form(Model model, HttpSession session){
//		int seq = (Integer) session.getAttribute("CNC_SEQ");
//		if(seq==null){
//			return "redirect:staff_insert_form.do";
//			
//			model.addAllAttributes(sampleService.staffList(CNC_SEQ));
//			return "staff_updel_form";
//		return seq;
//		}
//    @RequestMapping("memberUpdate.do"){
//    	public String memberUpdate(RequestParam HashMap<String, Object> params){
//    		sampleService.member
//    	}
//    }
//	}
	
//	value=이동하기위한 주소
//	@RequestMapping(value="/staff/staff_updel_form.do")
//	public ModelAndView AjaxUp(HttpServletRequest request){
//        
//		String seq = request.getParameter("CNC_SEQ");
//		
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("CNC_SEQ", seq);
//		
//		return mv;
//  
//	}
//	@RequestMapping(value = "/staff/staff_updel_form.do/{CNC_SEQ}", method = RequestMethod.GET)
//	public String edit(@PathVariable int CNC_SEQ) {
//	     id 값을 통해 데이터를 가져옴
//	    Book book = bookMapper.getBook(id);
//	    return "staff/staff_updel_form.do";
//	}
}
