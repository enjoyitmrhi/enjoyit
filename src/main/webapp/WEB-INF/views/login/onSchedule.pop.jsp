<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='<c:url value ="/resources/fullcalendar/core/main.css" />'
   rel='stylesheet' />
<link href='<c:url value ="/resources/fullcalendar/daygrid/main.css" />'
   rel='stylesheet' />
<script src='<c:url value ="/resources/fullcalendar/core/main.js" />'></script>
<script src='<c:url value ="/resources/fullcalendar/daygrid/main.js" />'></script>
<script src='<c:url value ="/resources/fullcalendar/interaction/main.js" />'></script>
<script src='<c:url value ="/resources/fullcalendar/core/locales/ko.js" />'></script>
<script src='<c:url value ="/resources/fullcalendar/moment/main.min.js" />'></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
    
      var calendar = new FullCalendar.Calendar(calendarEl, {
    	
        plugins: [ 'dayGrid' , 'interaction'],
        selectable : true,
        header : {
        			left : 'prev,next today',
        			center : 'title',
        			right : 'dayGridMonth'
        }, 
        
        select: function(info) {
            
            $('#startStr').val(info.startStr);
            $('#endStr').val(info.endStr);
            
          },
        /* defaultView : 'dayGridWeek', */
        local: 'ko',
        navLinks : true, //can click day/week names	to navigate views
        editable : false,
        allDaySlot : false,
        eventLimit : true, //allow "more" link when too many events
        minTime : '10:00:00',
        maxTime : '22:00:00',
        contentHeigt : 'auto', 
       	eventSources: [
            // your event source
            {	
              events: 
              ${evt} 
              //color: 'red',     // an option!
              //textColor: 'yellow' // an option!
              
            }
          ] 
      }); 
      calendar.render();
    });
    
    function closeWindow() { 
    	 document.form1.submit();
    	 window.opener.location = "myReserv";
    	 window.close();  
    }
</script>
</head>
<body>

<div id='calendar' style="overflow:hidden; width:75%; height:auto; text-align: center;"></div>
	<div></div> <!-- 나중에 예약가능 날짜 색별로 설명  -->
<form action="pop/reserv_Confirm" name="form1"> 

<input type="hidden" name="rtnum" value="${rtnum }" >
<input type="button" onclick="closeWindow()" value="예약수락">
	


</form>
</body>
</html>