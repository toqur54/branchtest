package com.naver.toqur54;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.naver.toqur54.entities.Member;
import com.naver.toqur54.service.MemberDao;

@Controller
public class MemberController {
	
	//객체를 만들지 않고 바로 쓸수 있음
	//ex) member = new member(); 같은거 생략가능한 기능
	//Autowired를 사용하려면 Component를 선언해줘야함
	@Autowired				
	private SqlSession sqlSessoin;
	@Autowired
	private Member member;
	//security
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	//비번 찾기
	@Autowired
	private JavaMailSender emailSender;
	//비밀번호 찾기 폼
	@RequestMapping(value = "/member_pass_form", method = RequestMethod.GET)	
	public String member_pass_form(String email) {
		
		return "member/member_pass_form";
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "/emailLossFind", method = RequestMethod.POST)
	@ResponseBody
	public int emailLossFind(String email) {
		MemberDao dao = sqlSessoin.getMapper(MemberDao.class);
		int exists = 0;
		try {
			exists = dao.selectConfirm(email);
		} catch (Exception e) {
			System.out.println("confirm error : "+e.getMessage());
		}
		
		if(exists > 0) {
			Random random = new Random();
			String temppassword = String.format("%04d",random.nextInt(9000));
			String content =  "임시비밀번호["+temppassword+ "]";
			String encodingPassword = passwordEncoder.encode(temppassword);
			member.setPassword(encodingPassword);
			member.setEmail(email);
			
			dao.updatePassword(member);
			
			sendEmail(email , content);
		}
		
		return exists;
	}
	
	//메일 인증
	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuth( @RequestParam String email  ) {
		String authNum = randomNum(); 
		String content =  "인증번호["+authNum+ "]";
		sendEmail(email , content);
		System.out.println("---->"+email);
		return authNum;
	}
	
