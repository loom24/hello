package first.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;
import first.sample.dto.EmployeesDTO;
import first.sample.dto.StaffDTO;

@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{

    //sample 데이터 입력
	public void insertBoard(EmployeesDTO input) throws Exception{
		insert("sample.insertBoard", input);
	}
	//sample 입력시 아이디 중복 확인
	public int idconfirm(String id) throws Exception{
		return (Integer)selectOne("sample.idConfirm", id);
	}
    //sample 로그인 아이디/비번 확인
	public int idcheck(EmployeesDTO input) throws Exception{
		return (Integer)selectOne("sample.idCheck", input);
	}
	//sample flag 승인
	public int idagree(String ag) throws Exception{
		return (Integer)selectOne("sample.idAgree", ag);
	}
	//staff 리스트 전체 출력
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> staffList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("sample.staffList", map);
	}
	//staff 데이터 입력
	public void intoBoard(StaffDTO into) throws Exception{
		insert("sample.intoBoard", into);	
	}
	//staff 데이터 수정
//	public int updateBoard(StaffDTO update) throws Exception{
//		return (Integer)update("sample.updateBoard", update);
//	
//	}
	
//	@SuppressWarnings("unchecked")
//	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
//		return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);
//	}

}
