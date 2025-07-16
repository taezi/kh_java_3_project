package service;

import java.util.Map;

import config.DBManager;
import dto.userDTO;
import mapper.userMapper;

public class UserService {
	private static UserService instance = new UserService();
	private userMapper mapper;

	public UserService() {
		mapper = DBManager.getInstance().getSession().getMapper(userMapper.class);
	}
	
	public static UserService getInstance() {
		if(instance == null) {
			instance = new UserService();
		}
		return instance;
	}

	public int registerInsert(userDTO dto) {
		return mapper.register(dto);
	}

	public userDTO userLogin(Map<String, Object> map) {
		return mapper.login(map);
	}

	public userDTO findById(String id) {
		return mapper.findID(id);
	}
	
	public userDTO searchId(Map<String, Object> map) {
		return mapper.searchId(map);
	}

	public userDTO searchPw(Map<String, Object> map) {
		return mapper.searchPw(map);
	}
	
}
