package com.springbook.view.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardService;
import com.springbook.biz.email.EmailSender;
import com.springbook.biz.upload.UploadVideoVO;

import com.springbook.biz.upload.impl.UploadVideoService;
import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAOMybatis;
import com.springbook.biz.user.impl.UserService;


@Controller
public class UserController {
    @Autowired
    private UserDAOMybatis userDAO;

	@Autowired
	private BoardService boardService;
	@Autowired
	private UploadVideoService uploadVideoService;


	

    @RequestMapping(value = "/searchPass.do", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String searchPassword(UserVO vo) {
        System.out.println("비밀번호 찾기 처리 ");
        
        String foundPassword = userDAO.getPassword(vo);
        String email=userDAO.getEmail(vo);
        System.out.println(foundPassword+email);
        
        if (foundPassword != null) {
           
            return foundPassword;
        } else {
            // 사용자를 찾을 수 없을 때 빈 문자열을 반환합니다.
            return "";
        }
    } 

//	@RequestMapping(value = "/searchPass.do")
//    public String searchPassword(UserVO vo,HttpServletRequest request,Model model) {
//        System.out.println("비밀번호 찾기 처리 시작, 이메일로 보내기전  ");
//        userDAO.getPassword(vo);
//       String password=userDAO.getPassword(vo);
//       System.out.println(password);
//       if (password != null) {
//           model.addAttribute("result", "success");
//           model.addAttribute("password", password); 
//       } else {
//           // 해당하는 계정이 없음을 알림
//           model.addAttribute("result", "fail");
//       }

//        
//        String referer = request.getHeader("Referer");     
//        return  "redirect:" + referer;
//    }

	   

    
	    @RequestMapping(value="/insertBoard.do")
		public String insertBoard(BoardVO vo) throws IOException {
			System.out.println("글 등록 처리");
			// 파일 업로드 처리

			boardService.insertBoard(vo);
			return "projectOpen.do";
		}
	    
	    @RequestMapping(value="/insertBoardGrade.do")
	  		public String insertBoardGrade(BoardVO vo, HttpServletRequest request) throws IOException {
	  			System.out.println("글 등록 처리");
	  			// 파일 업로드 처리

	  			boardService.insertBoard(vo);
	  		  String referer = request.getHeader("Referer");
	            
	            return  "redirect:" + referer;
	  		}
	    @RequestMapping(value="/insertBoardhongdae.do")
  		public String insertBoardhongdae(BoardVO vo) throws IOException {
  			System.out.println("글 등록 처리");
  			// 파일 업로드 처리

  			boardService.insertBoard(vo);
  			return "redirect:/hongdae.do";
  		}
	   

	    @RequestMapping(value = "/insertUser.do")
	    public String insertUser(UserVO vo,  HttpServletRequest request)  {
	        System.out.println("회원가입 처리 ");
	        userDAO.insertUser(vo);
	        String referer = request.getHeader("Referer");
            
            return  "redirect:" + referer;
	    }
	
        //프로젝트오픈만 
	    @RequestMapping(value = "/projectOpen.do")
	    public String projectOpen(BoardVO vo,Model model, UploadVideoVO uvo) {
	    	System.out.println("글 목록 검색 처리");
	    	
	    	model.addAttribute("goodUpload",uploadVideoService.getTopVideoByGood(uvo));
	    	model.addAttribute("UploadVideoList", uploadVideoService.getUploadVideoList(uvo));
	    	model.addAttribute("boardList", boardService.getRecentBoardList(vo));

        return "projectOpen.jsp";
    }


	    @RequestMapping(value = "/loginOk.do")
	    public String loginOk(UserVO vo, HttpSession session,  HttpServletRequest request) {
	        System.out.println("로그인 처리 ");
	        System.out.println(vo.getId());
	        UserVO user = userDAO.getUser(vo);
	        if (user != null) {
	            session.setAttribute("userName", user.getUsername());
	            session.setAttribute("address", user.getAddress());
	            session.setAttribute("id", user.getId());
	            session.setAttribute("no", user.getNo());
	            session.setAttribute("password", user.getPassword());
	            session.setAttribute("phoneNumber", user.getPhoneNumber()); 
	            String referer = request.getHeader("Referer");
	            
	            return  "redirect:" + referer;
	        } else {
	            return "common/error.jsp";
	        }
	    }  
	   

	  
    
	    @RequestMapping("/logout.do")
	    public String logout(HttpSession session, HttpServletRequest request) {
	        System.out.println("로그아웃 처리");
	        
	        // 세션에서 모든 정보 제거
	        session.invalidate();
	        
	        // 요청한 페이지 가져오기
	        String referer = request.getHeader("Referer");

	        return "redirect:" + referer;
	    }



	    @RequestMapping("/dropUser.do")
	    public String dropUser(UserVO vo, HttpSession session, HttpServletRequest request) {
	        System.out.println("회원탈퇴 처리 ");
	        vo.setNo((Integer)(session.getAttribute("no")));
	        userDAO.deleteUser(vo);
	        session.invalidate();
	        String referer = request.getHeader("Referer");

	        return "redirect:" + referer;
	    }  


    
		@RequestMapping("/updateUser.do")
		public String updateBoard(@ModelAttribute("user") UserVO vo, HttpSession session,HttpServletRequest request) {
			System.out.println("글 수정 처리");
			System.out.println(vo);
			vo.setNo((Integer)session.getAttribute("no"));
			userDAO.updateUser(vo);
			  session.invalidate();
			  String referer = request.getHeader("Referer");

		        return "redirect:" + referer;
		}	
		

		
	
		  

}
