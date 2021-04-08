package cdd.controller.bean;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import cdd.model.dto.NotesDTO;
import cdd.model.dto.Pet_InfoDTO;
import cdd.model.dto.Pet_JJDTO;
import cdd.model.dto.Pet_SickDTO;
import cdd.model.dto.Pet_SurgDTO;
import cdd.service.bean.MainService;
import cdd.service.bean.MyPageService;
import cdd.service.bean.NotesService;
import cdd.service.bean.PetService;

@Controller
@RequestMapping("/myPage/")
public class MyPageController {

	@Autowired
	private NotesService notesService = null; 	// 펫 일정 서비스
	@Autowired
	private PetService petService = null;		// 펫 관련 서비스 
	@Autowired
	private MyPageService myPageService = null;
	@Autowired
	private MainService mainService = null;

	// User 프로필 페이지 (수정 : 선준)
	@RequestMapping("userProfile.cdd")
	public String userProfile(Model model, String profileId) throws Exception {
		Map petInfo = petService.getPetInfoList(profileId);
		Map profileIdInfo = myPageService.getProfileIdInfo(profileId);
		// 펫 정보등록되었는지 뿌려주기
		model.addAttribute("petInfoList", petInfo.get("petInfoList"));
		model.addAttribute("count", petInfo.get("count"));
		model.addAttribute("profileIdInfo", profileIdInfo);
		return "myPage/userProfile";
	}//userProfile
	
	@RequestMapping("myPageFollowerList.cdd")
	public String myPageFollowerList(String userId, Model model) throws Exception{
		List followerList = myPageService.getFollowerList(userId);
		model.addAttribute("userId", userId);
		model.addAttribute("followerList", followerList);
		return "myPage/myPageFollowerList";
	}
	
	@RequestMapping("myPageFollowList.cdd")
	public String myPageFollowList(String userId, Model model) throws Exception{
		List followList = myPageService.getfollowList(userId);
		model.addAttribute("followList", followList);
		return "myPage/myPageFollowList";
	}
	
	@RequestMapping("collection.cdd")
	public String collection(HttpSession session, Model model) throws Exception{
		String memId = (String)session.getAttribute("memId");
		List collectionList = myPageService.getCollectionList(memId);
		model.addAttribute("collections", collectionList);
		return "myPage/collection";
	}
	
	@RequestMapping("sendDm.cdd")
	public String sendDm(String sender, String receiver, String content) throws Exception{
		Map dmAttr = new HashMap();
		dmAttr.put("memId", sender);
		dmAttr.put("chatId", receiver);
		dmAttr.put("sendContent", content);
		mainService.insertDm(dmAttr);
		
		return "redirect:/dm.cdd";
	}
	
	
	
	// ================================ 펫 =========================================================

	// 펫정보 가입 폼 페이지
	@RequestMapping("petInfoForm.cdd")
	public String petInfoForm(Integer type_num ,Model model) throws Exception{
		System.out.println("petInfoForm 입성");
		//펫 종류와 펫 품종뿌려주기
		Map pettypes = petService.getPetType();
	
		model.addAttribute("pettype", pettypes.get("pettype"));
		
		return "/myPage/petInfoForm";
	}//petInfoTest
	
	// 펫정보 가입 처리 
	@RequestMapping("petInfoPro.cdd")	// Pet_SickDTO pet_SickDTO, Pet_JJDTO pet_JJDTO, Pet_SurgDTO pet_SurgDTO
	public String petInfoPro(Pet_InfoDTO pet_InfoDTO, MultipartHttpServletRequest request, Pet_SickDTO pet_SickDTO, Pet_JJDTO pet_JJDTO, Pet_SurgDTO pet_SurgDTO) throws Exception{
		// 펫 정보 저장(보유질환, 접종기록, 수술기록)
		petService.insertPetInfo(pet_InfoDTO, request, pet_SickDTO, pet_JJDTO, pet_SurgDTO);
		
		// userProfile 페이지로 변경
		return "redirect:/myPage/userProfile.cdd";
	}//petInfoPro
	
