package service;

import java.util.ArrayList;

import config.DBManager;
import dto.boardDTO;
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

	public ArrayList<boardDTO> AllBoard() {
		return mapper.AllBoard();
	}
	
}
