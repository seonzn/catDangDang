package cdd.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportsDAOImpl implements ReportsDAO{
	@Autowired
	private SqlSession sqlSession = null;
	
	// 회원 목록가져오기 가져오기
	@Override
	public List getMemberList() throws Exception{
		
		List memberList = sqlSession.selectList("reports.memberList" ,null);
		return memberList;
	}
	
	// 회원 blocked
	@Override
	public void updateBlocked(String user_id, String blocked) throws Exception {
		Map map = new HashMap();
		map.put("id", user_id);
		map.put("blocked", blocked);
		sqlSession.update("reports.updateBlocked", map);
	}

	@Override
	public List getMemberReportList(String id) throws Exception {
		
		List memberReportList = sqlSession.selectList("reports.memberReportList", id);
		
		return memberReportList;
	}

	@Override
	public int getReportCount(String id) throws Exception {
		
		int count = sqlSession.selectOne("reports.getReportsCount", id);
		
		return count;
	}
	
	//전체 신고내역 조회
	@Override
	public List getReportList(String startNum, String endNum) throws Exception {
		Map args = new HashMap();
		args.put("startNum", startNum);
		args.put("endNum", endNum);
		List reportList = sqlSession.selectList("reports.getReportList", args);
		return reportList;
	}
	
	// 상태 업데이트
	@Override
	public void updateStatus(Integer reportNum, Integer status) throws Exception {
		Map args = new HashMap();
		args.put("reportNum", reportNum);
		args.put("status", status);
		sqlSession.update("reports.updateStatus", args);
	}
	
	// 상태 조회
	@Override
	public Integer getStatus(Integer reportNum) throws Exception {
		Integer state = sqlSession.selectOne("reports.getStatus", reportNum);
		return state;
	}
}
