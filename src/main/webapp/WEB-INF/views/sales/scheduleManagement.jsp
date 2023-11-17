<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/demo.css" type="text/css">
  
<style type="text/css">
#calendar{
	text-decoration: none;
	color:black;
}

#calendar a{
	text-decoration: none;
}

.fc-col-header-cell-cushion{
	color:black;
}

.fc-daygrid-day a{
	color:black;
	
}


#calendar button{
	background: #90caf9;
	margin-right:10px;

}

#calendar .fc-toolbar-chunk:nth-child(3) button{
	border-radius:10%;
	
}

#calendar .fc-toolbar-chunk:nth-child(1) button{
	color: gray;
	background: white;
	border: none;
}

#calendar .fc-toolbar-chunk:nth-child(1) button:hover{
	background: rgb(222,226,230);
	
}


/* 일요일 날짜 빨간색 */
.fc-day-sun a {
  color: red;
  text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a{
  color: blue;
  text-decoration: none;
}

.modal-header .close {
        display: none;
    }
</style>
</head>
<body id="page-top">
	<div id="wrapper">
		
		<!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content" class="page-content">
        <div class="container-fluid">
          <div class="row">
            <!-- 왼쪽 영역 -->
            <div class="col-md-2 text-center">
              <h1>일정 관리</h1>
              <ul class="nav-tabs">
				</ul>
              <a href="#calendarAddModal" data-toggle="modal" onmouseover="this.style.backgroundColor='transparent'" 
              onmouseout="this.style.backgroundColor='transparent'">
              <span class="btn btn-mini" style="border:1px solid #ddd; 
              background-color: transparent; font-weight:bold;" 
              onmouseover="this.style.backgroundColor='transparent'" 
              onmouseout="this.style.backgroundColor='transparent'">연차등록</span></a>
              <br><br><br>
              <div class="form-check">
				  <input class="form-check-input" type="radio" name="flexRadioDefault" value="" id="flexCheckDefault" checked>
				  <label class="form-check-label" for="flexCheckDefault">
				    내 연차
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="flexRadioDefault" value="" id="flexCheckChecked">
				  <label class="form-check-label" for="flexCheckChecked">
				    팀 연차
				  </label>
				</div>
            </div>

            <!-- 오른쪽 영역 -->
            <div class="col-md-10">
              <div class="card">
                <div class="card-body">
                  <div id='calendar'></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
  </div>
  

 
     
     <div style="border: 1px solid gray;">
        <div id="small-image-show" style="align-content: center"></div>  
        </div>    
</div>
      
      
      
 <!------------------------------------------------- Add modal ------------------------------------------------->
 <div class="modal fade" id="calendarAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">연차 등록</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <form id="addForm" action="./addAnnual" method="post">
                <div class="modal-body">
                    <div class="form-group">
						
                        <label for="taskId" class="col-form-label">시작일</label>
                        <input type="date" class="form-control" id="calendar_start_date" name="scheduleDate">
                        
                        <label for="taskId" class="col-form-label">종료일</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="scheduleEndDate">
                        
                        <label for="taskId" class="col-form-label">사용자</label>
                        <input type="text" class="form-control" id="calendar_name" value="${empName} ${position}" readonly>
                        <input type="hidden" class="form-control" name="employeeId" value="${empId}">
                        
                        <label for="taskId" class="col-form-label">휴가 사유</label>
                        <input type="text" class="form-control" id="calendar_location" name="scheduleContents">
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
    			</form>
            </div>
        </div>
    </div>
<!------------------------------------------------- Add modal ------------------------------------------------->
 
 
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
<script type="text/javascript">
const arr = new Array();

$.ajax({
	  type: "GET", 
	  url: "/sales/getAnnualList",
	  async: false,
	  success: function (res) {
	    for (const key in res) {
	      let obj = new Object();
	      
	      obj.id = res[key].scheduleNo;
	      
	      obj.title = res[key].scheduleContents;
	      
	      obj.name = res[key].name + ' ' + res[key].codeName;
	      
	      let scheduleDate = new Date(res[key].scheduleDate);
	      scheduleDate.setHours(scheduleDate.getHours() + 9);
	      obj.start = scheduleDate;
	      
	      let scheduleEndDate = new Date(res[key].scheduleEndDate);
	      scheduleEndDate.setHours(scheduleEndDate.getHours() + 9);
	      obj.end = scheduleEndDate;

	      arr.push(obj);
	    }
	    console.log(arr);
	    
	
	  },
	  error: function (XMLHttpRequest, textStatus, errorThrown) {
	    console.log('error')
	  },
	});
	
	
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {


    	locale: "ko",
	      timeZone: 'Asia/Seoul',
	      initialView: 'dayGridMonth',
	      selectable: true,
	      select: function(start, end, allDays){
	    	  $("#calendarAddModal").modal("show");
	    	  
	    	  /* 
	    	  $('#addCalendar').click(function(){
	    		  console.log("추가")
	    		})
	    	  */
	    	  
	    	  $('#sprintSettingModalClose').click(function(){
	    			$('#calendarAddModal').modal('hide')	
	    		})
	    		
	      },
	      
	      customButtons: {
	    	    myCustomButton: {
	    	      text: '새로고침',
	    	      click: function() {
	    	    	  $("#calendarAddModal").modal("show");
	    	    	  
	    	    	  /* 
	    	    	  $('#addCalendar').click(function(){

	    	    		})
	    	    	   */
	    	    		
	    	    	  $('#sprintSettingModalClose').click(function(){
	    	    			$('#calendarAddModal').modal('hide')	
	    	    		})
	    	    	  
	    	      }
	    	    },
				customButton2:{
					text:'일정 등록',
				}
	    	  },
	    	    	  
	      headerToolbar: {
	    	    left: 'prev,next',
	    	    center: 'title',
	    	    right: 'myCustomButton,customButton2'
	    	  },
			  buttonIcons:{
				customButton2: '',
				myCustomButton: '',
			  }
	    	  ,
	      buttonText:{
	    	  today: '오늘',
	    	  title: '일정관리'
	      },
	      
	      
        events: arr
    });
    calendar.render();
    

	let icon=document.getElementsByClassName('fc-icon');
	
	icon[3].innerHTML='<span class="material-symbols-outlined">cached</span>';
	icon[2].innerHTML='<span class="material-symbols-outlined">edit_square</span>';
});
		
</script>
</body>
</html>