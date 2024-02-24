package com.springbook.biz.upload.impl;

import java.util.List;


import com.springbook.biz.upload.UploadVideoVO;


public interface UploadVideoService {

	// CRUD 기능의 메소드 구현
	// 글 등록	
	void insertUploadVideo(UploadVideoVO vo);

	// 글 수정
	void updateUploadVideo(UploadVideoVO vo);

	// 글 삭제
	void deleteUploadVideo(UploadVideoVO vo);

	// 글 상세 조회
	UploadVideoVO getUploadVideo(UploadVideoVO vo);
	
	// 좋아요 가장 많은 동영상 조회 
	UploadVideoVO getTopVideoByGood(UploadVideoVO vo);

	// 글 목록 조회
	List<UploadVideoVO> getUploadVideoList(UploadVideoVO vo);
	//동영상 난이도별 조
	

	List<UploadVideoVO> getUploadVideoListByBranch(UploadVideoVO vo);

}