package vo;

public class PaggingVO {
	private int count;
	private int currentPage;
	private int pageOfContentCount;
	private final int PAGE_GROUP_OF_COUNT = 5;

	public PaggingVO(int count, int currentPage, int pageOfContentCount) {
		this.count = count;
		this.currentPage = currentPage;
		this.pageOfContentCount = pageOfContentCount;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public int getTotalPage() {
		return count / pageOfContentCount + (count % pageOfContentCount == 0 ? 0 : 1);
	}
	
	public int getTotalPageGroup() {
		return getTotalPage() / PAGE_GROUP_OF_COUNT + 
				(getTotalPage() % PAGE_GROUP_OF_COUNT == 0 ? 0 : 1);
	}
	
	public int getCurrentPageGroupNo() {
		return currentPage / PAGE_GROUP_OF_COUNT + 
				(currentPage % PAGE_GROUP_OF_COUNT == 0 ? 0 : 1);
	}
	
	public int getStartPageOfPageGroup() {
		return (getCurrentPageGroupNo() - 1) * PAGE_GROUP_OF_COUNT + 1;
	}
	
	public int getEndPageOfPageGroup() {
		int lastNo = getCurrentPageGroupNo() * PAGE_GROUP_OF_COUNT;
		if(lastNo > getTotalPage())
			lastNo = getTotalPage();
		return lastNo;
	}
	
	public boolean isPriviousPageGroup() {
		return getCurrentPageGroupNo() > 1;
	}
	
	public boolean isNextPageGroup() {
		return getCurrentPageGroupNo() < getTotalPageGroup();
	}

	@Override
	public String toString() {
		return "PaggingVO [count=" + count + ", currentPage=" + currentPage + ", pageOfContentCount="
				+ pageOfContentCount + ", PAGE_GROUP_OF_COUNT=" + PAGE_GROUP_OF_COUNT + ", getCurrentPage()="
				+ getCurrentPage() + ", getTotalPage()=" + getTotalPage() + ", getTotalPageGroup()="
				+ getTotalPageGroup() + ", getCurrentPageGroupNo()=" + getCurrentPageGroupNo()
				+ ", getStartPageOfPageGroup()=" + getStartPageOfPageGroup() + ", getEndPageOfPageGroup()="
				+ getEndPageOfPageGroup() + ", isPriviousPageGroup()=" + isPriviousPageGroup() + ", isNextPageGroup()="
				+ isNextPageGroup() + "]";
	}
}