package com.springbook.view.board;


import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	
	//게시판 글 입력 
	  @RequestMapping(value="/mainInsertBoard.do")
			public String insertBoard(BoardVO vo) throws IOException {
				System.out.println("글 등록 처리");
				// 파일 업로드 처리

				boardService.insertBoard(vo);
				return "mainBoardList.do";
			}
	
	// 글 수정
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		System.out.println("글 수정 처리");
		
		boardService.updateBoard(vo);
		return "mainBoardList.do";
	}
	
	// 글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		System.out.println("글 삭제 처리");
		
		boardService.deleteBoard(vo);
		return "mainBoardList.do";
	}
	
	// 글 상세 조회
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		System.out.println("글 상세 조회 처리");
		
		model.addAttribute("board", boardService.getBoard(vo));		// Model 정보 저장
		return "getBoard.jsp";		// View 이름 리턴
	}	
	
	// 글 목록 검색
	@RequestMapping("/mainBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {
		System.out.println("글 목록 검색 처리");
		
		
		model.addAttribute("boardList", boardService.getBoardList(vo));		// Model 정보 저장 
    	return "mainBoardList.jsp";							
	}
}