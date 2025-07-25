package mapper;

import java.util.List;
import java.util.Map;

import dto.userDTO;

public interface userMapper {

	int register(userDTO dto);

	userDTO login(Map<String, Object> map);

	userDTO findID(String id);


	List<userDTO> AllUser();

	int deleteUser(String usersid);

	userDTO searchId(Map<String, Object> map);


	userDTO searchPw(Map<String, Object> map);

	boolean userPwUpdate(Map<String, Object> map);

	

	

	int updateNickname(userDTO userToUpdate);

	int checkNickname(String newNickname);


	
}
