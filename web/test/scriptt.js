function idCheck(id){
    if(id==""){
        alert("아이디를 입력해 주세요.");
        document.querySelector('#id').focus();
    }else{
        url="idCheck.jsp?id="+id;
        window.open(url,"post","width=300,height=150");
    }
}
document.write("<script src='https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>");

function postCode() {

   new daum.Postcode({
       oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var addr = ''; // 주소 변수

           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
           } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
           }


           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('address').value = data.zonecode +" "+ addr;

       }
   }).open();
}
function checkpp() {
    alert("버튼 눌림!?");
  if(document.regForm.id.value==""){
     alert("아이디를 입력해 주세요.")
     document.regForm.id.focus();
     return;
  }
  if(document.regForm.pw.value==""){
     alert("비밀번호를 입력해 주세요.")
     document.regForm.pw.focus();
     return;
  }
  if(document.regForm.pw.value!=document.regForm.repw.value){
     alert("비밀번호가 일치하지 않습니다.")
     document.regForm.repw.focus();
     return;
  }
  if(document.regForm.pw.name==""){
     alert("이름을 입력해 주세요.")
     document.regForm.name.focus();
     return;
  }
  if(document.regForm.phone.value==""){
     alert("휴대폰 번호를 입력해 주세요.")
     document.regForm.phone.focus();
     return;
  }
  if(document.regForm.email.value==""){
     alert("이메일 주소를 입력해 주세요.")
     document.regForm.email.focus();
     return;
  }
  if(document.regForm.address.value==""){
     alert("주소를 입력해 주세요.")
     document.regForm.address.focus();
     return;
  }
  document.regForm.submit();
}
