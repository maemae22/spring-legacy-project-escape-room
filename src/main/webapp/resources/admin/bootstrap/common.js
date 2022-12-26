
function fun_logout()  {
	str =  '로그아웃 합니까?';
	result = confirm(str);

	if(result == true) {
		location.href = 'logout.php';
	}
}


// 달력 함수
function fun_calendar(tar_day,tag,img_name)
{
	var sor = eval('document.'+tar_day);
	sor_day = sor.value;

	url = 'calendar.php?tar_day='+tar_day+'&sor_day='+sor_day+'&tag='+tag;
	pop_frame_cal.location.href = url;

	yy = 0;
	xx = 0;
	if(img_name!=null)
	{
		obj = eval('document.all.'+img_name);
		var newX = 0;
		var newY = 0;
		if (obj.offsetParent)
		{
			while (obj.offsetParent)
			{
				newX += obj.offsetLeft;
				newY += obj.offsetTop;
				obj = obj.offsetParent;
			}
		}
		else if(obj.x)
		{
			newX += obj.x;
			newY += obj.y;
		}
		yy = newY + 20;
		xx = newX - 150;
	}

	$("#popCal").css({"top":yy, "left":xx}); 

	document.all.popCal.style.visibility = 'visible';
	document.all.popCal.style.display = "";
}


// 현재날짜 구하기 : 2012-11-02 12:39:01
function fun_get_date() 
{
	var date = new Date();

	var yy = date.getFullYear();
	var mm = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
	var dd = date.getDate();

	var hh = date.getHours();
	var ii = date.getMinutes();
	var ss = date.getSeconds();
    
	if(("" + mm).length == 1) { mm = "0" + mm; }
	if(("" + dd).length == 1) { dd = "0" + dd; }
	if(("" + hh).length == 1) { hh = "0" + hh; }
	if(("" + ii).length == 1) { ii = "0" + ii; }
	if(("" + ss).length == 1) { ss = "0" + ss; }

	var ret = yy+"-"+mm+"-"+dd+" "+hh+":"+ii+":"+ss;
	return ret; 
}



// 천단위 숫자 포맷으로 변경한다.
function fun_chun_magic(a) {
	str = a.toString();//숫자형일경우 문자형으로 변경
	str = fun_only_number(str);	// 숫자만골라낸다.

	var result='';
	var len=str.length;
	for(var i=len-1,j=0;i>=0;i--) {   
		if(str.substring(i,i+1)==',')continue;
		
		result=str.substring(i,i+1)+result;
		j++;
		if(j==3 && i!=0) {   
			result=','+result;
			j=0;
		}
	}
	return result;
}

// 숫자만 리턴한다(콤마등삭제함)
function fun_only_number(str) {
	var val="0123456789";
	var len=str.length;
	var n_price = '';
	for(var i=0; i<len; i++) {   
		a = str.substr(i,1);
		if(val.indexOf(a)>=0) {
			n_price = n_price + a;
		}
	}
	return n_price;
}

// 숫자형식으로 변경한다.
function fun_price_change(a) {
	var price = fun_only_number(a.value);
	a.value = fun_chun_magic(price);
}



function fun_sms_send(strCallBack,strDests,strData)
{
	url = 'sms_send.php?strCallBack='+strCallBack+'&strDests='+strDests+'&strData='+strData;

	window.open(url,'win_sms_send','width=530,height=420,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no');
}


// 관리자
function fun_manager_make() {
	url = 'manager.make.php';
	window.open(url,'manager_make','width=800,height=500,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}
function fun_manager_update(a) {
	url = 'manager.update.php?num='+a;
	window.open(url,'fun_manager_update','width=800,height=500,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}

// FAQ
function fun_faq_make(a) {
	url = 'faq.make.php?s_subj='+a;
	window.open(url,'faq_make','width=900,height=700,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}
function fun_faq_update(a) {
	url = 'faq.update.php?num='+a;
	window.open(url,'','width=900,height=700,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}


// 상담문의
function fun_contact_make() {
	url = 'contact.make.php';
	window.open(url,'contact_make','width=900,height=700,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}
function fun_contact_update(a) {
	url = 'contact.update.php?num='+a;
	window.open(url,'','width=900,height=700,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}

// 배너
function fun_banner_make(a) {
	url = 'banner.make.php?s_subj='+a;
	window.open(url,'banner_make','width=900,height=600,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}
function fun_banner_update(a) {
	url = 'banner.update.php?num='+a;
	window.open(url,'','width=900,height=600,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}




function fun_theme_make() {
	url = 'theme.make.php';
	window.open(url,'','width=900,height=700,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}
function fun_theme_update(a) {
	url = 'theme.update.php?num='+a;
	window.open(url,'','width=900,height=700,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}

function fun_theme_time_make(theme_num,gubun) {
	if(theme_num=='') {
		alert('지점과 테마를 선택하시기 바랍니다');
		return;
	}

	url = 'theme_time.make.php?theme_num='+theme_num+'&gubun='+gubun;
	window.open(url,'','width=700,height=400,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}
function fun_theme_time_update(a) {
	url = 'theme_time.update.php?num='+a;
	window.open(url,'','width=700,height=400,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}


function fun_rev_make() {
	url = 'rev.make.php';
	window.open(url,'','width=820,height=700,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}

function fun_rev_update(a) {
	url = 'rev.update.php?num='+a;
	window.open(url,'','width=820,height=800,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}


// 공휴일
function fun_gong_day_make(a) {
	url = 'gong_day.make.php?day='+a;
	window.open(url,'gong_day_make','width=500,height=400,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}
function fun_gong_day_update(a) {
	url = 'gong_day.update.php?num='+a;
	window.open(url,'gong_day_update','width=500,height=400,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}

// 휴무일
function fun_hu_day_make(a) {
	url = 'hu_day.make.php?day='+a;
	window.open(url,'hu_day_make','width=500,height=400,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}
function fun_hu_day_update(a) {
	url = 'hu_day.update.php?num='+a;
	window.open(url,'hu_day_update','width=500,height=400,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}
