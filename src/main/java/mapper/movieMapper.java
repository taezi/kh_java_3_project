package mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dto.boardDTO;
import dto.movieCommentDTO;
import dto.movieDTO;

public interface movieMapper {

	ArrayList<movieDTO> AllMovie();

	List<movieDTO> selectMovieTopList(int i);

	List<movieDTO> searchMovie(String keyword);

	movieDTO movieInfo(String movieid);

	List<movieCommentDTO> movieCommentList(String movieid);

	int movieCommentInsert(movieCommentDTO comment);

	int movieReportAdd(Map<String, String> map);

	List<movieCommentDTO> reportList();

	int MovieCommentDelete(Map<String, Object> map);

}
