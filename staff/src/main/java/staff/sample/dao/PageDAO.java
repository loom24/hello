package staff.sample.dao;

public class PageDAO {
	
	public static final int PAGE_SCALE=10; //�������� �Խù���
	public static final int BLOCK_SCALE=5; //��ϴ� ��������
	
	private int curPage; //���� ������ ��ȣ
	private int prevPage; //����������
	private int nextPage; //����������
	private int totPage; //��ü������
	private int curBlock; //���������� ��� ��ȣ
	private int totBlock; //��ü������ ��� ��
	private int pageBegin; //������ �������� ���ڵ� ���� ��ȣ
	private int pageEnd; //������ �������� ���ڵ� ������ ��ȣ
	private int blockStart; //������ ��� �������� ���� ������ ��ȣ
	private int blockEnd; //������ ��� �������� ������ ������ ��ȣ
//������
	public PageDAO(int count, int curPage){
		curBlock = 1; //���� ������ ����� 1�� ����
		this.curPage = curPage; //���� ������ ��ȣ�� ����
		setTotPage(count); //��ü������ �� ����
		setPageRange(); //������������ ���۹�ȣ
		setTotBlock(); //��ü ������ ��� �� ���
		setBlockRange(); //���� ������ ����� ����������, �������� ��ȣ���
		
	}
	public void setBlockRange(){
		//������������ ���° ��Ͽ� ���ϴ��� ���
		curBlock = (int)Math.ceil((curPage-1)/BLOCK_SCALE)+1;
		blockStart = (curBlock-1)*BLOCK_SCALE+1; //���۹�ȣ
		blockEnd = blockStart + BLOCK_SCALE-1; //����ȣ
		if(blockEnd>totPage){ //������ �������� ������ �ʰ��� ���
			blockEnd = totPage;
			
		}
		//���� ����� 1�̸� ���� �������� 1�� ����
		prevPage = curBlock ==1?1:(curBlock-1)*BLOCK_SCALE;
		//�������� ������ ����̸� ���� �������� ������ ������ ��ȣ�� ����
		nextPage = curBlock > totBlock ? (curBlock*BLOCK_SCALE) : (curBlock * BLOCK_SCALE)+1;
		//������ �������� ������ �ʰ����� �ʵ��� ó��
		if(nextPage>=totPage){
			nextPage = totPage;
		}
		
	}
	
	
	public void setTotBlock(){
		totBlock = (int)Math.ceil(totPage / BLOCK_SCALE); 
		
	}
	
    public void setPageRange(){
    	//���� �������� ���� ��ȣ, ����ȣ ���
    	pageBegin = (curPage -1) * PAGE_SCALE+1;
    	pageEnd = pageBegin + PAGE_SCALE-1;
    	
    }
	
	
//	getter/setter

	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int count) {
		//math.ceil (����) => �Ҽ��ø�ó��, 5.1 =>6
       totPage = (int)Math.ceil(count * 1.0 / PAGE_SCALE);
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getTotBlock() {
		return totBlock;
	}
	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}
	public int getPageBegin() {
		return pageBegin;
	}
	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	public int getBlockStart() {
		return blockStart;
	}
	public void setBlockStart(int blockStart) {
		this.blockStart = blockStart;
	}
	public int getBlockEnd() {
		return blockEnd;
	}
	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

}
