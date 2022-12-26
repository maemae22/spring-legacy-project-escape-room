<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<!-- 반응형 meta -->
<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1, user-scalable=yes">

<link rel="stylesheet" href="<c:url value="/css/fonte9d4.css?ver="/>"/>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.css"/>"/>
<link rel="stylesheet" href="<c:url value="/css/jquery-ui.css"/>"/>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>

<link rel="stylesheet" href="<c:url value="/css/style.css?ver=171755"/>"/>
<link rel="stylesheet" href="<c:url value="/css/common.css?ver=171755"/>"/>
<link rel="stylesheet" href="<c:url value="/css/auth.css?ver=171755"/>"/>
<link rel="stylesheet" href="<c:url value="/css/auth.join.css?ver=171755"/>"/>
<link rel="stylesheet" href="<c:url value="/css/auth.ceo.register.css?ver=171755"/>"/>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-179649937-1"></script>
<title>전국방탈출 - 방탈출카페의 모든 것</title>
</head>
<body class="auth">
	<div class="container">
		<div class="container_inner section section_agreement">
			<div class="fixing_wid">
				<div class="agreement_logo">
					<img src="<c:url value ="/images/auth/join_logo_back.png"/>" >
				</div>

				<form id="agreeFrm" class="agreeFrm" method="get" action="${pageContext.request.contextPath}/member/join" onsubmit="return agreeFrm_submit(this);">
					<input type="hidden" name="join_type" value="ceo_memb" />

					<div class="input_box">
						<div class="check_btn">
							<label id="label_agree_check_all" for="agree_check_all">
								<img class="check_off active" src="<c:url value ="/images/auth/check_off.png"/>" alt="" />
								<img class="check_on" src="<c:url value ="/images/auth/check_on.png"/>" alt="" />	
							</label>

							<span class="notice">이용약관,개인정보 수집 및 이용, 위치정보 이용약관, 프로모션 안내 메일 수신에 동의합니다.</span>

							<input type="checkbox" id="agree_check_all" class="agree_check" />
						</div>
					</div>

					<div class="input_box">
						<div class="check_btn">
							<label id="label_agree_check_1" for="agree_check_1">
								<img class="check_off active" src="<c:url value ="/images/auth/check_off.png"/>" alt="" />
								<img class="check_on" src="<c:url value ="/images/auth/check_on.png"/>" alt="" />
							</label>

							<span>열려라참깨 이용약관 동의</span>

							<input type="checkbox" id="agree_check_1" class="agree_check" />
						</div>

						<div class="agree_doc service" contenteditable="true" disabled>
							<h1>열려라 참깨 사용자 이용약관</h1>
							<h2>[1장 총칙]</h2>
							<strong class="articie">제 1 조 (목적)</strong>
							<p class="introduction">
								본 약관은 이용고객이 주식회사 열려라참깨(이하 "회사"라 합니다)이 제공하는 “서비스”를 이용함에 있어 회사와 이용고객간의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다.
							</p>

							<strong class="articie">제 2 조 (정의)</strong>
							<p class="introduction">
								본 약관에서 사용하는 주요 용어는 다음과 같습니다.
							</p>
							<ul class="list-1">
								<li>① "열려라 참깨" 이라 함은 전국에 있는 방탈출 카페에 대한 다양한 정보를 이용고객에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화, 용역을 거래할 수 있도록 회사가 운영하는 웹사이트, APP 플랫폼을 말하며, 아울러”열려라 참깨”을 운영하는 사업자의 의미로도 사용합니다.</li>
								
								<li>② "서비스" 라 함은, 구현되는 단말기(PC, 태블릿, 휴대용 단말기 등의 각종 유무선 장치)와 상관없이 브랜드명 “열려라 참깨”을 사용하여 “회사”가 제공하는 제반 서비스를 말합니다.</li>
								
								<li>③ "이용고객" 이라 함은, 회사의 "서비스"에 접속하여 본 약관에 따라 회사가 제공하는 서비스를 받는 일반 회원과 사업자 회원, 비회원을 말합니다.</li>
								
								<li>④ "업소 정보" 라 함은, "이용고객"이 "서비스"를 이용함에 있어 “서비스상”에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.</li>
							</ul>

							<strong class="articie">제 3 조 (약관의 게시, 효력 및 개정)</strong>
							<ul class="list-1">
								<li>① 회사는 본 약관의 내용을 이용고객이 회원가입을 할 때 고지하며, 원치 않을 시 가입을 철회할 수 있습니다..</li>
								
								<li>② 회사는 콘텐츠산업 진흥법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.</li>

								<li>③ 회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 삼십(30)일 전부터 일정기간 서비스 내 공지하고, 로그인시 동의창 등의 전자적 수단을 통해 고지합니다.</li>
								
								<li>④ 회사가 전항에 따라 이용고객에게 통지하면서 공지 또는 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 않으면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도, 이용고객이 명시적으로 거부의 의사 표시를 하지 않은 경우에는 변경된 약관을 승인한 것으로 봅니다.</li>
								
								<li>⑤ 이용고객이 개정약관에 동의하지 않을 경우 이용고객은 제26조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.</li>
								
								<li>⑥ 본 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다.</li>
							</ul>

							<h2>[2장 서비스의 이용]</h2>
							<strong class="articie">제 4 조 (서비스 이용)</strong>
							<ul class="list-1">
								<li>① 서비스 이용은 회사의 서비스 사용 승낙 직후부터 가능합니다.</li>
								<li>② 서비스 이용시간은 회사의 업무상 또는 기술상 불가능한 경우를 제외하고는 연중무휴 1일 24시간(00:00-24:00)으로 함을 원칙으로 합니다. 다만, 서비스 설비의 정기점검 등의 사유로 회사가 서비스를 특정범위로 분할하여 별도로 날짜와 시간을 정할 수 있습니다.</li>
							</ul>

							<strong class="articie">제 5 조 (서비스 내용 변경통지 등)</strong>
							<p class="introduction">
								회사가 서비스 내용을 변경하거나 종료하는 경우 회사는 서비스의 공지사항, SMS 등의 전자적 방식을 통하여 서비스 내용의 변경 사항 또는 종료를 통지할 수 있습니다. 
							</p>

							<strong class="articie">제 6 조 (서비스 이용의 제한 및 중지)</strong>
							<ul class="list-1">
								<li>① 회사는 다음 사유가 발생한 경우에는 이용고객의 서비스 이용을 제한하거나 중지시킬 수 있습니다.
									<ul class="list-2">
										<li>1. 이용고객이 회사 서비스의 운영을 고의 또는 중과실로 방해하는 경우</li>
										<li>2. 이용고객이 제8조의 의무를 위반한 경우</li>
										<li>3. 서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우</li>
										<li>4. 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우</li>
										<li>5. 국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 때</li>
										<li>6. 기타 중대한 사유로 인하여 회사가 서비스 제공을 지속하는 것이 부적당하다고 인정하는 경우</li>
									</ul>
								</li>
								

								<li>② 회사는 "주민등록법"을 위반한 명의도용 및 결제도용, 전화번호 도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 서비스 이용을 통해 획득한 혜택 등도 모두 소멸되며, 회사는 이에 대해 별도로 보상하지 않습니다.</li>

								<li>③ 회사는 본 조에 따라 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한 기간 등을 제5조 [서비스 내용 변경통지 등]에 따라 이용고객에게 통지합니다.</li>

								<li>④ 이용고객은 본 조에 따른 이용제한 등에 대해 회사가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 회사가 인정하는 경우 회사는 즉시 서비스의 이용을 재개합니다.</li>
							</ul>

							<strong class="articie">제 7 조 (권리의 귀속 및 저작물의 이용)</strong>
							<ul class="list-1">
								<li>① 회사가 이용고객에게 제공하는 각종 서비스에 대한 저작권을 포함한 일체의 권리는 회사에 귀속되며 이용고객이 서비스를 이용하는 과정에서 작성한 게시물에 대한 저작권을 포함한 일체에 관한 권리는 별도의 의사표시가 없는 한 해당 이용고객에게 귀속됩니다.</li>

								<li>② 회사는 서비스의 운영, 전시, 전송, 배포, 홍보 의 목적으로 이용고객의 별도의 허락 없이 무상으로 저작권법에 규정하는 공정한 관행에 합치되게 합리적인 범위 내에서 다음과 같이 이용고객이 등록한 게시물을 사용할 수 있습니다.</li>
							</ul>
							<p class="notice">– 다 음 –<br />서비스 내에서 이용고객의 게시물의 복제, 수정, 개조, 전시, 전송, 배포 및 저작물성을 해치지 않는 범위 내에서의 편집 저작물 작성 미디어, 통신사 등 서비스 제휴 파트너에게 회원의 게시물 내용을 제공, 전시 혹은 홍보하게 하는 것.</p>

							<strong class="articie">제 8 조 (회원 및 비회원 이용고객의 의무)</strong>
							<ul class="list-1">
								<li>① 회원 및 비회원 이용고객은 다음 행위를 하여서는 안 됩니다.
									<ul class="list-2">
										<li>1. 회원정보에 허위 내용을 등록하는 행위</li>
										<li>2. 회사의 서비스에 게시된 정보를 변경하거나 서비스를 이용하여 얻은 정보를 회사의 사전 승낙 없이 영리 또는 비영리의 목적으로 복제, 출판, 방송 등에 사용하거나 제3자에게 제공하는 행위</li>
										<li>3. 회사 기타 제3자의 명예를 훼손하거나 지적재산권을 침해하는 등 회사나 제3자의 권리를 침해하는 행위</li>
										<li>4. 다른 회원의 회원 정보 또는 이용고객의 정보를 도용하여 부당하게 서비스를 이용한 경우</li>
										<li>5. 정크메일(junk mail), 스팸메일(spam mail), 행운의 편지(chain letters), 피라미드 조직에 가입할 것을 권유하는 메일, 외설 또는 폭력적인 메시지 ·화상·음성 등이 담긴 메일을 보내거나 기타 공서양속에 반하는 정보를 공개 또는 게시하는 행위</li>
										<li>6. 정보통신망이용촉진및정보보호등에관한법률 등 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 등)를 전송하거나 게시하는 행위</li>
										<li>7. 공공질서 또는 미풍양속에 위배되는 내용의 정보, 문장, 도형, 음성 등을 유포하는 행위</li>
										<li>8. 회사의 직원이나 서비스의 관리자를 가장하거나 사칭하여 또는 타인의 명의를 모용하여 글을 게시하거나 메시지를 발송하는 행위</li>
										<li>9. 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하거나 전자우편, SMS로 발송하는 행위</li>
										<li>10. 스토킹(stalking) 등 다른 이용고객의 서비스 이용을 방해하는 행위</li>
										<li>11. 다른 이용고객의 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위</li>
										<li>12. 불특정 다수의 이용고객을 대상으로 하여 광고 또는 선전을 게시하거나 스팸메일을 전송하는 등의 방법으로 회사에서 제공하는 서비스를 이용하여 영리목적의 활동을 하는 행위</li>
										<li>13. 현행 법령, 회사가 제공하는 서비스에 정한 약관 기타 서비스 이용에 관한 규정을 위반하는 행위</li>
									</ul>
								</li>
								<li>② 회사는 회원 또는 비회원 이용고객이 제1항의 행위를 하는 경우 서비스의 이용을 제한하거나 일방적으로 본 계약을 해지할 수 있습니다.</li>
							</ul>

							<strong class="articie">제 9 조 (회사의 의무)</strong>
							<ul class="list-1">
								<li>① 회사는 회사의 서비스 제공 및 보안과 관련된 설비를 지속적이고 안정적인 서비스 제공에 적합하도록 유지, 점검 또는 복구 등의 조치를 성실히 이행하여야 합니다.</li>
								<li>② 회사는 이용고객이 원하지 아니하는 영리 목적의 광고성 전자우편이나 SMS를 발송하지 않습니다.</li>
								<li>③ 회사는 서비스의 제공과 관련하여 알게 된 이용고객의 개인정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않고, 이를 보호하기 위하여 노력합니다. 회원의 개인정보보호에 관한 기타의 사항은 정보통신망 이용촉진 및 정보보호등에 관한 법률 등 관계법령 및 회사가 별도로 정한 “개인정보취급방침”에 따릅니다.</li>
							</ul>

							<strong class="articie">제 10 조 (열려라 참깨과 연결 웹사이트 간의 관계)</strong>
							<ul class="list-1">
								<li>① 열려라 참깨과 연결된 웹사이트란 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우를 말합니다.</li>
								<li>② 회사는 연결된 웹사이트가 독자적으로 제공하는 재화, 용역으로 이용고객과 해당 웹사이트가 행하는 거래에 대해서 보증책임을 포함하여 일체의 책임을 지지 않습니다 </li>
							</ul>

							<strong class="articie">제 11 조 (양도 금지)</strong>
							<p class="introduction">이용고객의 서비스 받을 권리는 이를 양도 내지 증여하거나 질권의 목적으로 제공 할 수 없습니다</p>

							<strong class="articie">제 12 조 (주문거래 기록의 보관)</strong>
							<p class="introduction">"주문거래"의 거래기록은 전자상거래등에서의 소비자보호에 관한 법률에 규정에 의해 일정기간 동안 보존 할 수 있습니다.</p>

							<strong class="articie">제 13 조 (주문거래 시 가능한 결제 수단)</strong>
							<p class="introduction">회사에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 하나로 할 수 있습니다.</p>
							<p class="introduction">- 신용카드 결제, 가상계좌 결제, 포인트, 기타 회사가 추가 지정하는 결제수단</p>

							<strong class="articie">제 14 조 (주문거래 시 구매결정 및 송금)</strong>
							<p class="introduction">이용고객은 본 약관 및 회사가 정한 규정에 따라 아래 절차를 거쳐 "주문거래"를 할 수 있습니다.</p>
							<ul class="list-1">
								<li>- 재화 또는 용역의 선택</li>
								<li>- 재화 또는 용역 금액의 확인</li>
								<li>- 결제방법의 선택</li>
							</ul>

							<strong class="articie">제 15 조 (주문거래시 취소 및 환불)</strong>
							<ul class="list-1">
								<li>① 회사의 "주문거래"시 취소 및 환불 규정은 전자상거래등의 소비자보호에 관한 법률 등 관련 법령을 준수합니다.</li>
								<li>② ②	"주문거래"시 거래의 성격에 따라 회사는 별도의 취소 및 환불 관련 규정을 정할 수 있으며, 이 경우 별도 계약 및 이용조건상의 취소 및 환불 규정이 우선 적용됩니다.</li>
								<li>③ ③	"주문거래"시 신용카드결제는 신용카드사의 환불기준에 의거하여 시일이 소요될 수 있습니다.</li>
							</ul>

							<strong class="articie">제 16 조 (포인트)</strong>
							<ul class="list-1">
								<li>① 회사는 플랫폼에 리뷰 작성, 글 작성 등 다양한 활동을 하는 회원에게 포인트를 지급할 수 있습니다.</li>

								<li>② 포인트는 비현금성으로, 전국방탈출 제휴 서비스에서 할인을 제공 받거나 다른 이벤트에 사용할 수 있습니다.</li>

								<li>③ 포인트는 본인만 사용 가능하며, 어떠한 경우에도 타인에게 실질적으로 매매 또는 양도할 수 없습니다.</li>

								<li>④ 포인트의 유효기간은 적립한 해로부터 3년입니다. (ex. 2019년 10월 적립했을 경우 2022년 12월 31일 소멸)</li>

								<li>⑤ 포인트는 현금 및 현금화되는 수단으로 환급될 수 없으며, 사용 기간이 만료되거나 이용계약이 종료되면 소멸합니다.</li>
							</ul>

							<h2>[3장 위치기반서비스]</h2>
							<strong class="articie">제 17 조 (위치기반서비스의 내용)</strong>
							<p class="introduction">회사는 위치정보사업자로부터 제공받은 위치정보수집대상의 위치정보를 이용하여 다음 각 호와 같은 내용의 위치기반서비스를 제공합니다.</p>
							<ul class="list-1">
								<li>1. 현재 위치를 활용한 검색결과 제공: 개인위치정보주체의 현 위치를 기준으로 근거리 및 방문이 가능한 업체 등의 검색결과를 제공합니다.</li>
							</ul>

							<strong class="articie">제 18 조 (위치정보 수집방법)</strong>
							<p class="introduction">회사는 다음과 같은 방식으로 개인위치정보를 수집합니다</p>
							<ul class="list-1">
								<li>1.휴대폰 단말기를 이용한 기지국 기반(Cell ID방식)의 실시간 위치정보 수집</li>
								<li>2.GPS칩이 내장된 전용 단말기를 통해 수집되는 GPS 정보를 통한 위치정보 수집</li>
								<li>3.Wi-Fi칩이 내장된 전용 단말기를 통해 수집되는 WPS 정보를 통한 위치정보 수집</li>
								<li>4.기타 위치를 식별할 수 있는 장치를 통해 수집되는 위치정보 수집</li>
							</ul>

							<strong class="articie">제 18 조 (위치기반서비스의 이용)</strong>
							<ul class="list-1">
								<li>① 위치기반서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 회사의 업무상이나 기술상의 이유로 서비스가 일지 중지될 수 있고, 또한 운영상의 목적으로 회사가 정한 기간에는 서비스가 일시 중지될 수 있습니다. 이러한 경우 회사는 사전 또는 사후에 이를 공지합니다.</li>
								<li>② 회사는 위치기반서비스를 일정범위로 분할하여 각 범위 별로 이용 가능한 시간을 별도로 정할 수 있으며 이 경우 그 내용을 공지합니다.</li>
								<li>③ 회사는 전시·사변·천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신사업자가 전기통신서비스를 중지하는 등 기타 부득이한 사유가 있는 경우에는 위치기반서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.</li>
								<li>④ 회사는 제4항의 규정에 의하여 위치기반서비스의 이용을 제한하거나 정지한 때에는 그 사유 및 제한기간 등을 지체 없이 이용고객에게 알리도록 노력해야 합니다.</li>
								<li>⑤ 제3항에 의한 장애로 인하여 위치기반서비스가 제한 또는 정지된 경우에 회사는 일체의 책임을 지지 않습니다.</li>
							</ul>

							<strong class="articie">제 19 조 (위치기반서비스의 이용)</strong>
							<ul class="list-1">
								<li>① 위치기반서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 회사의 업무상이나 기술상의 이유로 서비스가 일지 중지될 수 있고, 또한 운영상의 목적으로 회사가 정한 기간에는 서비스가 일시 중지될 수 있습니다. 이러한 경우 회사는 사전 또는 사후에 이를 공지합니다.</li>

								<li>② 회사는 위치기반서비스를 일정범위로 분할하여 각 범위 별로 이용 가능한 시간을 별도로 정할 수 있으며 이 경우 그 내용을 공지합니다</li>

								<li>③ 회사는 전시·사변·천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신사업자가 전기통신서비스를 중지하는 등 기타 부득이한 사유가 있는 경우에는 위치기반서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.</li>

								<li>④ 회사는 제4항의 규정에 의하여 위치기반서비스의 이용을 제한하거나 정지한 때에는 그 사유 및 제한기간 등을 지체 없이 이용고객에게 알리도록 노력해야 합니다.</li>

								<li>⑤ 제3항에 의한 장애로 인하여 위치기반서비스가 제한 또는 정지된 경우에 회사는 일체의 책임을 지지 않습니다.</li>
							</ul>

							<strong class="articie">제 20 조 (개인위치정보주체의 권리)</strong>
							<li>① 개인위치정보를 이용하는 회사는 아래와 같습니다.
								<ul class="list-2">
									<li>가. 상호 : 주식회사 열려라참깨</li>
									<li>나. 대표자: 조준호</li>
									<li>다. 주소 : 서울특별시 서초구 강남대로 369, 12층 1378호(서초동, 에이플러스에셋타워)</li>
									<li>라. 대표전화: 02-6337-3400</li>
								</ul>
							</li>

							<li>② 회사는 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 미리 이용약관에 명시한 후 개인위치정보주체의 동의를 얻어야 합니다.</li>

							<li>③ 이용고객 및 법정대리인의 권리와 그 행사방법은 제소 당시의 이용고객의 주소에 의하며, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용고객의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할 법원에 제기합니다.</li>

							<li>④ 회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집∙이용∙제공사실 확인자료를 위치정보시스템에 자동으로 기록하며, 1년간 보관합니다.</li>

							<li>⑤ 회사는 개인위치정보를 이용고객이 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신 단말장치로 매회 이용고객에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다. 단, 다음 각 호의 어느 하나에 해당하는 경우에는 이용고객이 미리 특정하여 지정한 통신 단말장치 또는 전자우편주소로 통보합니다.
								<ul class="list-2">
									<li>1. 개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우</li>
									<li>2. 이용고객이 온라인 게시 등의 방법으로 통보할 것을 미리 요청한 경우</li>
								</ul>
							</li>

							<strong class="articie">제21조 (개인위치정보주체의 권리)</strong>
							<ul class="list-1">
								<li>① 이용고객은 회사에 대하여 언제든지 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치 정보의 제3자 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 이 경우 회사는 수집한 개인위치정보 및 위치정보 이용, 제공사실 확인자료를 파기합니다.</li>
								<li>② 이용고객은 회사에 대하여 언제든지 개인위치정보의 수집, 이용 또는 제공의 일시적인 중지를 요구할 수 있으며, 회사는 이를 거절할 수 없고 이를 위한 기술적 수단을 갖추고 있습니다.</li>
								<li>③	이용고객은 회사에 대하여 아래 각 호의 자료에 대한 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 사유 없이 이용고객의 요구를 거절할 수 없습니다.
									<ul class="list-2">
										<li>1. 본인에 대한 위치정보 수집, 이용, 제공사실 확인자료</li>
										<li>2. 본인의 개인위치 정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법률 규정에 의하여 제 3자에게 제공된 이유 및 내용</li>
									</ul>
								</li>
							</ul>

							<strong class="articie">제22조 (법정대리인의 권리)</strong>
							<ul class="list-1">
								<li>① 회사는 14세 미만의 이용고객에 대해서는 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제 3자 제공에 대한 동의를 당해 이용고객과 당해 이용고객의 법정대리인으로부터 동의를 받아야 합니다. 이 경우 법정대리인은 제7조에 의한 이용고객의 권리를 모두 가집니다.</li>
								
								<li>
									② 회사는 14세 미만의 아동의 개인위치정보 또는 위치정보 이용∙제공사실 확인자료를 이용 약관에 명시 또는 고지한 범위를 넘어 이용하거나 제3자에게 제공하고자 하는 경우에는 14세미만의 아동과 그 법정대리인의 동의를 받아야 합니다. 단, 아래의 경우는 제외합니다.
									<ul class="list-2">
										<li>1. 위치정보 및 위치기반서비스 제공에 따른 요금정산을 위하여 위치정보 이용, 제공사실 확인자료가 필요한 경우</li>
										<li>2. 통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우</li>
									</ul>
								</li>
							</ul>

							<strong class="articie">제23조 (8세 이하의 아동 등의 보호의무자의 권리)</strong>
							<ul class="list-1">
								<li>
									① 회사는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동 등”이라 한다)의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.
									<ul class="list-2">
										<li>1. 8세 이하의 아동</li>
										<li>2. 금치산자</li>
										<li>
											3. 장애인복지법 제2조 제2항 제2호의 규정에 의한 정신적 장애를 가진 자로서 장애인고용촉진 및 직업재활법 제2조 제2호의 규정에 의한 중증장애인에 해당하는 자(장애인 복지법 제29조의 규정에 의하여 장애인 등록을 한 자에 한한다.)
										</li>
									</ul>
								</li>
								
								<li>
									② 회사는 14세 미만의 아동의 개인위치정보 또는 위치정보 이용∙제공사실 확인자료를 이용 약관에 명시 또는 고지한 범위를 넘어 이용하거나 제3자에게 제공하고자 하는 경우에는 14세미만의 아동과 그 법정대리인의 동의를 받아야 합니다. 단, 아래의 경우는 제외합니다.
									<ul class="list-2">
										<li>1. 위치정보 및 위치기반서비스 제공에 따른 요금정산을 위하여 위치정보 이용, 제공사실 확인자료가 필요한 경우</li>
										<li>2. 통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우</li>
									</ul>
								</li>

								<li>
									③ 보호의무자는 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 개인위치정보주체 권리의 전부를 행사할 수 있습니다. 
								</li>
							</ul>

							<strong class="articie">제24조 (위치정보관리책임자의 지정)</strong>
							<ul class="list-1">
								<li>① 회사는 위치정보를 적절히 관리, 보호하고 개인위치정보주체의 불만을 원활히 처리할 수 있도록 실질적인 책임을 질 수 있는 지위에 있는 자를 위치정보관리 책임자로 지정해 운영합니다.</li>
								<li>② 위치정보관리책임자는 회사의 대표자가 담당합니다.</li>
							</ul>

							<h2>[4장 기타]</h2>
							<strong class="articie">제 25조 (개인정보보호)</strong>
							<ul class="list-1">
								<li>① 회사는 회원의 개인정보를 보호하기 위하여 정보통신망법 및 개인정보 보호법 등 관계 법령에서 정하는 바를 준수합니다</li>
								<li>② 회사는 회원의 개인정보를 보호하기 위해 "개인정보취급방침"을 수립하고 개인정보 보호 책임자를 지정하여 이를 게시하고 운영합니다.</li>
								<li>③ 회사의 공식 사이트 이외의 링크된 사이트에서는 회사의 개인정보취급방침이 적용되지 않습니다. 링크된 사이트 및 구매 상품이나 서비스를 제공하는 제3자의 개인정보 취급과 관련하여는 해당 사이트 및 제3자의 개인정보취급방침을 확인할 책임이 회원에게 있으며, 회사는 이에 대하여 책임을 부담하지 않습니다.</li>
								<li>④ 회사는 이용계약을 위하여 이용고객이 제공한 정보를 회사 서비스 운영을 위한 목적 이외의 용도로 사용하거나 이용고객의 동의 없이 제3자에게 제공하지 않습니다. 단, 다음 각 호의 경우에는 예외로 합니다.
									<ul class="list-2">
										<li>1. 법령에 근거하여 회원정보의 이용과 제3자에 대한 정보제공을 허용하고 있는 경우</li>
										<li>2. 배송업무 등에 필요한 최소한의 회원정보를 알려 주는 경우</li>
										<li>3. 기타 회사의 약관 및 정책에 따라 이용고객의 동의를 구한 경우</li>
									</ul>
								</li>
							</ul>

							<strong class="articie">제 26조 (이용계약의 해지)</strong>
							<ul class="list-1">
								<li>① 회원은 언제든지 회사가 정하는 절차에 따라 이용계약 해지 신청을 할 수 있으며, 회사는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.</li>
								<li>② 회원이 계약을 해지할 경우, 관련법 및 회사가 별도로 정하는 “개인정보취급방침”에 따라 회사가 회원의 개인정보 등을 보유하는 경우를 제외하고는 해지 즉시 회원의 모든 개인정보 등은 삭제됩니다.</li>
								<li>③ 회원이 계약을 해지하는 경우, 회원이 작성한 게시물 중 프로필 등과 같이 본인 계정에 등록된 게시물 일체는 삭제됩니다. 다만, 업소 정보에 남긴 후기의 경우엔 자동으로 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다.</li>
								<li>④ "회원"이 제8조의 규정을 위반한 경우 회사는 사전통보 없이 일방적으로 본 계약을 해지할 수 있고, 이로 인하여 서비스 운영에 손해가 발생한 경우 이에 대한 민, 형사상 책임도 물을 수 있습니다. </li>
							</ul>

							<h3>(시행일) 본 약관은 2018년 11월 1일부터 적용됩니다.</h3>
						</div>
					</div>
					
					<div class="input_box">
						<div class="check_btn">
							<label id="label_agree_check_2" for="agree_check_2">
								<img class="check_off active" src="<c:url value ="/images/auth/check_off.png"/>" alt="" />
								<img class="check_on" src="<c:url value ="/images/auth/check_on.png"/>" alt="" />		
							</label>

							<span>개인정보 수집 및 이용에 대한 안내</span>

							<input type="checkbox" id="agree_check_2" class="agree_check" />
						</div>

						<div class="agree_doc info" contenteditable="true" disabled>
							<h1>열려라 참깨 개인정보취급방침</h1>

							<p class="introduction">본사(이하 회사)가 제공하는 본 홈페이지의 서비스(이하 ‘서비스)는 인터넷 사용자들의 기본권인 사생활의 비밀과 자유 및 통신의 비밀을 보장하고,개인정보를 철저히 보호하여 풍요로운 인터넷 생활을 누릴 수 있도록 노력하고 있습니다.</p>

							<p class="introduction">회원님께서 제공해 주신 모든 정보는 "신용정보의 이용 및 보호에 관한 법률 제 23조"에 의해 철저히 관리되어야 하는 사항입니다. "서비스"는 불법도청, 통신상의 정보유출 등 헌법에 명시된 기본권의 침해를 원천적으로 막고, 회원정보를 보호하는 것을 제1의 운영원칙으로 삼아 다음과 같이 개인정보 취급방침을 명시합니다. 저희의 개인정보 취급방침은 내용이 수시로 변경될 수 있으므로 자주 사이트를 방문하셔서 숙지하시기 바랍니다 </p>

							<strong class="articie">1. 개인정보</strong>

							<p class="subject">생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 주민등록번호 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다)를 말합니다. </p>

							<strong class="articie">2. 본사가 수집하는 개인정보</strong>

							<p class="subeject">본사는 서비스의 원할한 제공에 필요한 최소한의 정보를 수집합니다.</p>
							<ul class="list-1">
						    	<li>닉네임</li>
						    	<li>E-mail</li>
						    	<li>휴대전화 번호</li>
						    </ul>

						   	<strong class="article">3. 개인정보의 수집 및 이용 목적</strong>
						   	<p class="subject">본사에서 수집하는 개인정보는 다음에 명시한 목적으로만 이용됩니다.</p>
						   	<ul class="list-1">
						    	<li>회원가입 및 사용자ID발급</li>
						      	<li>계약의 성립</li>
						      	<li>개인 및 사업자 회원에 대한 맞춤정보서비스</li>
						      	<li>회원의 서비스 이용에 대한 통계를 수집하고, 이를 서비스 개선정책에 반영(서비스 개편 및 확대)</li>
						      	<li>기타 본사의 서비스</li>
						   	</ul>
						   	<p>회원으로 가입할 때 수집된 모든 정보는 해당서비스 제공이나 회원님께 사전에 밝힌 목적 이외의 다른 어떠한 목적으로도 사용되지 않습니다. </p>

						   	<strong class="article">4. 제3자에 대한 정보제공</strong>
						   	<p class="subject">본사는 법령에 근거한 다음의 경우를 제외하고는 제3자에게 개인정보를 제공하지 않습니다.</p>
						   	<ul class="list-1">
      							<li>금융실명거래 및 비밀보장에 관한 법률, 신용 정보의 이용 및 보호에 관한 법률, 전기통신기본법, 전기통신사업법, 지방세법, 소비자보호법, 한국은행법, 형사소송법 등 법령에 특별한 규정이 있는 경우 (법령에 따라 행정관청 또는 수사기관이 요구해 온 경우라도 무조건 개인정보를 제공하지 않으며, 법령에 규정된 바에 따라 영장 또는 기관장의 직인이 날인된 서면에 의한 경우에만 제공합니다.)</li>
      							<li>서비스 제공에 따른 요금정산을 위하여 필요한 경우</li>
      							<li>통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로써 특정 개인을 식별할 수 없는 형태로 제공하는 경우</li>
   							</ul>
   							<p class="subject">회원가입에 대한 동의 철회, 열람 또는 정정 요구 등 </p>
   							<ul class="list-1">
      							<li>회원님께서는 "회원정보 수정"을 통해 언제든지 개인정보에 대한 열람 및 수정을 할 수 있으며, 수정된 정보는 수정절차가 완료된 시점부터 바로 적용됩니다.</li>
      							<li>회원님께서는 "회원탈퇴신청”을 통해 언제든지 회원가입에 대한 동의를 철회할 수 있습니다. 회원탈퇴를 신청하시면, 탈퇴신청 즉시 제공한 모든 정보를 삭제합니다.</li>
   							</ul>
   							<p class="subject">수집하는 개인정보의 보유기간 및 이용기간 다음과 같이 개인정보의 수집 목적 또는 제공받은 목적이 달성되면, 개인정보를 파기합니다.</p>
						   	<ul class="list-1">
						      	<li>회원가입정보의 경우, 회원가입을 탈퇴하거나 회원에서 제명된 때</li>
						      	<li>대금지급정보의 경우, 대금의 완제일 또는 채권소멸시효기간의 만료된 때 </li>
						   	</ul>

						   <strong class="article">5. 서버 로그 파일과 쿠키(cookie)의 운영</strong>
						   <p class="subject"><쿠키(cookie)란?></p>
						   <ul class="list-1">
				                <li>웹 사이트 서버가 이용자의 컴퓨터로 전송하는 소량의 정보이며, 여기에는 방문한 웹 사이트의 정보 및 이용자의 개인정보 등이 담겨있습니다. 이용자는 웹 브라우저의 옵션을 조정함으로써 모든 쿠키를 다 받아들이거나, 쿠키가 설치될 때 통지를 보내도록 하거나, 아니면 모든 쿠키를 거부할 수 있는 선택권을 가질 수 있습니다.</li>
				            </ul>
				            <ul class="list-1">
				                <li>본사는 이용자의 편의를 위하여 서버 로그파일 및 쿠키를 운영합니다. 본사가 서버 로그 파일이나 쿠키를 통해 수집하는 정보는 본사 회원 ID에 한하며, 그 외의 다른 정보는 수집하지 않습니다. 본사가 서버 로그 파일이나 쿠키(cookie)를 통해 수집한 회원 ID는 아래의 목적을 위해 사용됩니다.</li>
				                    <ul class="list-2">
				                        <li>1) 본사의 자동로그인</li>
				                        <li>2) 쿠키는 앱 로그아웃시나 회원탈퇴 시 자동 삭제됩니다.</li>
				                    </ul>
				            </ul>

				            <strong class="article">6. 개인정보 관리책임자의 소속, 성명 및 전화번호 기타 연락처 </strong>
				            <p class="subject">개인정보 책임자</p>
				            <ul class="list-1">
      							<li>성명: 조준호</li>
      							<li>전화: (02) 6337-3400</li>
   							</ul>
   							<p class="subject">회원님께서는 본사와 개인정보에 관한 분쟁이 있는 경우 신속하고 효과적인 분쟁해결을 위하여 한국정보보호센터 내의 개인정보분쟁조정위원회에 그 처리를 의뢰할 수 있습니다.</p>
   							<ul class="list-1">
      							<li>개인정보침해신고센터 전화: 서울 1336, 지방(02)1336</li>
							</ul>

							<strong>개인정보취급방침 시행일자: 2018-11-01.</strong><br>
   							<strong>개인정보취급방침 게시일자: 2018-11-01.</strong>
						</div>
					</div>
					
					<div class="btn">
						<a href="${pageContext.request.contextPath}/member/saw">비동의</a>
						<input type="submit" value="동의" />
					</div>
				</form>	
			</div>
		</div>
	</div>
	<script>
		function allBoxCheck(elem) {
			var $elem = elem;

			//레이블 이미지 변경
			$elem.children(".check_off").removeClass("active");
			$elem.children(".check_on").addClass("active");
			$("#label_agree_check_1").children(".check_off").removeClass("active");
			$("#label_agree_check_1").children(".check_on").addClass("active");
			$("#label_agree_check_2").children(".check_off").removeClass("active");
			$("#label_agree_check_2").children(".check_on").addClass("active");

			// checkbox
			$("#agree_check_1").prop("checked", true);
			$("#agree_check_2").prop("checked", true);
		}

		function allBoxCheckCancel(elem) {
			var $elem = elem;

			//레이블 이미지 변경
			$elem.children(".check_off").addClass("active");
			$elem.children(".check_on").removeClass("active");
			$("#label_agree_check_1").children(".check_off").addClass("active");
			$("#label_agree_check_1").children(".check_on").removeClass("active");
			$("#label_agree_check_2").children(".check_off").addClass("active");
			$("#label_agree_check_2").children(".check_on").removeClass("active");

			// checkbox
			$("#agree_check_1").prop("checked", false);
			$("#agree_check_2").prop("checked", false);
		}

		function boxCheck(elem_id) {

			if($("#"+elem_id).is(":checked") === true) {

				//해당 요소 체크
				var agent = navigator.userAgent.toLowerCase();
				if((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
					$("#"+elem_id).prop("checked",false);
				}

				//해당 요소의 label 이미지 체크형태로 변경
				$("#label_"+elem_id).children(".check_off").addClass("active");
				$("#label_"+elem_id).children(".check_on").removeClass("active");

			} else {

				//해당 요소 체크
				var agent = navigator.userAgent.toLowerCase();
				if((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
					$("#"+elem_id).prop("checked",true);
				}

				//해당 요소의 label 이미지 체크형태로 변경
				$("#label_"+elem_id).children(".check_off").removeClass("active");
				$("#label_"+elem_id).children(".check_on").addClass("active");

			}
		}

		$('label').click(function() {
			var $labelID = $(this).attr('for');

			var agent = navigator.userAgent.toLowerCase();
			if((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) 
				|| (agent.indexOf("msie") != -1)) {
				
				//ie

			    if($labelID == "agree_check_all") {
			    	if($("#agree_check_all").is(":checked") === true) {
			    		$("#agree_check_all").prop("checked",false);
			    	} else {
			    		$("#agree_check_all").prop("checked",true);
			    	}

			    	//전체 선택
			    	if($("#agree_check_all").is(":checked") === true) {

			    		// #agree_check_1 , agree_check_2 모두 선택 함
						allBoxCheck($(this));
			    	} 

			    	//전체 해제
			    	if($("#agree_check_all").is(":checked") === false) {
			    		
			    		// #agree_check_1 , agree_check_2 모두 해제 함
						allBoxCheckCancel($(this));
			    	}
			    }

			    if($labelID == "agree_check_1" || $labelID == "agree_check_2") {
			    	boxCheck($labelID);
			    }	

			} else {

				if($labelID == "agree_check_all") {
			    	if($("#agree_check_all").is(":checked") === false) {
			    		allBoxCheck($(this));
			    	} 

			    	if($("#agree_check_all").is(":checked") === true) {
			    		allBoxCheckCancel($(this));
			    	}
			    }

			    if($labelID == "agree_check_1" || $labelID == "agree_check_2") {
			    	boxCheck($labelID);
			    }	
			}

		});
	</script>
	
	<script>
		function isEmpty(value) { 
            if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
                return true 
            } else { 
                return false 
            } 
        }

        function agreeFrm_submit(f) {

        	if(document.getElementById('agree_check_1').checked === false) {
        		alert("동의해 주세요.");
			    return false;
			}

			if(document.getElementById('agree_check_2').checked === false) {
				alert("동의해 주세요.");
			    return false;
			}

			return true;

        }
	</script>
</body>
</html>