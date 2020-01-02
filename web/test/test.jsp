<%--
  Created by IntelliJ IDEA.
  User: stage41
  Date: 2020-01-02
  Time: 오후 1:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Form</title>
<%--    <link href="style.css" rel="stylesheet" type="text/css"/>--%>
    <script type="text/javascript" src="scriptt.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<form method="post" action ="regProc.jsp" name="regForm">
    <table border="1">
        <tr>
            <td colspan="2" align="center">회원 가입 정보 입력</td>
        </tr>

        <tr>
            <td align="right">아이디 :</td>
            <td><input type="text" name="id" id="id">&nbsp;&nbsp;
                <input type="button" value="아이디 중복확인" onClick="idCheck(this.form.id.value)"/> </td>
        </tr>

        <tr>
            <td align="right">비밀번호 :</td>
            <td><input type="password" name="pw"/></td>
        </tr>

        <tr>
            <td align="right">비밀번호 확인 :</td>
            <td><input type="password" name="repw"></td>
        </tr>

        <tr>
            <td align="right">이름 :</td>
            <td><input type="text" name="name"></td>
        </tr>

        <tr>
            <td align="right">휴대전화 번호 :</td>
            <td><input type="text" name="phone"></td>
        </tr>

        <tr>
            <td align="right">이메일 :</td>
            <td><input type="text" name="email"></td>
        </tr>

        <tr>
            <td align="right">주소 :</td>
            <td><input type="text" name="address" id="address" size="45">
                <input type="button" value="우편번호찾기" onClick="postCode()"/></td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="button" value="회원가입" onClick="checkpp()">
                <input type="reset" value="다시입력"/>
                <input type="submit" value="회원가입2"/>
            </td>
        </tr>

    </table>

</form>
<%--<script>--%>
<%--    function postCode() {--%>
<%--        new daum.Postcode({--%>
<%--            oncomplete: function(data) {--%>
<%--                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.--%>

<%--                // 각 주소의 노출 규칙에 따라 주소를 조합한다.--%>
<%--                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.--%>
<%--                var addr = ''; // 주소 변수--%>

<%--                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.--%>
<%--                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우--%>
<%--                    addr = data.roadAddress;--%>
<%--                } else { // 사용자가 지번 주소를 선택했을 경우(J)--%>
<%--                    addr = data.jibunAddress;--%>
<%--                }--%>


<%--                // 우편번호와 주소 정보를 해당 필드에 넣는다.--%>
<%--                document.getElementById('address').value = data.zonecode +" "+ addr;--%>


<%--            }--%>
<%--        }).open();--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
