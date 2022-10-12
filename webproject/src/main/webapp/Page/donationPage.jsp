<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../Page/Header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>후원 페이지</title>

<!--부트스트랩-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<script>
        $('.carousel').carousel({
            interval: 2000 //기본 5초
        })
    </script>



<script>
        //TOP스크롤
        $(window).scroll(function () {
            if ($(this).scrollTop() > 200) {
                $('.btn_gotop').show();
            } else {
                $('.btn_gotop').hide();
            }
        });
        $('.btn_gotop').click(function () {
            $('html, body').animate({ scrollTop: 0 }, 400);
            return false;
        });
    </script>

<link rel="stylesheet" href="./css/style-jieun.css">


</head>

<body>


	<div style="margin: 2% 10%;">
		<a href="" class="a link">HOME</a> > 후원
	</div>


	<div class="slide-img">
		<div id="demo" class="carousel slide" data-ride="carousel">

			<div class="carousel-inner">
				<!-- 슬라이드 쇼 -->
				<div class="carousel-item active">
					<!--가로-->
					<picture>
					<source srcset="./img/banner1-donation.png"
						media="(min-width: 768px)" />
					<source srcset="./img/banner1(min)-donation.png"
						media="(min-width:400px)" />
					<img src="./img/banner1-donation.png"> </picture>
					<div class="carousel-caption d-none d-md-block"></div>
				</div>
				<div class="carousel-item">
					<picture>
					<source srcset="./img/banner2-donation.png"
						media="(min-width: 768px)" />
					<source srcset="./img/banner2(min)-donation.png"
						media="(min-width:400px)" />
					<img src="./img/banner2-donation.png"> </picture>
				</div>
				<div class="carousel-item">
					<picture>
					<source srcset="./img/banner3-donation.png"
						media="(min-width: 768px)" />
					<source srcset="./img/banner3(min)-donation.png"
						media="(min-width:400px)" />
					<img src="./img/banner3-donation.png"> </picture>
				</div>

				<!-- / 슬라이드 쇼 끝 -->

				<!-- 왼쪽 오른쪽 화살표 버튼 -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<!-- <span>Previous</span> -->
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<!-- <span>Next</span> -->
				</a>
				<!-- / 화살표 버튼 끝 -->

				<!-- 인디케이터 -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<!--0번부터시작-->

					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>
				<!-- 인디케이터 끝 -->
			</div>
		</div>
	</div>

	<!--후원 단체 소개-->
	<div class="introduce">
		<p style="font-size: 20pt; color: #c5c5c5">기 부 후 원&nbsp;&nbsp; 단
			체&nbsp;&nbsp; 소 개</p>
		<hr>
		<br>
		<div style="margin: 5% 0;">
			<ul class="cards">
				<li><a href="#" class="card" data-toggle="modal"
					data-target="#moaModal1"> <img src="./img/1.png"
						class="card__image" alt="" />
						<div class="card__overlay">
							<div class="card__header">
								<svg class="card__arc" xmlns="http://www.w3.org/2000/svg">
                                    <path />
                                </svg>
								<img class="card__thumb" src="./img/1-1.png" alt="" />
								<div class="card__header-text">
									<h3 class="card__title">환경운동연합</h3>
									<span class="card__status">아시아 최대 규모의 환경단체</span>
								</div>
							</div>
							<p class="card__description">자연과 공존할 수 있는 삶터를 지키고 행복한 미래를 만들어
								가는 녹색의 길에서 지구 그리고 당신과 함께하겠습니다.</p>
						</div>
				</a></li>
				<li><a href="#" class="card" data-toggle="modal"
					data-target="#moaModal2"> <img src="./img/2.jpg"
						class="card__image" alt="" />
						<div class="card__overlay">
							<div class="card__header">
								<svg class="card__arc" xmlns="http://www.w3.org/2000/svg">
                                    <path />
                                </svg>
								<img class="card__thumb" src="./img/2-1.png" alt="" />
								<div class="card__header-text">
									<h3 class="card__title">환경재단</h3>
									<span class="card__status">우리나라 최초 환경 전문 공익재단</span>
								</div>
							</div>
							<p class="card__description">글로벌 그린리더들을 육성하여 글로벌 환경운동을 주도합니다.
								이를 위해 지식의 지평을 넓히고 연대를 강화할 에코캠퍼스를 세웁니다.</p>
						</div>
				</a></li>
				<li><a href="#" class="card" data-toggle="modal"
					data-target="#moaModal3"> <img src="./img/3.jpg"
						class="card__image" alt="" />
						<div class="card__overlay">
							<div class="card__header">
								<svg class="card__arc" xmlns="http://www.w3.org/2000/svg">
                                    <path />
                                </svg>
								<img class="card__thumb" src="./img/3-1.png" alt="" />
								<div class="card__header-text">
									<h3 class="card__title">재단법인 숲과나눔</h3>
									<!-- <span class="card__tagline">Lorem ipsum dolor sit amet consectetur</span>             -->
									<span class="card__status"> 안전하고 건강한 사회를 만드는 비영리재단</span>
								</div>
							</div>
							<p class="card__description">숲과나눔은 가정·일터·지역사회의 환경이 숲과 같이 건강하고
								안전하며 지속가능한 곳이어야 한다는 우리 사회의 여망이 모여 만들어진 비영리 재단입니다.</p>
						</div>
				</a></li>
			</ul>
		</div>
		<p style="font-size: 10pt; color: #c5c5c5">※ '아나바다'는 회원 상호간 및 회원과
			제3자 사이의 발생한 분쟁에 대해 개입할 의무가 없으며, 이로 인한 손해를 배상할 책임도 없습니다.</p>
		<br>
		<hr>
	</div>

	<!--기부 독려 글-->
	<div class="donation-detail">
		<ul>
			<li class="detail-strong">○ What is donation?</li>
			<li>
				<div class="item-text">
					<br>기부는 " 타인을 돌보거나 자신의 이익과는 상관없이 금전적으로 도움을 제공하는 행동 "을 말합니다. <br>쉽게
					말해 기부는 어렵고 힘든 이들을 위해 현금, 용역, 의류 등을 지원하는 것이죠. <br>이러한 기부는 각자의
					상황과 사정으로 인해 도움이 절실한 누군가에게 큰 힘이 되어주지요.<br>
				</div>
			</li>
			<li>
				<div class="item-img"
					style="background-image: url('./img/with1.jpg');"></div>
			</li>
		</ul>


		<div class="donation-detail2">
			<ul>
				<li class="detail-strong">○ What is the joy of donation?</li>
				<li>
					<div class="item-text">
						<br>속담에 "콩 한쪽도 나눠 먹는다." 라는 말 들어보셨나요?<br> 이 속담은 서로 돕고 어려울
						때에 서로에게 힘이 될 수 있다는 뜻으로 어려울 때일수록 서로 돕고 잘 살아보자는 의미로 쓰입니다. 기부는 삶의
						만족감을 높이고 우울감을 경감하는 효과가 있음을 확인한 연구 결과가 있을 만큼 긍정적인 사고를 하는데 많은 도움을
						준다고 합니다. 긍정적인 사고는 먼저 행복감을 느끼게 하며, 스트레스에 더 잘 대처하게 도움을 준다고 합니다. 남을
						돕는 활동을 하거나 보기만 하여도 면역항체인 lg A 수치가 높게 올라 신체의 면역력이 증가되는 효과가 있다고 합니다.
					</div>
				</li>
				<li>
					<div class="item-img"
						style="background-image: url('./img/with2.jpg');"></div>
				</li>
			</ul>
		</div>
		<div>
			<span class="detail-strong" style="margin-right: 10%;"> " 몸도
				마음도 건강해지는 기부 활동을 통해 밝은 세상을 만들어가요 " </span>
		</div>

	</div>

	<div class="donation_qna">
		<span class="detail-strong"
			style="color: #fff; font-family: 'NanumBarunGothic';">❔ 자주 묻는
			질문(FAQ)</span>
		<div class="tabs">
			<div class="tab">
				<input type="checkbox" id="chck1" class="inputFAQ"> <label
					class="tab-label" for="chck1">Q. &nbsp; 기부금 영수증을 다른 사람 이름으로
					발급 가능한가요?</label>
				<div class="tab-content">기부금 영수증은 다른 사람의 이름으로 변경하여 발급이 불가하며 본인
					명의로 발급됩니다. 본인 명의로 발급된 기부금 영수증은 연간 소득 금액 100만원 이하인 기본공제대상(배우자, 직계존속,
					직계비속, 형제자매 등)이 발급받은 것을 합산하여 공제가 가능합니다. 자세한 사항은 각 후원처 사이트에 문의
					부탁드립니다.</div>
			</div>
			<div class="tab">
				<input type="checkbox" id="chck2" class="inputFAQ"> <label
					class="tab-label" for="chck2">Q. &nbsp; 후원금이 어떻게 사용되는지 알고
					싶습니다.</label>
				<div class="tab-content">
					<a href="http://kfem.or.kr/?cat=74">▶ 환경운동연합</a> <br> <a
						href="http://greenfund.org/board/board.php?bo_table=bogo&cate=%EC%A7%80%EC%86%8D%EA%B0%80%EB%8A%A5%EB%B3%B4%EA%B3%A0%EC%84%9C">▶
						환경재단</a> <br> <a href="https://koreashe.org/about/#about04">▶
						숲과나눔</a> <br> 사업보고서와 소식지는 각 후원처의 링크를 첨부하오니, 확인 부탁드립니다.
				</div>
			</div>
			<div class="tab">
				<input type="checkbox" id="chck3" class="inputFAQ"> <label
					class="tab-label" for="chck3">Q. &nbsp; 후원 관련 1:1 문의를 하고
					싶은데 어떻게 하면 되나요?</label>
				<div class="tab-content">아나바다 메일 주소(anabada@anabada.com)로 문의
					주시면 확인 후 최대한 빠르게 답변 드리겠습니다.</div>
			</div>
		</div>
	</div>


	<!--TOP 버튼-->
	<div class="floating">
		<a href="#" class="btn_gotop" id="click"> <span
			class="glyphicon glyphicon-chevron-up"> <img
				src="./img/top-arrow-svgrepo-com.svg"
				style="width: 50px; height: 50px;">
		</span>
		</a>
	</div>


	<!--후원 사이트 모달창-->
	<div class="modal fade" id="moaModal1" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 750px; height: 800px;">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modal-img"
						style="background-image: url('./img/kfem.JPG');"></div>
					<div style="margin: 10px 0 10px 10px;">
						<div class="detail-strong" style="margin: 20px 0 0 0;">환경운동연합</div>
						<div>
							<h5>전국 8개의 환경단체들이 통합되어 아시아 최대 규모의 환경단체</h5>
						</div>
					</div>

					<div class="modal-detail first">
						환경운동연합은 창립 이후 지금까지 현장성, 대중성, 전문성을 바탕으로 아시아 최대의 환경단체로 성장했습니다. <br>
						현재 환경연합에는 현장을 지키는 전국의 풀뿌리 지역조직 54개와 시민환경연구소, 환경법률센터 등 전문성과 대중성을
						높이기 위한 전문기관과 협력기관들이 있습니다.또한 핵물질 이용 반대, 멸종위기종 및 고래 보호, 기후변화 대응과 같은
						지구환경문제 해결을 위하여 리우회의 참석 등 국제 연대에 적극적으로 참여하고 있습니다.
					</div>
					<div class="modal-detail second">
						사단법인 환경운동연합 대표 : 이철수 <br>고유번호 : 275-82-00406 <br>대표전화 :
						02-735-7000 <br>Fax : 02-735-7020<br> 주소 : 03039 서울특별시
						종로구 필운대로 23, 2층(누하동) <br> 대표 메일 : web@kfem.or.kr <br>후원
						: 우리은행 1005-801-085917(예금주 : 사단법인 환경운동연합)
					</div>
					<div style="margin: 10px;">
						<a href="http://kfem.or.kr/" target="_blank" title="홈페이지 이동"
							class="button btnFade btnOrange">홈페이지 이동</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="moaModal2" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 750px; height: 800px;">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modal-img"
						style="background-image: url('./img/greenfund.JPG');"></div>
					<div style="margin: 10px 0 10px 10px;">
						<div class="detail-strong" style="margin: 20px 0 0 0;">환경재단</div>
						<div>
							<h5>지속가능한 지구를 위해 정부·기업·시민사회와 함께하는 실천공동체</h5>
						</div>
					</div>

					<div class="modal-detail first">환경재단은 환경에 관한 연구와 교육, 환경 보호 및
						향상을 위한 활동을 지원함으로써 지속가능한 사회를 지향하고 국제 환경교류를 촉진하고자 설립한 공익재단입니다. 환경재단은
						의사결정기구인 이사회와 운영자문기구인 운영위원회를 통해 각 분야의 전문가들이 함께 하고 있습니다.</div>
					<div class="modal-detail second">
						재단법인 환경재단 대표 : 최열<br> 사업자등록번호 : 101-82-09896 <br>대표전화 :
						02-2011-4300 <br>Fax : 02-725-4840 <br>주소 : 서울시 중구 을지로
						16 백남빌딩 7층 <br>대표 메일 : greenfund@greenfund.org

					</div>
					<div class="modal-detail-bottom">
						<a href="http://greenfund.org/" target="_blank" title="홈페이지 이동"
							class="button btnFade btnOrange">홈페이지 이동</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="moaModal3" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 750px; height: 800px;">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modal-img"
						style="background-image: url('./img/koreashe.JPG');"></div>
					<div style="margin: 10px 0 10px 10px;">
						<div class="detail-strong" style="margin: 20px 0 0 0;">재단법인
							숲과 나눔</div>
						<div>
							<h5>우리의 미래를 숲과 같이 건강하고 안전하며 지속가능하게 만들 수 있도록 노력하는 단체</h5>
						</div>
					</div>

					<div class="modal-detail first">숲과나눔은 가정·일터·지역사회의 환경이 숲과 같이
						건강하고 안전하며 지속가능한 곳이어야 한다는 우리 사회의 여망이 모여 만들어진 비영리 재단입니다.숲과나눔은 ‘숲’의
						미덕과 ‘나눔’의 힘을 믿습니다. 환경·안전·보건 분야에서 주도적 역할을 할 인재를 양성하고, 합리적인 문제 해결과
						대안, 담론을 개발하고 확산시키기 위해 사회의 여러 구성원과 협력하고 소통할 수 있도록 실천하며 나아가겠습니다.</div>
					<div class="modal-detail second">
						재단법인 숲과나눔 대표 : 장재연 <br>사업자등록번호 : 624-82-00248 <br>대표전화 :
						02-6318-9000 <br>주소 : 06737 서울시 서초구 남부순환로 2606 금정빌딩 6층 <br>대표
						메일 : koreashe@koreashe.org

					</div>
					<div style="margin: 10px;">
						<a href="https://koreashe.org/" target="_blank" title="글쓰기"
							class="button btnFade btnOrange">홈페이지 이동</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="./HeaderFooter/Footer.jsp"%>
</body>

</html>