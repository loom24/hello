package staff.sample.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import staff.sample.dto.StaffDTO;


@Repository("staffDAO")
public interface StaffDAO {
	//����Ʈ ��ü���
	public List<StaffDTO> staffList(int start, int end, String CNC_NAME);
	//���������� ���ѱ��
	public StaffDTO staffDetail(int CNC_SEQ);
	//����
	public void staffUpdate(StaffDTO dto);
    //����
	public StaffDTO deleteBoard(int CNC_SEQ);
	//�Է�
	public void staffInsert(StaffDTO dto);
	//�Խù� ��ü��
	public int boardCount(String CNC_NAME);
}
