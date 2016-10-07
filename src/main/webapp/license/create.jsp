<%@ page contentType="text/html; charset=UTF-8" %>
 
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
 
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<!-- ----------------------------------------- -->
 
<DIV class='title'>자격증 정보 등록</DIV>
 
<DIV class='content' style='width: 80%;'>
<FORM name='frm' method='POST' action='./create.do'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='lc_nick'>닉네임</label>
        <input type='text' name='lc_nick' id='lc_nick' value='닉네임' required="required">
        <label class='label' for='lc_title'>제목</label>
        <input type='text' name='lc_title' id='lc_title' value='제목' required="required">
      </li>
      <li>
        <label class='label' for='lc_content'>내용</label><br>
        <textarea rows="20" cols="100" name="lc_content">내용</textarea>
      </li>
      <li class='right'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">목록</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>