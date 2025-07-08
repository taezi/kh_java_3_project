package service;

import java.util.ArrayList;

import config.DBManager;
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
	
	
}
