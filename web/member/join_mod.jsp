<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2019-12-30
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/loginCheck.jsp"%>
<% String id = (String) session.getAttribute("id");%>
<jsp:useBean id="vo" class="com.jsp.join.vo.MemberVO"/>
<jsp:useBean id="dao" class="com.jsp.join.dao.MemberDAO"/>
<% vo = dao.selectSingle(id);%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/join_us.css" />
    <script type="text/javascript" src="../js/script.js"></script>
    <title>회원정보수정</title>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        // document.getElementById("sample6_extraAddress").value = extraAddr;

                    } else {
                        // document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address1").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("address2").focus();
                }
            }).open();
        }
        function phone1(inp) {
            for(i=0 ; i<7; i++){
                if(document.join.tel1.options[i].value === inp)
                {
                    document.join.tel1.options[i].selected = true;
                    break;
                }
            }
        }
    </script>
</head>
<body onload="phone1('<%=vo.getTel1()%>')">
<div id="warp">
    <!--헤더파일 들어가는 곳-->
    <%@ include file="../include/header.jsp" %>

    <!--그림파일 들어가는 곳 없어도 되지만 한번 넣어보자-->
    <div id="sub_img">
    </div>
    <!--왼쪽의 서브메뉴가 들어가는 곳-->
    <%@ include file="../include/left.jsp" %>

    <!--실제 내용 콘텐츠가 들어가는 곳-->

    <article id="contents">
        <h1>정보수정</h1>
        <form name="join" id="join" method="post" action="/jsp_homepage1/member/procMemberMod.jsp">
            <fieldset><legend>Basic Infomation</legend>
                <ul>
                    <li><label>User ID　</label><input type="text" id="id" name="id" class="id" value="<%=vo.getId()%>" readonly/></li>
                    <li><label>Password　</label><input type="password" id="pw" name="pw" class="pass"/></li>
                    <li><label>Retype Password　</label><input type="password" id="repw" class="pass"/></li>
                    <li><label>Name　</label><input type="text" id="name" name="name" class="nick" value="<%=vo.getName()%>" READONLY/></li>
                    <li><label>Email　</label><input type="text" id="email" name="email" class="email" value="<%=vo.getEmail()%>"/></li>

                </ul>
            </fieldset>
            <fieldset><legend>Optional</legend>

                <ul>
                    <li><label>Phone Number　</label>
                        <select name="tel1" id="tel1">
                            <option value="02" >02</option>
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                        </select>-
                        <input type="text" id="tel2" name="tel2" class="tel" maxlength="4" size="5" value="<%=vo.getTel2()%>"/>-
                        <input type="text" id="tel3" name="tel3" class="tel" maxlength="4" size="5" value="<%=vo.getTel3()%>"/></li>

                    <li><label>Postal Code　</label>
                        <input type="text" id="postcode" name="postcode" class="" value="<%=vo.getPostcode()%>" readOnly/>
                        <input type="button" value="찾기" onClick="sample6_execDaumPostcode()"/></li>
                    <li><label>Address1　</label>
                        <input type="text" id="address1" name="address1" class="address" value="<%=vo.getAddress1()%>" readonly/></li>
                    <li><label>Address2　</label>
                        <input type="text" id="address2" name="address2" class="address" value="<%=vo.getAddress2()%>"/></li>
                </ul>
            </fieldset>
            <div class="clear"></div>
            <div id="buttons">
                <input type="button" value="Submit" class="btn" onclick="checkmodForm()">
                <input type="button" value="Cancel" id="cancel" class="btn" onclick="goToHome()">
            </div>
        </form>


    </article>
    <div class="clear"></div>
    <!-- 푸터가 들어가는 곳 -->
    <%@ include file="../include/footer.jsp" %>

</div><!--warp 끝나는 부분-->
</body>
</html>
