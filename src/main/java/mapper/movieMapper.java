package mapper;

import java.util.ArrayList;
import java.util.List;

import dto.movieCommentDTO;
import dto.movieDTO;

public interface movieMapper {

	ArrayList<movieDTO> AllMovie();

	List<movieDTO> selectMovieTopList(int i);

	List<movieDTO> searchMovie(String keyword);

	movieDTO movieInfo(String movieid);

	List<movieCommentDTO> movieCommentList(String movieid);

	int movieCommentInsert(movieCommentDTO comment);

}
