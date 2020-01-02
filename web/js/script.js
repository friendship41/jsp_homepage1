function check(){
    if(document.find_frm.find_box.value==""){
        alert("검색어를 입력해 주세요");
        return false;
    }
}

function checkJoinForm() {
    var foorm = document.join;
    if(document.getElementById("id").value===""){
        alert("아이디를 입력해 주세요");
        document.getElementById("id").focus();
        return;
    }
    if(document.getElementById("pw").value===""){
        alert("비밀번호를 입력해 주세요");
        document.getElementById("pw").focus();
        return;
    }
    if(document.getElementById("pw").value!=document.getElementById("repw").value){
        alert("비밀번호가 일치하지 않습니다");
        document.getElementById("repw").focus();
        return;
    }
    if(document.getElementById("name").value===""){
        alert("이름을 입력해 주세요");
        document.getElementById("name").focus();
        return;
    }
    if(document.getElementById("email").value===""){
        alert("이메일을 입력해 주세요");
        document.getElementById("email").focus();
        return;
    }
    if(document.getElementById("tel2").value===""){
        alert("폰번호를 입력해 주세요");
        document.getElementById("tel2").focus();
        return;
    }
    if(document.getElementById("tel3").value===""){
        alert("폰번호를 입력해 주세요");
        document.getElementById("tel3").focus();
        return;
    }
    if(document.getElementById("postcode").value===""){
        alert("우편번호를 입력해 주세요");
        document.getElementById("postcode").focus();
        return;
    }
    if(document.getElementById("address2").value===""){
        alert("상세주소를 입력해 주세요");
        document.getElementById("address2").focus();
        return;
    }
    foorm.submit();
}

function checkmodForm() {
    var foorm = document.join;
    if(document.getElementById("id").value===""){
        alert("아이디를 입력해 주세요");
        document.getElementById("id").focus();
        return;
    }
    if(document.getElementById("pw").value!=""){
        if(document.getElementById("pw").value!=document.getElementById("repw").value){
            alert("비밀번호가 일치하지 않습니다");
            document.getElementById("repw").focus();
            return;
        }
    }
    if(document.getElementById("name").value===""){
        alert("이름을 입력해 주세요");
        document.getElementById("name").focus();
        return;
    }
    if(document.getElementById("email").value===""){
        alert("이메일을 입력해 주세요");
        document.getElementById("email").focus();
        return;
    }
    if(document.getElementById("tel2").value===""){
        alert("폰번호를 입력해 주세요");
        document.getElementById("tel2").focus();
        return;
    }
    if(document.getElementById("tel3").value===""){
        alert("폰번호를 입력해 주세요");
        document.getElementById("tel3").focus();
        return;
    }
    if(document.getElementById("postcode").value===""){
        alert("우편번호를 입력해 주세요");
        document.getElementById("postcode").focus();
        return;
    }
    if(document.getElementById("address2").value===""){
        alert("상세주소를 입력해 주세요");
        document.getElementById("address2").focus();
        return;
    }
    foorm.submit();
}

// function checkWriteBoard() {
//     var foorm = document.gogogo;
//     if(document.getElementById("subject").value===""){
//         alert("타이틀을 입력해 주세요");
//         document.getElementById("subject").focus();
//         return;
//     }
//     if(document.getElementById("content").value===""){
//         alert("내용을 입력해 주세요");
//         document.getElementById("content").focus();
//         return;
//     }
//     foorm.submit();
// }


function goToHome() {
    location.href="/jsp_homepage1";
}

function goToJoin() {
    location.href="/jsp_homepage1/member/join.jsp";
}

function idCheck(id) {
    if(id == "")
    {
        alert("아이디를 입력해주세요");
    }
    else
    {
        url="../member/idcheck.jsp?id="+id;
        window.open(url,"post","width=300, height=200");
    }
}



