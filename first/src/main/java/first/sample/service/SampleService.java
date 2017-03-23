package first.sample.service;

import java.util.List;
import java.util.Map;

import first.sample.dto.EmployeesDTO;
import first.sample.dto.StaffDTO;

public interface SampleService {
	
//	비지니스로직의 수행을 위한 메서드정의
    
	//sample 입력 DTO
	void insertBoard(EmployeesDTO input) throws Exception;
	//sample 아이디/비번 확인 DTO
	int idcheck(EmployeesDTO input) throws Exception;
    //sample id 중복 확인
	int idconfirm(String id) throws Exception;
	//sample flag 승인
	int idagree(String ag) throws Exception;
	//staff 리스트 전체 출력
	List<Map<String, Object>> staffList(Map<String, Object> map) throws Exception;
	//staff 입력 DTO
	void intoBoard(StaffDTO into) throws Exception;
	
	
}
