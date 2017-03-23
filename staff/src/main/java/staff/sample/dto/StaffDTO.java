package staff.sample.dto;

import java.sql.Date;

public class StaffDTO {
	
    private int ROWNUM;

	private int CNC_IDX;
	private String CNC_NAME;
	private String CNC_GEN;
	private String CNC_TYPE;
	private String CNC_DATE;
	private String CNC_GRADE;
	private String CNC_SKILL;
	private int CNC_JOMIN1;
	private int CNC_JOMIN2;
	private int CNC_SEQ;
    //Í∏∞Î≥∏?Éù?Ñ±?ûê
	public StaffDTO() {
		// TODO Auto-generated constructor stub
	}
	//?ûÖ?†•?Éù?Ñ±?ûê
	public int getROWNUM() {
		return ROWNUM;
	}
	
	public void setROWNUM(int rOWNUM) {
		ROWNUM = rOWNUM;
	}
	
	public int getCNC_SEQ() {
		return CNC_SEQ;
	}
	public StaffDTO(int cNC_IDX, String cNC_NAME, String cNC_GEN, String cNC_TYPE, String cNC_DATE, String cNC_GRADE,
			String cNC_SKILL, int cNC_JOMIN1, int cNC_JOMIN2, int cNC_SEQ) {
		super();
		CNC_IDX = cNC_IDX;
		CNC_NAME = cNC_NAME;
		CNC_GEN = cNC_GEN;
		CNC_TYPE = cNC_TYPE;
		CNC_DATE = cNC_DATE;
		CNC_GRADE = cNC_GRADE;
		CNC_SKILL = cNC_SKILL;
		CNC_JOMIN1 = cNC_JOMIN1;
		CNC_JOMIN2 = cNC_JOMIN2;
		CNC_SEQ = cNC_SEQ;
	}
	//getter, setter
	public void setCNC_SEQ(int cNC_SEQ) {
		CNC_SEQ = cNC_SEQ;
	}
	public int getCNC_JOMIN1() {
		return CNC_JOMIN1;
	}
	public void setCNC_JOMIN1(int cNC_JOMIN1) {
		CNC_JOMIN1 = cNC_JOMIN1;
	}
	public int getCNC_JOMIN2() {
		return CNC_JOMIN2;
	}
	public void setCNC_JOMIN2(int cNC_JOMIN2) {
		CNC_JOMIN2 = cNC_JOMIN2;
	}

	public int getCNC_IDX() {
		return CNC_IDX;
	}
	public void setCNC_IDX(int cNC_IDX) {
		CNC_IDX = cNC_IDX;
	}
	public String getCNC_NAME() {
		return CNC_NAME;
	}
	public void setCNC_NAME(String cNC_NAME) {
		CNC_NAME = cNC_NAME;
	}
	public String getCNC_GEN() {
		return CNC_GEN;
	}
	public void setCNC_GEN(String cNC_GEN) {
		CNC_GEN = cNC_GEN;
	}
	public String getCNC_TYPE() {
		return CNC_TYPE;
	}
	public void setCNC_TYPE(String cNC_TYPE) {
		CNC_TYPE = cNC_TYPE;
	}
	public String getCNC_DATE() {
		return CNC_DATE;
	}
	public void setCNC_DATE(String cNC_DATE) {
		CNC_DATE = cNC_DATE;
	}
	public String getCNC_GRADE() {
		return CNC_GRADE;
	}
	public void setCNC_GRADE(String cNC_GRADE) {
		CNC_GRADE = cNC_GRADE;
	}
	public String getCNC_SKILL() {
		return CNC_SKILL;
	}
	public void setCNC_SKILL(String cNC_SKILL) {
		CNC_SKILL = cNC_SKILL;
	}
	//tostring

	@Override
	public String toString() {
		return "StaffDTO [CNC_IDX=" + CNC_IDX + ", CNC_NAME=" + CNC_NAME + ", CNC_GEN=" + CNC_GEN + ", CNC_TYPE="
				+ CNC_TYPE + ", CNC_DATE=" + CNC_DATE + ", CNC_GRADE=" + CNC_GRADE + ", CNC_SKILL=" + CNC_SKILL
				+ ", CNC_JOMIN1=" + CNC_JOMIN1 + ", CNC_JOMIN2=" + CNC_JOMIN2 + ", CNC_SEQ=" + CNC_SEQ + "]";
	}
	

}
