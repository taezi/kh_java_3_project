package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import config.DBManager;
import dto.boardCommentDTO;
import dto.boardDTO;
import dto.movieDTO;
import mapper.boardMapper;

public class BoardService {
	private static BoardService instance = new BoardService();
	private boardMapper mapper;
	
	public BoardService() {
		mapper = DBManager.getInstance().getSession().getMapper(boardMapper.class);
	}
	
	public static BoardService getInstance() {
		if(instance == null) {
			instance = new BoardService();
		}
		return instance;
	}

	public ArrayList<boardDTO> AllBoard(int pageNo, int pageContentEa) { /* 0712 매개변수, map만드는코드들 추가함 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("pageContentEa", pageContentEa);
		
		return mapper.AllBoard(map);
	}

	public int SelectBoardTotalCount() { /* 0712 */
		return mapper.SelectBoardTotalCount();
	}
	
	public int SelectBoardTotalCount(String query) { //0717 게시글 제목 검색 기능 추가때매, 메서드오버로딩
		if(query == null || query.trim().isEmpty()) {
			return mapper.SelectBoardTotalCount();
		}
		return mapper.SelectBoardTotalCountByTitle("%" + query + "%");
	}
	
	public ArrayList<boardDTO> AllBoard(int pageNo, int pageContentEa, String query) { //0717 게시글 제목 검색 기능 추가때매, 메서드오버로딩
		Map<String, Object> map = new HashMap<>();
		map.put("pageNo", pageNo);
		map.put("pageContentEa", pageContentEa);
		map.put("query", "%" + (query == null ? "" : query) + "%");

		if(query == null || query.trim().isEmpty()) {
			return mapper.AllBoard(map);
		} else {
			return mapper.SearchBoardByTitle(map);
		}
	}
	
	public int UpdateBoardCount(int bno) {
		return mapper.UpdateBoardCount(bno);
	}

	public boardDTO BoardView(int bno) {
		// TODO Auto-generated method stub
		return mapper.BoardView(bno);
	}

	public List<boardCommentDTO> BoardCommentView(int bno, int i) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("page", i);
		return mapper.BoardCommentView(map);
	}

	public int selectBoardNo() {
		// TODO Auto-generated method stub
		return mapper.selectBoardNo();
	}

	public int insertBoard(boardDTO board) {
		// TODO Auto-generated method stub
		return mapper.insertBoard(board);
	}


	public int InsertBoardLike(int bno, String usersid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("usersid", usersid);
		return mapper.InsertBoardLike(map);
	}

	public int DeleteBoardLike(int bno, String usersid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("usersid", usersid);
		return mapper.DeleteBoardLike(map);		
	}

	public Map<String, Object> SelectBoardLikeHateCount(int bno) {
		return mapper.SelectBoardLikeHateCount(bno);
	}

	public List<boardDTO> selectBoardTopList(int i) {
		// TODO Auto-generated method stub
		return mapper.selectBoardTopList(i);

	}

	public int BoardCommentInsert(boardCommentDTO comment) {
		return mapper.BoardCommentInsert(comment);
	}



	public int InsertBoardCommentLike(int bcno, int bno, String usersid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bcno", bcno);
		map.put("bno", bno);
		map.put("usersid", usersid);
		return mapper.InsertBoardCommentLike(map);
	}

	public int DeleteBoardCommentLike(int bcno, String usersid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bcno", bcno);
		map.put("usersid", usersid);
		return mapper.DeleteBoardCommentLike(map);
	}

	public Map<String, Object> SelectBoardCommentLikeHateCount(int bcno) {
		// TODO Auto-generated method stub
		return mapper.SelectBoardCommentLikeHateCount(bcno);
	}

	

	public int DeleteBoardComment(int bcno) {
		return mapper.DeleteBoardComment(bcno);
		
	}

	public int DeleteBoard(int bno) {
		return mapper.DeleteBoard(bno);
		
	}


	public int BoardUpdate(int bno, String titles, String bpost) {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("titles", titles);
		map.put("bpost", bpost);
		return mapper.BoardUpdate(map);
	}

	public int UpdateBoardComment(int bcno, String bcpost) {
		Map<String, Object> map = new HashMap<>();
		map.put("bcno", bcno);
		map.put("bcpost", bcpost);
		return mapper.UpdateBoardComment(map);
	}

	public int boardReportPlus(Map<String, Object> map) {
		return mapper.reportBoardPlus(map);
		
	}

	public List<boardCommentDTO> getReport() {
		return mapper.getReport();
	}

	public int AdminBoardDelete(Map<String, Object> map) {
		return mapper.AdminBoardDelete(map);

	}

	
	
}
