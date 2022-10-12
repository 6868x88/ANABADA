<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./css/WhoWeAre.css">
    <script src="https://kit.fontawesome.com/e4982ae3c4.js" crossorigin="anonymous"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.1/gsap.min.js"></script>
    <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/ScrollTrigger.min.js"></script>
    <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/ScrollToPlugin3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/zepto/1.2.0/zepto.min.js"></script>
    <title>WhoWeAre?</title>

</head>

<body style="overflow-x: hidden">

    <header>
        <nav class="header">

            <div class="TitleA">
                <img class="LogoImg" src="./img//LogoPolarBear.png">
                <span><a href="#"> ANABADA</a></span>
            </div>

            <div class="TitleB">
                <ul class="menuA">
                    <li><a href="#ConA">Who We Are</a></li>
                    <li><a href="#ConB-Mockup">Why We Made</a></li>
                    <li><a href="#ConC">What We Do</a></li>
                </ul>

                <ul class="menuB">
                    <li><a href="#" class=" fa-solid fa-bars"></a></li>
                    <ul class="menuC">
                        <li><a href="#ConA">Who We Are</a></li>
                        <li><a href="#ConB-Mockup">Why We Made</a></li>
                        <li><a href="#ConC">What We Do</a></li>
                    </ul>
                </ul>
            </div>
        </nav>
    </header>



    <section id="ConA" class="ConA">
        <div class="scrollDist"></div>
        <div class="main">
            <svg viewBox="0 0 1200 900" xmlns="http://www.w3.org/2000/svg">

                <mask id="m">
                    <g class="cloud">
                        <rect fill="#fff" width="100%" height="801" y="799" />
                        <image xlink:href="https://assets.codepen.io/721952/cloud1Mask.jpg" width="1200"
                            height="1000" />
                    </g>

                </mask>
                <image class="pollution" xlink:href="https://cdn.pixabay.com/photo/2018/03/31/11/37/polar-bear-3277930_960_720.jpg
            " width="1200" height="800" />

                <g mask="url(#m)">
                    <rect fill="#fff" width="100%" height="100%" />
                    <text x="600" y="550" text-anchor="middle" alignment-baseline="middle" fill="#162a43">ANABADA</text>

                    <text class="text2" x="600" y="650" text-anchor="middle" alignment-baseline="middle"
                        fill="#162a43">- Our Choice for Global Warming-</text>
                </g>
            </svg>
        </div>
        <script>
            /*WhoWeAre*/

            gsap.set('.main', { background: '#fff', width: '100%', maxWidth: '1920px', height: '100%', top: 0, left: '50%', x: '-50%' })
            gsap.set('.scrollDist', { width: '100%', height: '250%' })
            gsap.timeline({ scrollTrigger: { trigger: '.scrollDist', start: 'top top', end: 'bottom bottom', scrub: 1 } })
                .fromTo('.cloud', { y: 0 }, { y: -700 }, 0)

        </script>
    </section>



    <section class="ConB">
        <div class="ConBPic">
            <img alt="" src="/WebProject/img/ConBPic1.jpg" />
            <img alt="" src="/WebProject/img/ConBPic2.jpg" />
            <img alt="" src="/WebProject/img/ConBPic3.jpg" />
        </div>
        <section id="ConB-Mockup" class="ConB-Mockup">
            <div class="ConBwrap">

                <h1 class="title lineA"> 01. Why We Made 'ANABADA'?</h1>
                <div class="ANABADA_mean">
                    <p><strong><span style="color: rgb(255, 255, 255); background-color: rgb(100, 132, 196);">&nbsp;
                                아: 아껴쓰고 &nbsp;</span></strong></span></p>
                    <pre></pre>
                    <p>깨끗하게 아껴쓴 물품, 이제 버리지 말고 거래하세요!</p>
                    <pre></pre>
                    <pre></pre>

                    <p style="text-align: center;"><span style="font-size: 18px;"><strong><span
                                    style="color: rgb(255, 255, 255); background-color: rgb(100, 132, 196);">&nbsp;
                                    나: 나눠쓰고 &nbsp;</span></strong></span></p>
                    <pre></pre>
                    <p>무료나눔으로 이웃과 나눠써요.</p>
                    <pre></pre>
                    <pre></pre>

                    <p style="text-align: center;"><span style="font-size: 18px;"><strong><span
                                    style="color: rgb(255, 255, 255); background-color: rgb(100, 132, 196);">&nbsp;
                                    바: 바꿔쓰고 &nbsp;</span></strong></span></p>
                    <pre></pre>
                    <p>물물교환으로 안쓰는 물건을 바꿔써요.</p>
                    <pre></pre>
                    <pre></pre>

                    <p style="text-align: center;"><span style="font-size: 18px;"><strong><span
                                    style="color: rgb(255, 255, 255); background-color: rgb(100, 132, 196);">&nbsp;
                                    다: 다시쓰자 &nbsp;</span></strong></span></p>
                    <pre></pre>
                    <p>재사용함으로써 환경을 보호해요.</p>
                    <pre></pre>
                    <pre></pre>
                </div>

                <div class="WhyDo">
                    <h3> '아껴쓰고, 나눠쓰고, 바꿔쓰고, 다시쓰고'</h3>
                    <span>
                        이제는 나와 이웃, 지구를 위해 아나바다를 실천할 때입니다.<br>
                        지구온난화로 인한 이상기후, 자연 생태계 파괴, 심각한 식량안보의 위협까지...
                        <p></p>
                        1년간 이웃 간 중고거래로 자원 재사용을 통한 자원 순환 효과는<br> 5240만 그루 소나무를 심은 것과 같은 온실가스 732만 톤 저감 효과와
                        맞먹습니다.
                    </span>
                </div>

                <div class="WhatIsMean">
                    <pre></pre>
                    <pre></pre>
                    <pre></pre>
                    <h1>"</h1>
                    <span class="mean2">당신에게 필요없는 물건<br>
                        판매와 교환이 가능한<br>
                        <bold style="color:#0f66d1">"ANABADA"</bold>와 함께 하세요.
                    </span>
                    <pre></pre>
                    <h1>"</h1>
                </div>

                <section id="ConC" class="ConC">
                    <div class="ConC_wrap">
                        <h1 class="title lineB"> 02. What We Do?</h1>
                        <h2>- 진행중인 사업 갤러리 -</h2>

						<div class="container">
							<div class="images">
								<div class="imageFlex1">
									<img src="./img/ConC1.jpg"> <img
										src="./img/ConC2.jpg"> <img
										src="./img/ConC3.jpg">
								</div>
							</div>
							<div class="images">
								<div class="imageFlex2">
									<img src="./img/ConC4.jpg"> <img
										src="./img/ConC5.jpg"> <img
										src="./img/ConC6.jpg">
								</div>
							</div>
							<div class="images">
								<div class="imageFlex3">
									<img src="./img/ConC7.jpg"> <img
										src="./img/ConC8.jpg">

								</div>
							</div>
						</div>



                        <div class="WhatWeDo">
                            환경보호에 앞장서는 아나바다는<br> 수익금의 일부를 환경보호 단체에 기부하고 있습니다.<br>
                            뿐만 아니라 사회적 기업으로 지역 공동체 회복, 지속 가능한 일자리 제공,<br>
                            친환경 등 사회적 목표에도 최선을 다하고 있습니다.
                        </div>


                    </div>
                </section>

                <div class="Lets-Do ">
                    <pre></pre>
                    <pre></pre>
                    <pre></pre>중고 거래 및 나눔은 환경을 위한 <bold style="color:#8ba8cc">한 걸음</bold>입니다
                </div>
            </div>
            </div>



        </section>

