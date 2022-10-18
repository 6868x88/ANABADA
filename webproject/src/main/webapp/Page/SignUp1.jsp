 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signup_1</title>
    
    <link rel="stylesheet" href="./css/SignUp.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./css/HeaderFooter.css">
	<%@ include file="../Page/Header.jsp"%>
        <script type="text/javascript">

            function CheckForm(Join){
                var isChk = false;

                var arr = [
                    document.getElementById("agreement1").checked,
                    document.getElementById("agreement2").checked,
                    document.getElementById("agreement3").checked
                ];

                for(var i=0;i<2;i++){
                    if(arr[i] == true) {
                        isChk = true;
                        continue;
                    }
                    isChk = false;
                    break;
                }
                
                if(!isChk){
                    alert("필수 항목을 선택해주세요.");
                    return ;
                }

                Join.action="../Page/SignUp2.jsp";
                Join.submit();
            }
        </script>
</head>

<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("UserId");
	System.out.print(user_id + "확인");

	if (user_id != null) {
		out.println("<script>alert('로그아웃 후 사용해주세요.');location.href='tradeListPage.do?category=7';</script>");
	}
	%>
<section style="margin:0 15% 15% 15%">
    <div class="signup_title">
        회원가입
    </div>
    <div class="step_title">
        <p class="step_point">1 약관동의</p>
        <p>2 정보입력</p>
        <p>3 가입 완료</p>
    </div>
    <hr style="margin-top: 0px">
    <div class="step_ments_1">
        <p class="step_ment_1"><span style="color: #2B5566;font-weight: bold;">
                아나바다</span>에 오신 것을 환영합니다!</p>
        <p class="step_ment_1"> 약관을 충분히 숙지한 후 동의해주시기 바랍니다.</p>
        <p class="step_ment_1"> 고객님께서는 동의를 거부할 수 있습니다. </p>
        <p class="step_ment_1"> 단, 필수항목 등의 거부 시에는 회원가입이 제한됩니다.</p>
    </div>
    <hr>
    <div class="accordion" id="accordionExample">

        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    <span style="color:red">(필수)</span>&nbsp;아나바다서비스 이용약관
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    제1조 (목적)<br>
                    이 약관은 아좌좌송강장(전자상거래 사업자)가 운영하는 아나바다(이하 “몰”이라 한다)에서제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과
                    이용자의권리․의무 및 책임사항을 규정함을 목적으로 합니다.
                    ※ PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.<br><br>
                    제2조 (정의)<br>
                    ① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의
                    영업장을말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
                    ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
                    ③ “회원”이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
                    ④ “비회원”이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br><br>
                    제17조 (개인정보보호)<br>
                    ① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.
                    ② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정
                    개인정보를 수집하는 경우에는 그러하지 아니합니다.
                    ③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를받습니다.
                    ④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을
                    고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.
                    ⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적,
                    제3자에 대한정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나
                    고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
                    ⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가
                    오류의정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
                    ⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는
                    제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
                    ⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.
                    ⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를
                    구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.

                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <span style="color:red">(필수)</span>&nbsp;개인정보 수집 및 이용동의
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <span class="agree_m">1. 수집∙이용 목적</span><br>
                    &nbsp; &nbsp;- 이용자 식별 및 본인여부 확인<br><br>
                    <span class="agree_m">2. 수집하는 개인정보의 항목</span> <br>
                    &nbsp; &nbsp;- 아이디, 비밀번호, 이름, 이메일, 전화번호 <br><br>
                    <span class="agree_m"> 3. 보유∙이용 기간<br></span>
                    &nbsp; &nbsp;- 회원탈퇴 시까지<br><br>
                    <span class="agree_m"> 4. 동의 거부권 및 불이익<br></span>
                    &nbsp; &nbsp;- 개인정보 수집 및 이용에 관한 동의는 개인정보보호법 15조에 의거하여 거부할 수 있으나, 동의 거부 시 홈페이지에 회원가입 및 서비스를 이용할 수
                    없습니다.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    </span>&nbsp;마케팅 정보 활용 동의
                </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    </span>&nbsp; - 마케팅 정보 수신 여부 및 마케팅을 위한 개인정보 수집이용을 거부하실 수 있으며, 거부 시에도 아나바다 서비스를 이용하실 수 있으나, 동의를 거부한
                    경우 각종 소식 및 이벤트 참여에 제한이 있을 수 있습니다.
                    <br><br><span class="agree_m">개인정보 수집 항목</span><br>
                    &nbsp; - 이름, 휴대폰번호, 이메일, 주소
                    <br><br><span class="agree_m">개인정보 수집 이용 목적</span><br>
                    &nbsp;- 이벤트 운영 및 광고성 정보 전송<br>
                    &nbsp;- 서비스 관련 정보 전송
                    <br><br><span class="agree_m">보유 및 이용기간</span><br>
                    &nbsp;- 이용자가 동의를 철회하거나, 탈퇴시까지 보유•이용

                </div>
            </div>
        </div>
    </div>

    <div class="ageement_check">
        <form method="get" onsubmit="CheckForm(this)">
            <label class="check_style"><input type="checkbox" name="agreement1" id="agreement1">
                <span style="color:red">(필수)</span> 아나바다 서비스 동의</label><br>
            <label class="check_style"><input type="checkbox" name="agreement2" id="agreement2">
                <span style="color:red">(필수)</span> 개인정보 수집 및 이용동의</label><br>
            <label class="check_style"><input type="checkbox" name="agreement3" id="agreement3"> 개인정보의 취급위탁 동의</label><br>
            <input type="submit" class="next_btn" value="다음"></input>
        </form>
    </div>
</section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>

	<%@ include file="./HeaderFooter/Footer.jsp"%>
</body>

</html>