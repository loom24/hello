package first.sample.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.sample.dao.SampleDAO;
import first.sample.dto.EmployeesDTO;
import first.sample.dto.StaffDTO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO;
	
	@Override
	public void insertBoard(EmployeesDTO input) throws Exception {
		sampleDAO.insertBoard(input);
	}

	@Override
	public int idcheck(EmployeesDTO input) throws Exception {
		return sampleDAO.idcheck(input);
	}

	@Override
	public int idconfirm(String id) throws Exception {
		return sampleDAO.idconfirm(id);
	}
	
	@Override
	public int idagree(String ag) throws Exception {
		return sampleDAO.idagree(ag);
	}
	
	@Override
	public List<Map<String, Object>> staffList(Map<String, Object> map) throws Exception {
		return sampleDAO.staffList(map);
	}

	@Override
	public void intoBoard(StaffDTO into) throws Exception {
		sampleDAO.intoBoard(into);
		
	}
}
