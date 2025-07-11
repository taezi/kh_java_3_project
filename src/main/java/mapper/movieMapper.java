package mapper;

import java.util.ArrayList;
import java.util.List;

import dto.movieDTO;

public interface movieMapper {

	ArrayList<movieDTO> AllMovie();

	List<movieDTO> selectMovieTopList(int i);
	
}
