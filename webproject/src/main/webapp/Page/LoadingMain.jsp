<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/zepto/1.2.0/zepto.min.js">
  </script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.0/gsap.min.js">
  </script>
<script
	src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/ScrollToPlugin3.min.js">
  </script>


<style>
@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap')
	;

body, html {
	cursor:
		url("https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FxKys9%2FbtrNOTLRm4B%2FGuodC2Nj4iuqBo8s8jfgy1%2Fimg.png"),
		auto;
	background: rgb(16, 106, 225);
	overflow-x: hidden;
	overflow-y: scroll;
	font-family: 'Montserrat', sans-serif;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	width: 100%;
	height: 100%;
}

body {
	-ms-overflow-style: none;
}

::-webkit-scrollbar {
	display: none;
}

.titleANABADA {
	font-size: 8vw;
}

.subtitle {
	font-size: 3vw;
}

.scrollDist {
	width: 100%;
	height: 200%;
	position: absolute;
}

svg {
	position: fixed;
}

svg g:hover text {
	fill: #ec008c;
	opacity: 1;
	cursor:
		url("https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FxKys9%2FbtrNOTLRm4B%2FGuodC2Nj4iuqBo8s8jfgy1%2Fimg.png"),
		auto;
}
</style>
<title>StartMain</title>
</head>

<body>
	<div class="scrollDist"></div>

	<svg class="container" width="100%" height="100%">
    <defs>
      <mask id="m"></mask>
      <g id="titleANABADA">
        <text class="titleANABADA" x="5%" y="5%" fill="#162a43"
			letter-spacing="0.15">ANABADA</text>
      </g>

      <g id="subtitle">
        <rect width="750" height="120" text-anchor="middle"
			alignment-baseline="middle" fill="none" />
        <text class="subtitle" text-anchor="middle"
			alignment-baseline="middle" fill="#fff">Our Choice for Global
          Warming</text>
      </g>
    </defs>

    <use xlink:href="#subtitle" x="50%" y="50%"
			transform="translate(-375 0)" />

    <g mask="url(#m)">
      <rect fill="#fff" width="100%" height="100%" />
      <use xlink:href="#titleANABADA" x="45%" y="50%"
			transform="translate(-375 0)" />
    </g>


  </svg>
	<svg class="start" viewBox="0 0 300 150">
    <g>
      <a href="../Page/tradeListPage.do?category=7">
        <text x="80%" y="90%" fill="#fff">START</text>
      </a>
    </g>
  </svg>

	<script>
    var cw = window.innerWidth,
      ch = window.innerHeight,
      nWaves = 5,
      waves = [],
      amp = 10,
      speed = 0.4,
      detail = 30,
      waveY = 0;

    for (var w = 0; w < nWaves; w++) {
      var p = document.createElementNS("http://www.w3.org/2000/svg", "polygon");
      waves.push(p);
      $('#m').append(p);
      gsap.set(p, { attr: () => { return (w == 0) ? { fill: '#fff' } : { fill: 'none', stroke: '#fff', 'stroke-dasharray': '2 4', 'stroke-width': 3 - w / nWaves * 3 } } });
    }


    gsap.timeline({ defaults: { duration: 1 }, delay: 0.9 })
      .from('.txt1', { opacity: 0, ease: 'power2.inOut' }, 0)
      .to(window, { scrollTo: ch / 2 }, 0);

    gsap.ticker.add(drawWave);

    function drawWave(t) {
      if (waveY != -$(window).scrollTop()) gsap.to(window, { duration: 1, waveY: Math.round($(window).scrollTop()) });

      for (var k = 0; k < nWaves; k++) {
        var p = waves[k],
          offset = (1 - k / nWaves) * nWaves / 6,
          pts = '';

        for (var i = -1; i < (cw + detail); i += detail) {
          var y = ch - waveY;
          y += Math.sin(i * 0.003 - t / speed + offset) * amp;
          y += Math.sin(i * 0.004 - t / speed + offset) * amp;
          y += Math.sin(i * -0.011 - t / speed + 20 + offset) * amp;
          pts += i.toFixed(2) + ',' + y.toFixed(2) + ' ';
        }

        gsap.set(p, { attr: { points: '-20,-20 -20,' + ch / 2 + ' ' + pts + ' ' + cw + ',-20' } });
      }
    }

    $(window).on('resize', () => { cw = window.innerWidth; ch = window.innerHeight; })

  </script>


	<script>
  
</script>
</body>

</html>
</body>
</html>