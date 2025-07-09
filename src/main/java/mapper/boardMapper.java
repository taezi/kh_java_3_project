package mapper;

import java.util.ArrayList;

import dto.boardDTO;

public interface boardMapper {

	ArrayList<boardDTO> AllBoard();

	int WriteBoard(boardDTO board);


}