	// 펫 정보 보기 <본인> -> Modify , <이용자> -> View 페이지
	@RequestMapping("petInfoView.cdd")
	public String petViewForm(HttpServletRequest Requset, String user_id, Integer pet_number, Model model) throws Exception {		
		System.out.println("petInfoView 입성");
		HttpSession session = Requset.getSession();		// 세션 꺼내기
		String sessionid = (String)session.getAttribute("memId");
		String view = "/myPage/petInfoModifyForm"; 		// 기본 본인으로 셋팅
		
		user_id = sessionid;// 나중에 삭제

		if(!sessionid.equals(user_id)){  // 이용자인지 유저 인지 구별
			view ="/myPage/petInfoView"; // 유저일경우 view 페이지로 이동 그렇지 않다면 Modify로
		}//if
		
		Map<String, Object> pet_allInfo = new HashMap<String, Object>();
		// 펫 고유번호에 해당하는 정보 가져오기
		pet_allInfo = petService.getPetOneInfo(user_id, pet_number);
		model.addAttribute("pet_infoDTO", pet_allInfo.get("pet_infoDTO"));
		model.addAttribute("pet_sickDTOList", pet_allInfo.get("pet_sickDTOList"));
		model.addAttribute("pet_jjDTOList", pet_allInfo.get("pet_jjDTOList"));
		model.addAttribute("pet_surgDTOList", pet_allInfo.get("pet_surgDTOList"));
		model.addAttribute("pet_typeName", pet_allInfo.get("pet_typeName"));
		model.addAttribute("pet_kindName", pet_allInfo.get("pet_kindName"));
		
		model.addAttribute("sickCount", pet_allInfo.get("sickCount"));
		model.addAttribute("jjCount", pet_allInfo.get("jjCount"));
		model.addAttribute("surgCount", pet_allInfo.get("surgCount"));
		
		model.addAttribute("pet_number", pet_number);
		return view;
	}//petViewForm
	
	// 펫 이미지 업로드하기 (이미지 변경) ajax
	@ResponseBody
	@RequestMapping("pet_UploadImg.cdd")
	public String petUploadImg(MultipartHttpServletRequest request) throws Exception {
		System.out.println("업로드 이미지 입성");
		String result = petService.petUploadImg(request);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(result);
		
		return json;
	}//petUploadImg
	
	//펫 InfoModify Ajax 
	@RequestMapping("pet_InfoModify.cdd")
	public void petInfoModify(@RequestBody Map<Object, Object> data) throws Exception {
		petService.petModifyInfo(data);
		
	}//infoModify

	//펫 질환, 접종, 수술 추가사항 등록하기 Ajax
	@RequestMapping("pet_SickModify.cdd")
	public void petSickModify(@RequestBody Map<Object, Object> data) throws Exception {
		petService.petSickModify(data);
		
	}//petSickModify
	
	//펫 품종 변경 Ajax 
	@ResponseBody
	@RequestMapping("pet_kind.cdd")
	public String getPet_kind(@RequestBody Map<Object, Object> data) throws Exception{
		Integer type_num = Integer.parseInt(data.get("type_num").toString()); //문자열 변환 -> 정수로 변환
		ObjectMapper mapper = new ObjectMapper(); //JSon변환
		List<Object> petkinds = petService.getPetKind(type_num); //리스트로 받아온 데이텅 JSON 으로 넘겨주기
		String json = mapper.writeValueAsString(petkinds);
		
		return json;
	}//getPet_kind
	
	// ======================================== 일지 ====================================================
	
	// 일지 Form 페이지             #### 펫 정보 긁어와서 있는지 없는지 확인해야한다 ( 해당펫의 넘버가 필요하다 )
	@RequestMapping("noteWriteForm.cdd")
	public String noteWriteForm(String view, Model model,Integer pet_num) {
		System.out.println("noteWriteForm 입성!");
		model.addAttribute("view" + view);
		return "/myPage/noteWriteForm";
	}//noteWriteForm
	
	// 일지 처리
	@RequestMapping("noteWritePro.cdd")
	public ModelAndView noteWritePro(NotesDTO notesdto, String view) throws Exception {
		System.out.println("pro 입성!!");
		int cnt = notesService.insertNote(notesdto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("cnt", cnt);
		mv.setViewName("redirect:/myPage/"+view+".cdd");
		
		return mv;
	}//noteWritePro
	
	// ======================================== 일정 ====================================================
	
	// 일정 Form 페이지
	@RequestMapping("scheAddForm.cdd")
	public String scheAddForm(Model model ,String view) {
		System.out.println("scheAddForm 입성 !");
		model.addAttribute("view" + view);
		
		return "/myPage/scheAddForm";
	}//scheAddForm
	
	
	
	
	
	
	
	
	
}//MyPageController
