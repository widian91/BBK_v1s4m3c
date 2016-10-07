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
      msgs.add("�Խñ��� ��ϵǾ����ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("�Խñ� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  /**
   * ��ü ����� ����մϴ�.
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
      msgs.add("�Խù� ���濡 �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
}