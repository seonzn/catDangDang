package cdd.model.dao;

import java.util.List;

public interface ReportsDAO {
	// 회원 목록가져오기
	public List getMemberList() throws Exception;
	
	// 회원 blocked
	public void updateBlocked(String id, String blocked) throws Exception;
	
	// 회원 1명에 대한 신고 목록 가져오기
	public List getMemberReportList(String id) throws Exception;

	// 회원 1명 신고 갯수 가져오기
	public int getReportCount(String id) throws Exception;
	
	// 전체 신고내역 조회
	public List getReportList(String startNum, String endNum) throws Exception;
	
	// 상태 업데이트
	public void updateStatus(Integer reportNum, Integer status) throws Exception;
	
	// 상태 조회
	public Integer getStatus(Integer reportNum) throws Exception;
}
