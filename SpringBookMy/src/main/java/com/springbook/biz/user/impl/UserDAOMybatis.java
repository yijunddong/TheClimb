package com.springbook.biz.user.impl;

import java.util.List;
import com.springbook.biz.email.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.springbook.biz.user.UserVO;

@Repository
public class UserDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertUser(UserVO vo) {
		System.out.println("===> Mybatis로 insertUser() 회원가입 기능 처리");
		mybatis.insert("UserDAO.insertUser", vo);
	}
	public void updateUser(UserVO vo)
	{
		System.out.println("===> Mybatis로 updateUser()회원정보 수정  기능 처리");
		mybatis.update("UserDAO.updateUser", vo);
	}
	public void deleteUser(UserVO vo) {
		System.out.println("===> Mybatis로 회원탈퇴  기능 처리");
		mybatis.delete("UserDAO.deleteUser", vo);		
	}
	public UserVO getUser(UserVO vo) {
		System.out.println("===> Mybatis로 getUser() 로그인  기능 처리");
		return (UserVO)mybatis.selectOne("UserDAO.getUser", vo);	
	}

	public List<UserVO> getUserList(UserVO vo) {
		System.out.println("===> Mybatis로 getUserList() 기능 처리");
		return mybatis.selectList("UserDAO.getUserList", vo);	
	}
	  // 비밀번호 찾기를 위한 메서드 추가
	 public String getPassword(UserVO vo) {
	        System.out.println("===> Mybatis로 getPassword() 비밀번호 찾기 기능 처리");
	        String password = mybatis.selectOne("UserDAO.getPassword", vo);
	        String email=mybatis.selectOne("UserDAO.getEmail", vo);
	        if (password != null) {
	            // 비밀번호가 존재하는 경우 이메일로 전송
	            sendPasswordEmail(email, password);
	        }
	        return password;
	    }
	    
	    // 비밀번호를 이메일로 전송하는 메서드
	    private void sendPasswordEmail(String recipient, String password) {
	        System.out.println("===> 이메일로 비밀번호를 전송합니다.");
	        EmailSender.sendEmail(recipient, password);
	    }
		public String getEmail(UserVO vo) {
			 System.out.println("===> Mybatis로 getPassEmail() 이메일 찾기 기능 처리");
			 String email=mybatis.selectOne("UserDAO.getEmail", vo);
			 return email;
		}
}
