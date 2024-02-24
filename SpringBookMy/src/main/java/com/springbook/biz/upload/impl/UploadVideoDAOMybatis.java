package com.springbook.biz.upload.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.upload.UploadVideoVO;
import com.springbook.biz.user.UserVO;
@Repository
public class UploadVideoDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertUploadVideo(UploadVideoVO vo)
	{
		System.out.println("===> Mybatis로 insertUser() 동영상업로드 기능 처리");
		mybatis.insert("UploadVideoDAO.insertUploadVideo", vo);
	}
	public List<UploadVideoVO> getUploadVideoList(UploadVideoVO vo) {
		System.out.println("===> Mybatis로 getUserList() 동영상 출력 기능 처리");
		return mybatis.selectList("UploadVideoDAO.getUploadVideoList", vo);	
	}

	 
	 public List<UploadVideoVO> selectBranchUploadVideo(UploadVideoVO vo) {
	        System.out.println("===> Mybatis로 selectBranchUploadVideo() 난이도  검색  기능 처리");
	        return mybatis.selectList("UploadVideoDAO.selectBranchUploadVideo", vo);
	    }
	 
	 
	 
	 public void updateUploadVideo(UploadVideoVO vo)
	 {
		 System.out.println("===> Mybatis로 updateUploadVide() 좋아요  기능 처리");
			mybatis.update("UploadVideoDAO.updateUploadVideo", vo);
	 }
	 
	 // 좋아요 가장 높은 영상 
	    public UploadVideoVO selectTopVideoByGood() {
	        System.out.println("===> Mybatis로 selectTopVideoByGood() 동영상 조회 기능 처리");
	        return mybatis.selectOne("UploadVideoDAO.selectGoodUploadVideo");
	    }


}
