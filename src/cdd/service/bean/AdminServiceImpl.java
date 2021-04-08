package cdd.service.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cdd.model.dao.PetDAO;
import cdd.model.dao.ReportsDAO;
import cdd.model.dto.ReportsDTO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private ReportsDAO reportsDAO = null;
	@Autowired
	private PetDAO petDAO = null;
	
	// 회원 목록 불러오기, 신고 내역가져오기
	@Override
	public List getMemberList() throws Exception {
		
		List memberList = reportsDAO.getMemberList();
		
		return memberList;
	}
	
	// 회원 blocked
	@Override
	public void updateBlocked(String user_id, String blocked) throws Exception {
		reportsDAO.updateBlocked(user_id, blocked);
	}

	@Override
	public List getMemberReportList(String id) throws Exception {
		
		System.out.println("피신고자 아이디 ser : "+ id);
		List memberReportList =  reportsDAO.getMemberReportList(id);
		/*for(int i=0; i<memberReportList.size(); i++) {
			ReportsDTO r = (ReportsDTO)memberReportList.get(i); 
			System.out.println(r.getReporterId());
		}*/
		return memberReportList;
	}

	@Override
	public int reportsCount(String id) throws Exception{
		
		int count = reportsDAO.getReportCount(id);
		
		return count;
	}
	
	// 전체 신고 내역 조회 [선준]
	@Override
	public List getReportList(String startNum, String endNum) throws Exception {
		if(startNum == null) {
			startNum = "1";
		}
		if(endNum == null) {
			endNum = "10";
		}
		List reportList = reportsDAO.getReportList(startNum, endNum);
		return reportList;
	}
	
	// 상태 업데이트
	@Override
	public Integer updateStatus(Integer reportNum, Integer status) throws Exception {
		reportsDAO.updateStatus(reportNum, status);
		Integer state = reportsDAO.getStatus(reportNum);
		return state;
	}
	
	// 펫 종류 가져오기
	@Override
	public List getPetTypes() throws Exception {
		List petTypes = petDAO.getPetTypes();
		return petTypes;
	}
	
	// 펫 종류 추가하기
	@Override
	public void addPetType(String petType) throws Exception {
		petDAO.insertPetType(petType);
	}
	
	// 펫 종류 삭제하기
	@Override
	public void removeType(Integer typeNum) throws Exception {
		petDAO.deletePetType(typeNum);
	}
	
	// 펫 품종 가져오기
	@Override
	public List getKindList(Integer typeNum) throws Exception {
		List kindList = petDAO.getKindList(typeNum);
		return kindList;
	}
	
	// 펫 품종 추가하기
	@Override
	public void addPetKind(String kindName, Integer typeNum) throws Exception {
		petDAO.insertPetKind(kindName, typeNum);
	}
	
	// 펫 품종 삭제하기
	@Override
	public void removeKind(Integer kindNum) throws Exception {
		petDAO.deletePetKind(kindNum);
	}
}
