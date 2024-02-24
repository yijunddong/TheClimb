package com.springbook.biz.upload;

import org.springframework.web.multipart.MultipartFile;

public class UploadVideoVO {

	private int seq;
	private String id;
	private String title;
	private String filePath;
	private String uploadTime;
	private String branch;
	private String difficulty;
	private int good;

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	private MultipartFile uploadFile;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "UploadVideoVO [seq=" + seq + ", id=" + id + ", title=" + title + ", filePath=" + filePath
				+ ", uploadTime=" + uploadTime + ", branch=" + branch + ", difficulty=" + difficulty + ", good=" + good
				+ ", uploadFile=" + uploadFile + "]";
	}

	

}
