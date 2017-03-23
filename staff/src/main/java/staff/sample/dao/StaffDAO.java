package staff.sample.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import staff.sample.dto.StaffDTO;


@Repository("staffDAO")
public interface StaffDAO {
	//리스트 전체출력
	public List<StaffDTO> staffList(int start, int end, String CNC_NAME);
	//수정페이지 값넘기기
	public StaffDTO staffDetail(int CNC_SEQ);
	//수정
	public void staffUpdate(StaffDTO dto);
    //삭제
	public StaffDTO deleteBoard(int CNC_SEQ);
	//입력
	public void staffInsert(StaffDTO dto);
	//게시물 전체수
	public int boardCount(String CNC_NAME);
}
