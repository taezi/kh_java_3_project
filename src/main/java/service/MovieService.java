package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import config.DBManager;
import dto.boardDTO;
import dto.movieCommentDTO;
import dto.movieDTO;
import mapper.movieMapper;

public class MovieService {
	private static MovieService instance = new MovieService();
	private movieMapper mapper;
	
	public MovieService() {
		mapper = DBManager.getInstance().getSession().getMapper(movieMapper.class);
	}
	
	public static MovieService getInstance() {
		if(instance == null) {
			instance = new MovieService();
		}
		return instance;
	}

	public ArrayList<movieDTO> AllMovie() {
		return mapper.AllMovie();
	}


	public List<movieDTO> selectMovieTopList(int i) {
		// TODO Auto-generated method stub
		return mapper.selectMovieTopList(i);
	}

	public List<movieDTO> searchMovie(String keyword) {
		return mapper.searchMovie(keyword);
	}

	public movieDTO movieInfo(String movieid) {
		return mapper.movieInfo(movieid);

	}

	public List<movieCommentDTO> movieComment(String movieid) {
		return mapper.movieCommentList(movieid);
	}

	public int insertComment(movieCommentDTO comment) {
		return mapper.movieCommentInsert(comment);
	}

	public int movieReportPlus(Map<String, String> map) {
		return mapper.movieReportAdd(map);
		
	}

	public List<movieCommentDTO> getReportList() {
		return mapper.reportList();
	}

	public int CommentMovieDelete(Map<String, Object> map) {
		return mapper.MovieCommentDelete(map);
	}

	
	
}
