package cdd.model.dao;

import java.sql.SQLException;


import cdd.model.dto.NotesDTO;


public interface NotesDAO {
		
	//일지 등록
	public int insertNote(NotesDTO notedto) throws SQLException;
	
	// 해당 일지 가져오기
	// 해당 일지 수정
	// 해당 일지 삭제
	
}//NoteDAO
