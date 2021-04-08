package cdd.controller.bean;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cdd.model.dto.UserDTO;
import cdd.service.bean.UserService;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	// 비지니스 처리 요청 -> service(객체생성)
	@Autowired
	private UserService userService = null;

	// 메인페이지
	@RequestMapping("main2.cdd")
	public String main(HttpSession session) {
		System.out.println("main con");
		String id = (String) session.getAttribute("memId");
		System.out.println("memId : " + id);
		return "main/main2";
	}
	
	// 로그인 폼
	@RequestMapping("loginForm.cdd")
	public String loginForm(HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		if(memId != null ) {
			return "redirect:/main.cdd";
		}
		return "user/loginForm";
	}
	
	// 로그인 프로
	@RequestMapping("loginPro.cdd")
	public String loginPro(UserDTO dto, Model model) throws Exception {
		int result = userService.idPwCheck(dto);
		model.addAttribute("result", result);
		return "user/loginPro";
	}
	
	// 로그아웃
	@RequestMapping("logout.cdd")
	public String logout(HttpSession session) {
		userService.logout("memId");
		return "redirect:/user/loginForm.cdd";
	}
	
	// 회원 가입
	@RequestMapping("signupForm.cdd")
	public String signupForm() {
		return "user/signupForm";
	}
	
	// 회원 가입 Pro
	@RequestMapping("signupPro.cdd")
	public String signupPro(UserDTO dto) throws Exception {
		userService.addMember(dto);
		return "redirect:loginForm.cdd";
	}
	
	// ajax ID 확인 매핑
	@RequestMapping("ajaxIdEmailAvail.cdd")
	public ResponseEntity<String> ajaxIdAvail(String id, String email) throws Exception{
		System.out.println("ajaxIdAvail con");
		String result = "";
		int check = userService.idEmailCheck(id, email);
		if(check == 1) {
			result = "Not Available";
		}else {
			result = "Available";
		}
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("content-type", "text/html;charset=utf-8");
		return new ResponseEntity<String>(result, responseHeaders, HttpStatus.OK);
	}
	
	// id 찾기
	@RequestMapping("findIdPw.cdd")
	public String findIdPw() {
		return "user/findIdPw";
	}
	
	// id 찾기 Pro
	@RequestMapping("findIdPro.cdd")
	public ResponseEntity<String> findIdPro(String email, Model model) throws Exception {
		String result = "";
		String id = userService.getIdMember(email);
		if(id != null) {
			result = id;
		}else if(id == null) {
			result = "아이디 없음";
		}
		model.addAttribute("user_id", id);
		System.out.println(id);
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("content-type", "text/html;charset=utf-8");
		return new ResponseEntity<String>(result, responseHeaders, HttpStatus.OK);
	}
	
	// pw 찾기
	@RequestMapping("findPwPro.cdd")
	public String findPwPro(String id, String email, Model model) throws Exception {
		
		String uri = userService.findPw(id, email);
		System.out.println("findPwPro con uri : " + uri);
		model.addAttribute("user_id", id);
		return uri;
	}
	
	// pw 변경
	@RequestMapping("pwEditPro.cdd")
	public String pwEditPro(UserDTO dto) throws Exception {
		userService.pwEdit(dto);
		return "user/pwEditPro";
	}
	
	// pw확인
	@RequestMapping("userPwCh.cdd")
	public String userPwCh(){
		return "user/userPwCh";
	}
	
	// pw 확인 Pro
	@RequestMapping("userPwChPro.cdd")
	public String userPwChPro(UserDTO dto, Model model) throws Exception{
		int result = userService.pwCheck(dto);
		model.addAttribute("result", result);
		return "user/userPwChPro";
	}
	
	// userEdit
	@RequestMapping("userEdit.cdd")
	public String userEdit(Model model) throws Exception{
		UserDTO member = userService.getMember();
		model.addAttribute("member", member);
		return "user/userEdit";
	}
	
	// userEditPro
	@RequestMapping("userEditPro.cdd")
	public String userEditPro(UserDTO dto, MultipartHttpServletRequest request) {
		
		userService.updateMember(dto, request);
		return "test";
	}
	
	// 프로필 드롭다운 비밀번호 변경
	@RequestMapping("pwModifyForm.cdd")
	public String pwModifyForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("sessId", (String)session.getAttribute("memId"));
		return "user/pwModifyForm";
	}
	
	// 프로필 드롭다운 비밀번호 변경 pro
	@RequestMapping("pwModifyPro.cdd")
	public String pwModifyPro(String userId, String exPw, String newPw, Model model) throws Exception{
		Integer res = userService.pwModifyPro(userId, exPw, newPw);
		model.addAttribute("res", res);
		return "user/pwModifyPro";
	}
}
