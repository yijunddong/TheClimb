package com.springbook.biz.board;
import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int seq;
	private String title;
	private String writer;
	private String content;
	private String category;
	private String difficulty;
	private String branch;
	private String idseq;
	private int cnt;
	private String searchCondition;
	private String searchKeyword;
	private MultipartFile uploadFile;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getIdseq() {
		return idseq;
	}

	public void setIdseq(String idseq) {
		this.idseq = idseq;
	}

	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", category=" + category + ", difficulty=" + difficulty + ", branch=" + branch + ", idseq=" + idseq
				+ ", cnt=" + cnt + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword
				+ ", uploadFile=" + uploadFile + "]";
	}





}