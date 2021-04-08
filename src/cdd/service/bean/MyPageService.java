package cdd.service.bean;

import java.util.List;
import java.util.Map;

public interface MyPageService {
	// 저장된 북마크 가져오기 [선준]
	public List getCollectionList(String memId) throws Exception;
	
	// 프로필 id, 게시물, 팔로워, 팔로워 수, 유저 이름, 소개글 가져오기 [선준]
	public Map getProfileIdInfo(String profileId) throws Exception;
	
	// 팔로워 리스트 가져오기
	public List getFollowerList(String userId) throws Exception;
	
	// 팔로우 리스트 가져오기
	public List getfollowList(String userId) throws Exception;
}