	String randomNum() {
		StringBuffer buffer = new StringBuffer();
		for ( int i = 0 ; i <= 6; i++ ){
			int n =  (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	//이메일인증+비번찾기
	private void sendEmail( String email, String content ) {
		String host = "smtp.gmail.com";
		String subject = "itschool 인증번호";
		String fromName = "itschool 관리자";
		String from = "newgya@gmail.com";
		String to1 = email;
		SimpleMailMessage message = new SimpleMailMessage();
		try {
			message.setFrom(MimeUtility.encodeText(fromName,"UTF-8","B"));
			message.setSubject(subject);
			message.setText(content);
			message.setTo(to1);
//			message.setFrom(from);
			emailSender.send(message);
			
			System.out.println("----> success:"+email);
		} catch (Exception e) {
			System.out.println("----> error:"+e.getMessage());
		}
	}
	
	//중복체크
	@RequestMapping(value = "/memberConfirm", method = RequestMethod.POST)
	@ResponseBody	//호출한 곳으로 값을 가지고 돌아감
	public int memberConfirm(@RequestParam String email) {	//딸려있는 값가져옴	
		MemberDao dao = sqlSessoin.getMapper(MemberDao.class);
		int exists = 0;
		try {
			exists = dao.selectConfirm(email);
		} catch (Exception e) {
			System.out.println("confirm error : "+e.getMessage());
		}
		
		return exists;
	}
	
	@RequestMapping(value = "/member_insert_form", method = RequestMethod.GET)	
	public String member_insert_form() {
		return "member/member_insert_form";
	}
	
	//이미지
	//member에 있는 this공간 이름들 form 이름들과 member.java에 있는 이름 매칭시켜줌
	//@ModelAttribute("타입") 타입 member(변수명)
	//CommonsMultipartFile -> 컴퓨터 주소
	@RequestMapping(value = "/member_insert", method = RequestMethod.POST)	
	public String member_insert(@ModelAttribute Member member, @RequestParam CommonsMultipartFile imgfile,Model model) {
		String originalname = imgfile.getOriginalFilename();
		int position = originalname.lastIndexOf(".");	//마지막 . 위치
		String stremail = member.getEmail();  
		String ext ="";
		String newfilename="";
		String realpath = "";
		String path = "D:/ncs4webproject/ncs4project1/src/main/webapp/resources/uploadattachs/";
		//이미지 디폴트
		if(originalname.equals("")) {
			ext = ".png";
			newfilename ="noimage1.png";
			realpath = "resources/img/";
		}else {
			ext = originalname.substring(position);//마지막부터 끝까지
			newfilename = stremail+ext;
			realpath = "resources/uploadattachs/";
			try {
				byte bytes[] = imgfile.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path+newfilename));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
				System.out.println("error: "+e.getMessage());
			}
		}
		
		//DB에 넣기(이미지,날짜시간,회원가입)
		member.setPhoto(realpath+newfilename);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		member.setInputdate(format.format(date));
		MemberDao dao = sqlSessoin.getMapper(MemberDao.class);
		try {
			String encodingPassword = passwordEncoder.encode(member.getPassword());
			member.setPassword(encodingPassword);
			int result = dao.insertRow(member);
			if(result > 0) {
				model.addAttribute("msg", "입력되었습니다.");
			}
		} catch (Exception e) {
			System.out.println("--->>insert err:"+e.getMessage());
		}
		
		
		return "member/member_result";
	}
	//전체검색
	@RequestMapping(value = "/member_search", method = RequestMethod.GET)	
	public String member_search(Model model) {
		MemberDao dao = sqlSessoin.getMapper(MemberDao.class);
		ArrayList<Member> members = dao.selectAll();
		model.addAttribute("members", members);
		
		return "member/member_search";
	}
	//E-mail클릭시 하나의 row 검색
	@RequestMapping(value = "/member_update", method = RequestMethod.GET)	
	public String member_update(Model model, @RequestParam String email) {
		MemberDao dao = sqlSessoin.getMapper(MemberDao.class);
		Member member = dao.selectOne(email);
		model.addAttribute("member", member);

		return "member/member_update_form";
	}
	
	//update Member
	@RequestMapping(value = "/member_update_form", method = RequestMethod.POST)	
	public String member_update_form(@ModelAttribute Member member, @RequestParam CommonsMultipartFile imgfile,Model model	) {
		String originalname = imgfile.getOriginalFilename();
		String stremail = member.getEmail();  
//		String ext ="";
		String newfilename="";
		String realpath = "";
		
		
		//이미지 디폴트
		if(originalname.equals("")) {
			member.setPhoto(member.getBeforephoto());
		}else {
			int position = originalname.lastIndexOf(".");	//마지막 . 위치
			String ext = originalname.substring(position);//마지막부터 끝까지
			newfilename = stremail+ext;
			realpath = "resources/uploadattachs/";
			try {
				String path = "D:/ncs4webproject/ncs4project1/src/main/webapp/resources/uploadattachs/";
				member.setPhoto(realpath+newfilename);
				byte bytes[] = imgfile.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path+newfilename));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
				System.out.println("error: "+e.getMessage());
			}
		}
		//DB에 넣기(이미지,날짜시간,회원가입)
		
		MemberDao dao = sqlSessoin.getMapper(MemberDao.class);
		try {
			String encodingPassword = passwordEncoder.encode(member.getPassword());
			member.setPassword(encodingPassword);
			int result = dao.updateRow(member);
			if(result > 0) {
				model.addAttribute("msg", "수정되었습니다.");
			}
		} catch (Exception e) {
			System.out.println("--->>insert err:"+e.getMessage());
		}
		
		return "member/member_result";
	}
	//member delete
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)	
	public String memberDelete(Model model,@RequestParam String email) {
		MemberDao dao = sqlSessoin.getMapper(MemberDao.class);
		int result= dao.deleteRow(email);
		if(result > 0) {
			model.addAttribute("msg", "삭제되었습니다.");
		}
		return "member/member_result";
	}
	
	//로그인
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)	
	public String loginForm() {
		return "login/login";
	}
	//id password db 확인
	@RequestMapping(value = "/login", method = RequestMethod.POST)	
	public String login(@ModelAttribute Member member,HttpSession session) {
		MemberDao dao = sqlSessoin.getMapper(MemberDao.class);
		Member data = dao.login(member.getEmail());	//복호화
		if(data == null) {
			return "login/login_fail";
		}else {
			//복호화
			boolean passchk = BCrypt.checkpw(member.getPassword(), data.getPassword());
			if(passchk) {
			//세션 선언
			session.setAttribute("sessionemail", data.getEmail());
			session.setAttribute("sessionpassword", data.getPassword());
			session.setAttribute("sessionname", data.getName());
			session.setAttribute("sessionphoto", data.getPhoto());
			return "redirect:index";
			}else {
				return "login/login_fail";
			}
		}
	}
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)	
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:index";
	}
	
}
