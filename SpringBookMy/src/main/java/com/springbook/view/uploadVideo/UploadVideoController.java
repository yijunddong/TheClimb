package com.springbook.view.uploadVideo;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardService;
import com.springbook.biz.upload.UploadVideoVO;
import com.springbook.biz.upload.impl.UploadVideoService;

@Controller
public class UploadVideoController {
	@Autowired
	private UploadVideoService uploadVideoService;
	@Autowired
	private BoardService boardService;	
	
	 @RequestMapping(value="/insertUploadVideo.do")
	 public String insertBoard(UploadVideoVO vo, HttpSession session, HttpServletRequest request) throws IOException {
	     System.out.println("동영상 등록 처리");
	     MultipartFile uploadFile = vo.getUploadFile();
	     if (!uploadFile.isEmpty()) {
	         String id = (String) session.getAttribute("id");
	         String difficulty = vo.getDifficulty();
	         String branch = vo.getBranch();
	         vo.setId(id);     
	         String filePath1 = "/Users/idongjun/javastudy/spring/SpringBookMy12/src/main/webapp/resources/movie/"+difficulty+"/"+branch+"/";
	         String filePath = "/Users/idongjun/javastudy/spring/SpringBookMy12/src/main/webapp/resources/movie/";
		     vo.setFilePath(filePath1);	        
	         uploadVideoService.insertUploadVideo(vo);
	         int seq=vo.getSeq();
	         String fileName =seq+ ".mp4";
	         // 파일 업로드 처리
	         uploadFile.transferTo(new File(filePath + fileName));
	     } 	    
	     String referer = request.getHeader("Referer");       
         return  "redirect:" + referer;
	 }
	// 동영상 출력시키는 지점들 
	@RequestMapping("/grade.do")
	public String getBoard(UploadVideoVO vo, Model model,BoardVO bvo, HttpServletRequest request) {
		System.out.println("동영상 출력기능");
		System.out.println(vo);
		model.addAttribute("UploadVideoList", uploadVideoService.getUploadVideoList(vo));
		model.addAttribute("boardList", boardService.getRecentBoardList(bvo));
		return  "grade.jsp" ;
	}
	@RequestMapping("/branches.do")
	public String branches(UploadVideoVO vo, BoardVO bvo,Model model) {
		model.addAttribute("UploadVideoList", uploadVideoService.getUploadVideoList(vo));
		model.addAttribute("boardList", boardService.getRecentBoardList(bvo));
		return "branches.jsp";
	}
	@RequestMapping("/updateUploadVideo.do")
	public String updateUploadVideo(UploadVideoVO vo, HttpServletRequest request) {
		System.out.println("좋아요 기능");
		vo.getSeq();
		uploadVideoService.updateUploadVideo(vo);
		 String referer = request.getHeader("Referer");         
         return  "redirect:" + referer;
	}
}
