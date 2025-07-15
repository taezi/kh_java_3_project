package mapper;

import java.util.Map;

import dto.userDTO;

public interface userMapper {

	int register(userDTO dto);

	userDTO login(Map<String, Object> map);

	userDTO findID(String id);
	
}
