package com.billip.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.billip.domain.BoardVO;
import com.billip.domain.Criteria;
import com.billip.domain.PageMaker;
import com.billip.domain.ReplyVO;
import com.billip.domain.SearchCriteria;
import com.billip.service.BoardService;
import com.billip.service.ReplyService;

@Controller
@RequestMapping(value = "/") //주소 패턴
public class BoardController {
	
	@Inject //주입 명시
	private BoardService service; //Service 호출 위한 객체 생성
	
	@Inject
	ReplyService replyService;
	
	@RequestMapping(value ="/listAll", method = RequestMethod.GET) // 주소호출 명시, 호출하려는 주소와 REST 방식설정(GET)
	public void listAll(Model model) throws Exception // 메소드 인자값은 model 인터페이스(jsp 전달 심부름꾼)
	{
		model.addAttribute("list", service.listAll()); // jsp에 심부름할 내역(서비스 호출)
	}
	
	@RequestMapping(value ="/regist", method = RequestMethod.GET) // Get 방식으로 페이지 호출
	public void registerGET(BoardVO board, Model model) throws Exception
	{
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST) //Post 방식으로 내용 전송
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception // 인자값으로 REDIRECT 사용
	{
		service.regist(board); // 글작성 서비스 호출
		return "redirect:/listPage"; // 작성이 완료된 후 , 목록페이지로 리턴
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET) // GET 방식으로 페이지 호출
	public String read(@RequestParam("bno")int bno,
						@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception // 인자값은 파라미터 값으로 기본키인 글번호를 기준으로 Model을 사용하여 불러옴
	{
		 model.addAttribute(service.read(bno)); // read 서비스 호출
		 
		 List<ReplyVO> replyList = replyService.readReply(bno);
		 model.addAttribute("replyList", replyList);
		 model.addAttribute("cri", cri);
		 
		 return "/read";
	
	}
	@RequestMapping(value = "/modify", method = RequestMethod.GET) // GET 방식으로 페이지 호출
	public void modifyGET(int bno, Model model) throws Exception 
	{
		model.addAttribute(service.read(bno)); // 수정을 위한 글읽기 서비스 호출
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)// POST방식으로 데이터 전송
	public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception 
	{
		service.modify(board); // 글수정 서비스 호출
		return "redirect:/list"; // 수정이 완료된 후, 목록페이지로 리턴
	}
	
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public String removePOST(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception
	{
		service.remove(bno);  // 글삭제 서비스 호출
		return "redirect:/list";
	}
	
	@RequestMapping(value="/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception
	{
		model.addAttribute("list", service.listCriteria(cri)); // JSP에 계산된 페이징 출력
		PageMaker pageMaker = new PageMaker(); // 객체생성
		pageMaker.setCri(cri); //setCri 메소드 사용
		pageMaker.setTotalCount(service.listCountCriteria(cri)); // 전체 게시글 갯수 카운트
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public void listPAge(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception
	{
		model.addAttribute("list", service.listSearchCriteria(cri)); // 전체목록에 검색페이징 기능
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri)); // 전체목 록에 검색페이징 카운트
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO reply, SearchCriteria cri, RedirectAttributes rttr) throws Exception
	{
		replyService.writeReply(reply);
		
		rttr.addAttribute("bno", reply.getBno());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPaeNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/read";
	}
	
	// 댓글 수정 GET
	@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(ReplyVO reply, SearchCriteria cri, Model model) throws Exception
	{
		model.addAttribute("replyUpdate", replyService.selectReply(reply.getRno()));
		model.addAttribute("cri", cri);
		
		return "/replyUpdateView";
	}
	
	//댓글 수정 POST
	@RequestMapping(value ="/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO reply, SearchCriteria cri, RedirectAttributes rttr) throws Exception
	{
		replyService.updateReply(reply);
		
		rttr.addAttribute("bno", reply.getBno());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPaeNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/read";
	}
	
	//댓글 삭제 GET
	@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(ReplyVO reply, SearchCriteria cri, Model model) throws Exception 
	{
		
		model.addAttribute("replyDelete", replyService.selectReply(reply.getRno()));
		model.addAttribute("cri", cri);
		

		return "/replyDeleteView";
	}
		
	//댓글 삭제
	@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyVO reply, SearchCriteria cri, RedirectAttributes rttr) throws Exception 
	{
		
		replyService.deleteReply(reply);
		
		rttr.addAttribute("bno", reply.getBno());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/read";
	}
	
}
