package com.springbook.biz.user.impl;

import java.util.List;

import com.springbook.biz.user.UserVO;

public interface UserService {

	String getEmail(UserVO vo);
    String getPassword(UserVO vo);

    // CRUD 기능의 메소드 구현
    // 글 등록
    void insertUser(UserVO vo);

    // 글 수정
    void updateUser(UserVO vo);

    // 글 삭제
    void deleteUser(UserVO vo);

    // 글 상세 조회
    UserVO getUser(UserVO vo);

    // 글 목록 조회
    List<UserVO> getUserList(UserVO vo);

    // 비밀번호를 이메일로 전송하는 메서드
    void sendPasswordEmail(UserVO vo);
}
