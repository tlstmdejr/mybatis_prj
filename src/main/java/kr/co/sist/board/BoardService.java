package kr.co.sist.board;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

/**
 * 
 */
public class BoardService {
	private static BoardService bs;
	
	private BoardService() {
		
	}
	public static BoardService getInstance() {
		if(bs==null) {
			bs=new BoardService();
		}
		return bs;
	}
	
	/**
	 * 총게시물의 수
	 * @param rDTO
	 * @return
	 */
	public int totalCnt(RangeDTO rDTO) {
		int totalCnt=0;
		BoardDAO bDAO=BoardDAO.getInstance();
		
		try {
			totalCnt=bDAO.selectBoardTotalCnt(rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalCnt;
	}
	
	/**
	 * 한화면에 보여줄 페이지의 수
	 * @return
	 */
	public int pageScale() {
		
		return 10;
	}
	/**
	 * 총페이지수
	 * @param totalCount
	 * @param pageScale
	 * @return
	 */
	public int totalPage(int totalCount,int pageScale) {
		
	return	(int)Math.ceil((double)totalCount/pageScale);
	}
	
	/**
	 * 페이ㅣ 시작번호 구하기
	 * @param currentPage-현재 페이지
	 * @param pageScale-한 화면에 보여줄 페이지수
	 * @return
	 */
	public int startNum(int currentPage,int pageScale) {
		return currentPage * pageScale-pageScale+1;
	}//startNum
	
	/**
	 * 페이지 끝번호구하기
	 * @param startNum
	 * @param pageScale
	 * @return
	 */
	public int endNum(int startNum,int pageScale) {
		return startNum + pageScale-1;
	}//startNum
	
	public boolean addBoard(BoardDTO bDTO) {
		boolean flag=false;
		
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			bDAO.insertBoard(bDTO);
			flag=true;
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return flag;
	}
	
	public List<BoardDTO> searchBoardList(RangeDTO rDTO){
		List<BoardDTO> list=null;
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			list=bDAO.selectRangeBoard(rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 제목이 20자를 초과하면 19자까지 보여주고 뒤에 ...을 붙이는 일
	 * @param list
	 */
	public void titleSubStr(List<BoardDTO> board_list ) {
		String title="";
		for(BoardDTO bDTO: board_list){
		title=bDTO.getTitle();
		if(title.length() > 19){
			bDTO.setTitle(title.substring(0,20)+" ... ");
			}//end if
		}//end for
		
	}//titleSubStr
	
	/**
	 * 페이지네이션
	 * @param rDTO
	 * @return
	 */
	public String pagination(RangeDTO rDTO) {
		StringBuilder pagination=new StringBuilder();
		//1.한화면에 보여줄 pagination의수
		int pageNumber=3;
		//2.화면에 보여줄 시작 페이지번호설정 1,2,3,=>1로 4,5,6=>2
		int startPage=((rDTO.getCurrentPage()-1)/pageNumber)*pageNumber+1;
		//3. 화면에 보여줄마지막페이지 번호 1,2,3->3
		int endPage=(((startPage-1)+pageNumber)/pageNumber)*pageNumber;
		//4. 총페이지수가 연산된 마지막 페이지수 보다 작다면 총페이지수가 마지막페이지수로 설정
		//456인경우 4로 설정
		if(rDTO.getTotalPage()<= endPage) {
			endPage=rDTO.getTotalPage();
			
		}
		//5.첫페이지가 인덱스화면 (1페이지가)아닌경우
		int movePage=0;
		StringBuilder prevMark=new StringBuilder();
		prevMark.append("[&lt;&lt;]");
		//prevMark.append("<li class='page-item'><a class='page-link' href='#'>Previous</a></li>");
		if(rDTO.getCurrentPage()>pageNumber) {//시작페이지 번호가 3보다크면
			movePage=startPage-1;//456->3->1 789->6->4 
			prevMark.delete(0,prevMark.length());
			prevMark.append("[<a href='").append(rDTO.getUrl())
			.append("?currentPage=").append(movePage);
			if(rDTO.getKeyword() != null && rDTO.getKeyword().isEmpty()) {
				prevMark.append("&field=").append(rDTO.getField())
				.append("&keyword=").append(rDTO.getKeyword());
			}//end if
			prevMark.append("' class='prevMark'>&lt;&lt;</a> ]");
		}//endif
		StringBuilder pageLink=new StringBuilder();
		movePage= startPage;
		
		while(movePage <= endPage) {
			if(movePage==rDTO.getCurrentPage()) {//현재 페이지 :링크x
				pageLink.append("[ <span class='currentPage'>").append(movePage)
						.append("</span> ] ");
			}else {//현재 페이지가 아닌 다른 페이지 :링크 o
				pageLink.append("[ <a class='notCurrentPage' href='")
				.append(rDTO.getUrl()).append("?currentPage=").append(movePage);
				//검색키워드가 있다면 가져다 붙힌다
				if(rDTO.getKeyword() != null && rDTO.getKeyword().isEmpty()) {
					prevMark.append("&field=").append(rDTO.getField())
					.append("&keyword=").append(rDTO.getKeyword());
				}//end if
				pageLink.append("'>").append(movePage).append("</a> ]");
				
			}//else
			movePage++;
		}
		StringBuilder nextMark=new StringBuilder("[ &gt;&gt; ]");
		if( rDTO.getTotalPage() > endPage) {
			movePage=endPage+1;
			nextMark.delete(0, nextMark.length());
			nextMark.append("[ <a class='nextMark' href='")
			.append(rDTO.getUrl()).append("?currentPage=").append(movePage);
			//검색키워드가 있다면 가져다 붙힌다
			if(rDTO.getKeyword() != null && rDTO.getKeyword().isEmpty()) {
				nextMark.append("&field=").append(rDTO.getField())
				.append("&keyword=").append(rDTO.getKeyword());
			}//end if
			nextMark.append("'>&gt;&gt;</a> ]");
		}
		
		pagination.append(prevMark).append(" ... ").append(pageLink)
		.append(" ... ").append(nextMark);
		return pagination.toString();
		
	}
	
	
	
	
	
	public BoardDTO searchOneBoard(int num) {
		BoardDTO bDTO=null;
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			bDTO=bDAO.selectBoardDetail(num);
		} catch (SQLException se) {
			se.printStackTrace();
		}
		
		return bDTO;
	}
	public void modifyBoardCnt( int num ) {
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
		bDAO.updateBoardCnt(num);
		} catch (SQLException e) {
		e.printStackTrace();
		}//end catch
		}//searchOneBoard
	public boolean modifyBoard( BoardDTO bDTO ) {
		boolean flag=false;
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			flag=bDAO.updateBoard(bDTO)==1;
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return flag;
	}//searchOneBoard
	public boolean removeBoard( BoardDTO bDTO ) {
		boolean flag=false;
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			flag=bDAO.deleteBoard(bDTO)==1;
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return flag;
	}//searchOneBoard
	
}
//class
