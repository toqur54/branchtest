package com.naver.toqur54;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.toqur54.entities.Board;
import com.naver.toqur54.entities.BoardPaging;
import com.naver.toqur54.entities.Member;
import com.naver.toqur54.service.BoardDao;
import com.naver.toqur54.service.MemberDao;

@Controller
public class BoardController {
	@Autowired				
	private SqlSession sqlSessoin;
	@Autowired
	private Board board;
	@Autowired
	private BoardPaging boardpaging;
	static String find;
	
	//게시판
	@RequestMapping(value = "/board_insert_form", method = RequestMethod.GET)	
	public String board_insert_form() {
		
		return "board/board_insert_form";
	}
	
	//게시판 입력
	@RequestMapping(value = "/board_insert", method = RequestMethod.POST)	
	public String board_insert(@ModelAttribute Board board, @ModelAttribute Member member, @RequestParam CommonsMultipartFile file, Model model,
			HttpServletRequest request) {
		BoardDao dao = sqlSessoin.getMapper(BoardDao.class);
		MemberDao dao1 = sqlSessoin.getMapper(MemberDao.class);
		String originalname = file.getOriginalFilename();
		String filetime = System.currentTimeMillis()+"";
		String stremail = member.getEmail();
		String realpath = "";
		String path = "D:/ncs4webproject/ncs4project1/src/main/webapp/resources/attach/";
		realpath = "resources/attach/";
		if(!originalname.equals("")) {
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path+filetime+"_"+originalname));
				output.write(bytes);
				output.flush();
				output.close();
				board.setB_attach(realpath+filetime+"_"+originalname);
			} catch (Exception e) {
				System.out.println("error: "+e.getMessage());
			}
		}
		
		//DB에 넣기(이미지,날짜시간,회원가입)
		board.setB_email(board.getB_email());
		board.setB_name(board.getB_name());
		board.setB_title(board.getB_title());
		board.setB_content(board.getB_content());
		board.setB_ip(request.getRemoteAddr()); //ip가져오기
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		board.setB_date(format.format(date));
	
		try {
			int result = dao.insertRow(board);
			if(result > 0) {
				model.addAttribute("msg", "게시글이 입력되었습니다.");
			}
		} catch (Exception e) {
			System.out.println("--->>insert err:"+e.getMessage());
		}

		return "member/member_result";
	}
	
	//게시판 리스트 (검색), 페이징
	@RequestMapping(value = "/boardPageList", method = RequestMethod.GET)	
	public String boardPageList(Model model, String find) {
		if(find == null) find = "";
		this.find = find;
		//한페이지 10개 글
		int pagesize = 10;
		int startrow = 0;
		int endrow = startrow + pagesize;
		
		BoardDao dao = sqlSessoin.getMapper(BoardDao.class);
		//페이징
		boardpaging.setFind(find);
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		ArrayList<Board> boards = dao.pageList(boardpaging);
		int rowcount = dao.selectRowCount(find);
		
		//페이지 계산
		int absPage = 1; //절대페이지 1페이지
		if(rowcount % pagesize == 0)
			absPage = 0;
		int pageCount = rowcount / pagesize + absPage;
		
		//페이지 갯수 배열에 넣기
		int[] pages = new int[pageCount];
		for(int i=0; i<pageCount; i++) {
			pages[i] = i+1;
		}
		model.addAttribute("boards", boards);
		model.addAttribute("pages",pages);
		return "board/board_page_list";
	}
	
	//게시글 페이지 클릭시 이동 1,2,3
	@RequestMapping(value = "/boardPageListSelected", method = RequestMethod.GET)	
	public String boardPageListSelected(Model model, int page) {
		BoardDao dao = sqlSessoin.getMapper(BoardDao.class);
		//1페이지에 10개 씩 계산
		int pagesize = 10;
		int startrow = (page - 1) * pagesize;
		int endrow = pagesize;
		
		boardpaging.setFind(find);
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		ArrayList<Board> boards = dao.pageList(boardpaging);
		int rowcount = dao.selectRowCount(find);
		
		//페이지 계산
		int absPage = 1; //절대페이지 1페이지
		if(rowcount % pagesize == 0)
			absPage = 0;
		int pageCount = rowcount / pagesize + absPage;
		
		//페이지 갯수 배열에 넣기
		int[] pages = new int[pageCount];
		for(int i=0; i<pageCount; i++) {
			pages[i] = i+1;
		}
		model.addAttribute("boards", boards);
		model.addAttribute("pages",pages);
		
		return "board/board_page_list";
	}
	
	//게시판 제목 선택
	@RequestMapping(value = "/board_detail", method = RequestMethod.GET)	
	public String board_Detail(HttpSession session,@RequestParam int b_seq,Model model) {
		BoardDao dao = sqlSessoin.getMapper(BoardDao.class);
		Board board = dao.selectOne(b_seq);
		//조회수
		if(!board.getB_email().equals(session.getAttribute("sessionemail"))) {
			dao.updateHit(b_seq);
		}
		model.addAttribute("board",board);
		
		return "board/board_detail";
	}
	//게시판 수정
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)	
	public String boardUpdate(@ModelAttribute Board board, @ModelAttribute Member member, @RequestParam CommonsMultipartFile file, Model model) {
		BoardDao dao = sqlSessoin.getMapper(BoardDao.class);
		MemberDao dao1 = sqlSessoin.getMapper(MemberDao.class);
		String originalname = file.getOriginalFilename();
		String filetime = System.currentTimeMillis()+"";
		String stremail = member.getEmail();
		String realpath = "";
		String path = "D:/ncs4webproject/ncs4project1/src/main/webapp/resources/attach/";
		realpath = "resources/attach/";
		System.out.println("before:"+board.getB_beforeattach());
		System.out.println("orig:"+originalname);
		if(!originalname.equals("")) {
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path+filetime+"_"+originalname));
				output.write(bytes);
				output.flush();
				output.close();
				board.setB_attach(realpath+filetime+"_"+originalname);
			} catch (Exception e) {
				System.out.println("error: "+e.getMessage());
			}
		}else {
			//file
			board.setB_attach(board.getB_beforeattach());
		}
		
		//DB에 넣기(이미지,날짜시간,회원가입)
		board.setB_email(board.getB_email());
		board.setB_name(board.getB_name());
		board.setB_title(board.getB_title());
		board.setB_content(board.getB_content());
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		board.setB_date(format.format(date));
		int result = dao.updateRow(board);
		
		return "redirect:boardPageList";
	}
	
	//파일 다운로드
	@RequestMapping(value = "/boardDownload", method = RequestMethod.GET)
	 public ModelAndView boardDownload(@RequestParam String b_attach) {
		String path="D:/ncs4webproject/ncs4project1/src/main/webapp/";
		File file = new File(path+b_attach); 
		
		return new ModelAndView("download","downloadFile",file);
	 }
	
	//댓글 달기
	@RequestMapping(value = "/boardReplyForm", method = RequestMethod.GET)	
	public String boardReplyForm(HttpSession session,@RequestParam String b_title,@RequestParam int b_seq,Model model) {
		board.setB_email((String) session.getAttribute("sessionemail"));
		board.setB_name((String) session.getAttribute("sessionname"));
		board.setB_seq(b_seq);
		board.setB_title("[댓글] "+b_title);
		model.addAttribute("board",board);
		
		return "board/board_reply_form";
	}
	//댓글 저장
	@RequestMapping(value = "/boardReply_insert", method = RequestMethod.POST)	
	public String boardReply_insert(@ModelAttribute Board board, @ModelAttribute Member member, @RequestParam CommonsMultipartFile file, Model model,
			HttpServletRequest request) {
		BoardDao dao = sqlSessoin.getMapper(BoardDao.class);
		MemberDao dao1 = sqlSessoin.getMapper(MemberDao.class);
		String originalname = file.getOriginalFilename();
		String filetime = System.currentTimeMillis()+"";
		String stremail = member.getEmail();
		String realpath = "";
		String path = "D:/ncs4webproject/ncs4project1/src/main/webapp/resources/attach/";
		realpath = "resources/attach/";
		if(!originalname.equals("")) {
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path+filetime+"_"+originalname));
				output.write(bytes);
				output.flush();
				output.close();
				board.setB_attach(realpath+filetime+"_"+originalname);
			} catch (Exception e) {
				System.out.println("error: "+e.getMessage());
			}
		}
		
		//DB에 넣기(이미지,날짜시간,회원가입)
		board.setB_email(board.getB_email());
		board.setB_name(board.getB_name());
		board.setB_title(board.getB_title());
		board.setB_content(board.getB_content());
		board.setB_ip(request.getRemoteAddr()); //ip가져오기
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		board.setB_date(format.format(date));
		
		int result = dao.insertReplyRow(board);

		return "redirect:boardPageList";
	}
	
	//게시글 삭제
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)	
	public String boardDelete(Model model,@RequestParam int b_ref,@RequestParam int b_seq) {
		BoardDao dao = sqlSessoin.getMapper(BoardDao.class);
		if(b_seq == b_ref) {
			dao.deleteRowref(b_ref);
		}else {
			dao.deleteRowseq(b_seq);
		}
		
		return "redirect:boardPageList";
	}
	
}
