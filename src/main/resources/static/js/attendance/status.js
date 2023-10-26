/*
	function init(isAuthenticated){
		if(isAuthenticated){ // 로그인 상태
			
		}else{ // 비로그인 상태
			
		}
	}
*/

function formatTime(h, m, s, type){
	switch(type){
		case 1:
			return (h < 10 ? "0" : "") + h + "h " + (m < 10 ? "0" : "") + m + "m " + (s < 10 ? "0" : "") + s + "s";
			break;
		default:
			return (h < 10 ? "0" : "") + h + ":" + (m < 10 ? "0" : "") + m + ":" + (s < 10 ? "0" : "") + s;
	}
}


function splitTimeString(timeString, timeObj){
	if(timeString != ""){
		let parts = timeString.split(":");
		timeObj.hours = parts[0];
		timeObj.minutes = parts[1];
		timeObj.seconds = parts[2];
	}else{
		timeObj.hours = 0;
		timeObj.minutes = 0;
		timeObj.seconds = 0;
	}
}


// ex) timeToTimeString(날짜.getTime() - 날짜.getTime()) = "HH:mm:ss"
function timeToTimeString(time){
	let h = Math.floor(time / (1000 * 60 * 60));
	let m = Math.floor((time % (1000 * 60 * 60)) / (1000 * 60));
	let s = Math.floor((time % (1000 * 60)) / 1000);
	return formatTime(h, m, s);
}


/*
	"HH:mm:ss" 형식 시간 연산 함수(날짜 개념 X)
	ex) "10:10:10" + "20:20:20" = "30:30:30"
*/

function timeStringToHours(timeString){
	let parts = timeString.split(":");
	let h = parseInt(parts[0]);
	let m = parseInt(parts[1]);
	let s = parseInt(parts[2]);
	return h + (m / 60) + (s / 3600);
}

function hoursToTimeString(hours){
	let h = Math.floor(hours);
	let m = Math.floor((hours - h) * 60);
	let s = Math.round((hours - h - m / 60) * 3600);
	return formatTime(h, m, s);
}


// init
$(function(){
	let cur_time = new Date().toTimeString().split(" ")[0];
	
	$("#attendance").html("<p id='cur_date'></p>" +
								   "<p id='cur_time'>" + cur_time + "</p>" +
								   "<div id='start_time' class='attendance_time'><i>출근 시간</i> <span>미등록</span></div>" +
								   "<div id='end_time' class='attendance_time'><i>퇴근 시간</i> <span>미등록</span></div>" +
								   "<div id='attendance_btn' class='on'>" +
									   "<button id=start_btn'>출근하기</button> &nbsp;" +
									   "<button id='end_btn'>퇴근하기</button>" +
								   "</div>");
	
	let daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
	let dayOfWeek = new Date().getDay();
	let cur_date = new Date().toLocaleDateString().replace(/\./g, "").replace(/\s/g, "-");
	$("#cur_date").html(cur_date + "(" + daysOfWeek[dayOfWeek] + ")");
	
	setInterval(function(){
		cur_time = new Date().toTimeString().split(" ")[0];
		$("#cur_time").html(cur_time);
	}, 1000);
});