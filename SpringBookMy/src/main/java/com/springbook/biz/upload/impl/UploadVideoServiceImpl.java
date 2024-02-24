package com.springbook.biz.upload.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.upload.UploadVideoVO;
import com.springbook.biz.user.UserVO;

@Service("uploadVideoService")
public class UploadVideoServiceImpl implements UploadVideoService
{
	@Autowired
	private UploadVideoDAOMybatis uploadVideoDAO;


	@Override
	public void updateUploadVideo(UploadVideoVO vo) {
		// TODO Auto-generated method stub
		uploadVideoDAO.updateUploadVideo(vo);
		
	}

	@Override
	public void deleteUploadVideo(UploadVideoVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UploadVideoVO getUploadVideo(UploadVideoVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UploadVideoVO> getUploadVideoList(UploadVideoVO vo) {
		return uploadVideoDAO.getUploadVideoList(vo);
		
	}

	@Override
	public void insertUploadVideo(UploadVideoVO vo) {
		uploadVideoDAO.insertUploadVideo(vo);
		
	}
	//	List<UploadVideoVO> getUploadVideoList(UploadVideoVO vo);
	@Override
	 public List<UploadVideoVO> getUploadVideoListByBranch(UploadVideoVO vo) {
	        return uploadVideoDAO.selectBranchUploadVideo(vo);
	    }

	@Override
	public UploadVideoVO getTopVideoByGood(UploadVideoVO vo) {
		return uploadVideoDAO.selectTopVideoByGood();
	}

	
	}
	
	
	


