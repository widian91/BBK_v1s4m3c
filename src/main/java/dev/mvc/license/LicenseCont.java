package dev.mvc.license;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.license.LicenseVO;

@Controller
public class LicenseCont {
  @Autowired
  @Qualifier("dev.mvc.license.LicenseDAO")
  private LicenseDAOInter LicenseDAO;

  public LicenseCont() {
    System.out.println("--> LicenseCont created.");
  }
  
  @RequestMapping(value = "/license/create.do", 
      method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called."); 
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/create"); // /webapp/code/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/license/create.do", 
      method = RequestMethod.POST)
  public ModelAndView create(LicenseVO licenseVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/message"); // /webapp/code/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (LicenseDAO.create(licenseVO) == 1) {
      msgs.add("게시글이 등록되었습니다.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    } else {
      msgs.add("게시글 등록에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  /**
   * 전체 목록을 출력합니다.
   * @return
   */
  @RequestMapping(value = "/license/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/list"); // /webapp/code/list.jsp
    mav.addObject("list", LicenseDAO.list());
 
    return mav;
  }
  
  
  @RequestMapping(value = "/license/update.do", method = RequestMethod.POST)
  public ModelAndView update(LicenseVO licenseVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (LicenseDAO.update(licenseVO) == 1) {
      mav.setViewName("redirect:/license/list.do");
    } else {
      msgs.add("게시물 변경에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
}