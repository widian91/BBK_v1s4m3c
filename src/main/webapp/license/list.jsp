<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.license.LicenseVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
$(function(){
  $('#panel_frm').hide();
});
 
function create(){
  $('#panel_frm').show();
  $('#frm').attr('action', './create.do');
  $('#lc_nick').val('');
  $('#submit').html('등록');
  $('#lc_nick').focus();
}
 
function create_cancel(){
  $('#panel_frm').hide();
}

function update(lc_no, lc_nick, lc_title, lc_content, lc_date){
  $('#panel_frm').show();
  $('#frm').attr('action', './update.do');
  // $('#codeno').val(codeno); // Chrome Elements에 변경이 안됨
  $('#lc_no').attr('value', lc_no);
  // $('#sort').val(sort);          // Chrome Elements에 변경이 안됨
  $('#lc_nick').attr('value', lc_nick);
  // $('#seqno').val(seqno); // Chrome Elements에 변경이 안됨
  $('#lc_title').attr('value', lc_title);
  $('#lc_content').attr('value', lc_content);
  $('#lc_date').attr('value', lc_date);
  $('#submit').html('저장');
  $('#lc_nick').focus();
}
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
ArrayList<LicenseVO> list = (ArrayList<LicenseVO>)request.getAttribute("list");
%>
<DIV class='title'>목록</DIV>
 
<DIV id='panel_frm' class='content' style='padding: 10px 0px 10px 0px; background-color: #DDDDDD; width: 70%; text-align: center;'>
<FORM name='frm' id='frm' method='POST' >
  <input type='hidden' name='lc_no' id='lc_no' value='0'> 
  
  <label for='lc_nick'>닉네임</label>
  <input type='text' name='lc_nick' id='lc_nick' size='15' required="required">
 
  <label for='lc_title'>제목</label>
  <input type='text' name='lc_title' id='lc_title' required="required">
  <br>
  <label for='lc_content'>내용</label><br>
  <textarea rows="10" cols="50" name="lc_content"></textarea>
  <br>
  <button type="submit" id='submit'>등록</button>
  <button type="button" onclick="create_cancel()">취소</button>
</FORM>
</DIV>
 
<TABLE class='table' style='width: 80%;'>
  <colgroup>
    <col style='width: 5%;'/>
    <col style='width: 15%;'/>
    <col style='width: 15%;'/>
    <col style='width: 40%;'/>
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>닉네임</TH>
    <TH class='th'>제목</TH>
    <TH class='th'>내용</TH>
    <TH class='th'>등록일</TH>
    <TH class='th'>기타</TH>
  </TR>
 
<c:forEach var="vo" items="${list }">
  <TR>
    <TD class='td'>${vo.lc_no}</TD>
    <TD class='td'>${vo.lc_nick}</TD>
    <TD class='td'>${vo.lc_title}</TD>
    <TD class='td'>${vo.lc_content}</TD>
    <TD class='td'>${vo.lc_date}</TD>
    <TD class='td'>
      <A href="javascript:update(${vo.lc_no}, '${vo.lc_nick}', '${vo.lc_title}', '${vo.lc_content}', '${vo.lc_date}')"><IMG src='./images/update.png' title='수정'></A>
      <A href="javascript:remove(${vo.lc_no})"><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
  </c:forEach>
 
</TABLE>
 
<DIV class='bottom'>
  <button type='button' onclick="create();">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>