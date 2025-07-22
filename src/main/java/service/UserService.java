package service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

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


	public List<userDTO> getAllUsers() {
		return mapper.AllUser();
	}

	public int deleteUser(String usersid) {
		return mapper.deleteUser(usersid);
	}
	public userDTO searchId(Map<String, Object> map) {
		return mapper.searchId(map);
	}

	public userDTO searchPw(Map<String, Object> map) {
		return mapper.searchPw(map);
	}

	public boolean userPwUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.userPwUpdate(map);
	}


	public boolean isNicknameAvailable(String newNickname) {
        try (SqlSession session = DBManager.getInstance().getSession()) {
            userMapper mapper = session.getMapper(userMapper.class);
            return mapper.checkNickname(newNickname) == 0;
        } catch (Exception e) {
            System.err.println("Error checking nickname availability: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

	public int updateNickname(userDTO userToUpdate) {
        try (SqlSession session = DBManager.getInstance().getSession()) {
            userMapper mapper = session.getMapper(userMapper.class);
            return mapper.updateNickname(userToUpdate); 
        } catch (Exception e) {
            System.err.println("Error updating nickname: " + e.getMessage());
            e.printStackTrace();
            return 0;
        }
    }

	

	
}
