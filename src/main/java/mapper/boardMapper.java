package mapper;

import java.util.ArrayList;
import java.util.List;

import dto.boardDTO;
import dto.movieDTO;

public interface boardMapper {

	ArrayList<boardDTO> AllBoard();
	int WriteBoard(boardDTO board);
	

}
