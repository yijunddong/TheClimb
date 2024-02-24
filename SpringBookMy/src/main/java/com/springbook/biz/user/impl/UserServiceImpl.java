package com.springbook.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.springbook.biz.email.*;
import com.springbook.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService
{
@Autowired
private UserDAOMybatis userDAO;
	@Override
	public void insertUser(UserVO vo) {
		
		userDAO.insertUser(vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		userDAO.updateUser(vo);
		
	}

	@Override
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
		
	}

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}

	 @Override
	    public String getPassword(UserVO vo) {
	        return userDAO.getPassword(vo);
	    }

	    @Override
	    public void sendPasswordEmail(UserVO vo) {
	        String recipient = vo.getEmail(); // 사용자 이메일 주소
	        String password = getPassword(vo); // 사용자의 비밀번호

	        // 이메일 보내는 코드 호출
	        EmailSender.sendEmail(recipient, password);
	    }

		@Override
		public String getEmail(UserVO vo) {
			return userDAO.getEmail(vo);
		}

	
	

}
