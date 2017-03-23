package staff.sample.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import staff.sample.dto.StaffDTO;

@Repository("staffDAO")
public class StaffDAOImpl implements StaffDAO {
	// 로그 추가한거
	Logger log = Logger.getLogger(this.getClass());

	@Inject
	SqlSession sqlSession;

	@Override
	public StaffDTO staffDetail(int CNC_SEQ) {
		StaffDTO dto = null;
		try {
			dto = sqlSession.selectOne("staffDetail", CNC_SEQ);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<StaffDTO> staffList(int start, int end, String CNC_NAME) {
		List<StaffDTO> list = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("CNC_NAME", CNC_NAME);
			list = sqlSession.selectList("staffList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void staffUpdate(StaffDTO dto) {
		try {
			sqlSession.update("updateBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public StaffDTO deleteBoard(int CNC_SEQ) {
		StaffDTO dto = null;
		try {
			dto = sqlSession.selectOne("deleteBoard", CNC_SEQ);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void staffInsert(StaffDTO dto) {
		try {
			sqlSession.insert("insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int boardCount(String CNC_NAME) {
		int result = 0;
		try {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("CNC_NAME", CNC_NAME);
			result = sqlSession.selectOne("count", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}