package cdd.service.bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cdd.model.dao.NotesDAO;
import cdd.model.dto.NotesDTO;

@Service
public class NotesServiceImpl implements NotesService{

	@Autowired
	private NotesDAO notesdao = null;
	
	//일지 등록
	@Override
	public int insertNote(NotesDTO notesdto) throws Exception {
		// request 객체
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		// 세션 꺼내기
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("memId");
		notesdto.setUser_id(user_id);	// 세션아이디
		
		notesdto.setPet_num(1);		// 펫 고유번호 넘어올거임
		 
		int cnt = notesdao.insertNote(notesdto); 
		return cnt;
	}// insertNote
	
	
	
}//NoteServiceImpl
