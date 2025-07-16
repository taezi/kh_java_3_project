package mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dto.boardCommentDTO;
import dto.boardDTO;
import dto.movieDTO;

public interface boardMapper {

	ArrayList<boardDTO> AllBoard(Map<String, Object> map); /* 0712 매개변수 추가함 */
	
	int SelectBoardTotalCount(); /* 0712 */
	
	int WriteBoard(boardDTO board);

	int UpdateBoardCount(int bno);

	boardDTO BoardView(int bno);

	List<boardCommentDTO> BoardCommentView(Map<String, Object> map);

	int selectBoardNo();

	int insertBoard(boardDTO board);


	int InsertBoardLike(Map<String, Object> map);

	int DeleteBoardLike(Map<String, Object> map);

	Map<String, Object> SelectBoardLikeHateCount(int bno);

	List<boardDTO> selectBoardTopList(int i);

	int BoardCommentInsert(boardCommentDTO comment);


	int InsertBoardCommentLike(Map<String, Object> map);

	int DeleteBoardCommentLike(Map<String, Object> map);

	Map<String, Object> SelectBoardCommentLikeHateCount(int bcno);

	

	int DeleteBoardComment(int bcno);

	int DeleteBoard(int bno);

	int BoardUpdate(Map<String, Object> map);

	int UpdateBoardComment(Map<String, Object> map);



}
