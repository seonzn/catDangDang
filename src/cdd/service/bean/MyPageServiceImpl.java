package cdd.service.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cdd.model.dao.CollectionDAO;
import cdd.model.dao.FeedsDAO;
import cdd.model.dao.FollowsDAO;
import cdd.model.dao.UserDAO;
import cdd.model.dto.FeedsDTO;
import cdd.model.dto.UserDTO;

@Service
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private CollectionDAO collectionDAO = null;
	@Autowired
	private FeedsDAO feedsDAO = null;
	@Autowired 
	private UserDAO userDAO = null;
	@Autowired
	private FollowsDAO followsDAO = null;
	// 저장된 북마크 가져오기 [선준]
	@Override
	public List getCollectionList(String memId) throws Exception {
		List collections = collectionDAO.getCollectionFeedNum(memId);
		List collectionList = feedsDAO.getCollectionList(collections);
		
		return collectionList;
	}
	
	// 프로필 id, 유저 이름, 소개글, 게시물, 팔로워, 팔로워 수 가져오기 [선준]
	@Override
	public Map getProfileIdInfo(String profileId) throws Exception {
		Map profileidInfo = new HashMap();
		Integer feedCnt = 0;
		Integer flwCnt = 0;
		Integer flwerCnt = 0;
		if(profileId == null) {
			profileId = getSessionId();
			UserDTO userInfo = userDAO.getMember(profileId);
			feedCnt = feedsDAO.getFeedCnt(profileId);
			flwCnt = followsDAO.getFlwCnt(profileId);
			flwerCnt = followsDAO.getFlwerCnt(profileId);
			
			profileidInfo.put("userInfo", userInfo);
			profileidInfo.put("feedCnt", feedCnt);
			profileidInfo.put("flwCnt", flwCnt);
			profileidInfo.put("flwerCnt", flwerCnt);
		}else {
			UserDTO userInfo = userDAO.getMember(profileId);
			feedCnt = feedsDAO.getFeedCnt(profileId);
			flwCnt = followsDAO.getFlwCnt(profileId);
			flwerCnt = followsDAO.getFlwerCnt(profileId);
			Integer flwCh = followsDAO.followCheck(profileId, getSessionId());
			
			profileidInfo.put("userInfo", userInfo);
			profileidInfo.put("feedCnt", feedCnt);
			profileidInfo.put("flwCnt", flwCnt);
			profileidInfo.put("flwerCnt", flwerCnt);
			profileidInfo.put("flwCh", flwCh);
		}
		return profileidInfo;
	}
	
	public String getSessionId() {
		HttpSession session = (((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest()).getSession();
		return (String)session.getAttribute("memId");
	}
	
	// 팔로워 리스트 가져오기
	@Override
	public List getFollowerList(String userId) throws Exception {
		List followerList = followsDAO.getFollowerList(userId);
		return followerList;
	}
	
	// 팔로우 리스트 가져오기
	@Override
	public List getfollowList(String userId) throws Exception {
		List followList = followsDAO.getFollowList(userId);
		return followList;
	}
}
