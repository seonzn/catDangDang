package cdd.model.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cdd.model.dto.NotesDTO;

@Repository
public class NotesDAOImpl implements NotesDAO{
 
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public int insertNote(NotesDTO notesdto) throws SQLException {
		 int cnt = sqlSession.insert("myPage.insertNote", notesdto); 
		 return cnt;
		 
	}//insertNote
	
}//NoteDAOImpl
