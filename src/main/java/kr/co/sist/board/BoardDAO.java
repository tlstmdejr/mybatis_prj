package kr.co.sist.board;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisHandler;


public class BoardDAO {
	private static BoardDAO bDAO;

	private BoardDAO() {
	}// BoardDAO

	public static BoardDAO getInstance() {
		if (bDAO == null) {
			bDAO = new BoardDAO();
		} // end if
		return bDAO;
	}// getInstance

	public int selectBoardTotalCnt(RangeDTO rDTO) throws SQLException {
	      int totalCnt = 0;
	      SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(false);
	      totalCnt=ss.selectOne("kr.co.sist.board.selectBoardTotalCnt",rDTO);
	      if(ss!=null) {
	    	  ss.close();
	      }
	      return totalCnt;
	   }// selectId

	public List<BoardDomain> selectRangeBoard(RangeDTO rDTO) throws SQLException {
		List<BoardDomain> list = null;
		 SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(false);
	      list=ss.selectList("kr.co.sist.board.selectRangeBoard",rDTO);
	      if(ss!=null) {
	    	  ss.close();
	      }

		return list;
	}

	public void insertBoard(BoardDomain bDTO) throws PersistenceException {
		//1.mybatis handler얻기
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(true);
		//2.쿼리문수행후 결과얻기
		ss.insert("kr.co.sist.board.insertBoard",bDTO);
		//3.결과 작업
		//4.연결끊기
		if(ss!=null) {ss.close();}

	}

	public BoardDomain selectBoardDetail(int num) throws SQLException {
		BoardDomain bDTO = null; // 리턴할 객체 선언

//		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			con = dbCon.getConn();
//			StringBuilder selectDetail = new StringBuilder();
//			selectDetail.append(" select title, content, input_date, ip, cnt, id ")
//					    .append(" FROM BOARD ")
//					    .append(" WHERE NUM = ? ");
//
//			pstmt = con.prepareStatement(selectDetail.toString());
//			// [수정됨] 매개변수로 받은 num 바인딩
//			pstmt.setInt(1, num);
//			
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				bDTO = new BoardDTO();
//				bDTO.setNum(num); // 조회된 번호 세팅
//				bDTO.setTitle(rs.getString("title"));
//				bDTO.setInput_date(rs.getDate("input_date"));
//				bDTO.setIp(rs.getString("ip"));
//				bDTO.setCnt(rs.getInt("cnt")); // getString -> getInt로 변경 권장
//				bDTO.setId(rs.getString("id"));
//
//				// CLOB 데이터 처리 (content)
//				BufferedReader br = null;
//				StringBuilder content = new StringBuilder();
//				try {
//					// content 컬럼이 null이 아닐 때만 읽기 시도
//					if (rs.getClob("content") != null) {
//						br = new BufferedReader(rs.getClob("content").getCharacterStream());
//						String readLine = "";
//						while ((readLine = br.readLine()) != null) {
//							content.append(readLine).append("\n"); // 줄바꿈 유지
//						}
//					}
//					
//				} catch (IOException ie) {
//					ie.printStackTrace();
//				}catch(NullPointerException npe) {
//						npe.printStackTrace();
//			}finally {
//					if (br != null) {
//						try { br.close(); } catch (IOException e) {}
//					}
//				}
//				
//				bDTO.setContent(content.toString());
//			} // end if
//		} finally {
//			dbCon.dbClose(rs, pstmt, con);
//		}
		
		return bDTO; // [수정됨] 조회된 객체 반환
	}
	public void updateBoardCnt(int num) throws SQLException {
		BoardDomain bDTO = null; // 리턴할 객체 선언
//		
//		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			con = dbCon.getConn();
//			StringBuilder updateCnt = new StringBuilder();
//			updateCnt.append(" update board")
//			.append(" set cnt=cnt+1")
//			.append(" WHERE NUM = ? ");
//			
//			pstmt = con.prepareStatement(updateCnt.toString());
//			// [수정됨] 매개변수로 받은 num 바인딩
//			pstmt.setInt(1, num);
//			pstmt.executeUpdate();
//			
//		} finally {
//			dbCon.dbClose(null, pstmt, con);
//		}	
	return; // [수정됨] 조회된 객체 반환
	}
	public int updateBoard(BoardDomain bDTO) throws SQLException {
		int cnt=0;
//		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//			// 1.JNDI사용객체 생성
//			// 2.DataSource 얻기
//			// 3.DataSource에서 Connection얻기
//			con = dbCon.getConn();
//			// 4.쿼리문생성객체 얻기
//			StringBuilder updateBoard = new StringBuilder();
//			updateBoard
//			.append(" 	update board 	")
//			.append("	set content=?,ip=? ")
//			.append(" 	where num=? and id=?	");
//			
//			pstmt = con.prepareStatement(updateBoard.toString());
//			// 5.바인드변수 값 설정
//			pstmt.setString(1, bDTO.getContent());
//			pstmt.setString(2, bDTO.getIp());
//			pstmt.setInt(3, bDTO.getNum());
//			pstmt.setString(4, bDTO.getId());
//			// 6.뭐리문 수행후 결과 얻기
//			cnt=pstmt.executeUpdate();
//		} finally {
//			// 7.연결끊기
//			dbCon.dbClose(null, pstmt, con);
//		}
		return cnt;
	}
	public int deleteBoard(BoardDomain bDTO) throws SQLException {
		int cnt=0;
//		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			// 1.JNDI사용객체 생성
//			// 2.DataSource 얻기
//			// 3.DataSource에서 Connection얻기
//			con = dbCon.getConn();
//			// 4.쿼리문생성객체 얻기
//			StringBuilder deleteBoard = new StringBuilder();
//			deleteBoard
//			.append(" 	delete from board 	")
//			.append(" 	where num=?	and id=? ");
//			
//			pstmt = con.prepareStatement(deleteBoard.toString());
//			// 5.바인드변수 값 설정
//			pstmt.setInt(1, bDTO.getNum());
//			System.out.println(bDTO.getNum());
//			pstmt.setString(2, bDTO.getId());
//			// 6.뭐리문 수행후 결과 얻기
//			cnt=pstmt.executeUpdate();
//		} finally {
//			// 7.연결끊기
//			dbCon.dbClose(null, pstmt, con);
//		}
//		System.out.println("결과값" + cnt);
		return cnt;	
	}

	
}

//class
