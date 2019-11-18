<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title><script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $( "#to" ).blur(function() {
	var id = $('#to').val();
    	$.ajax({
    		type : "POST",
    	    url : "id_check.do",
    	    data : {
    	         userid : id
    	      },
    	    success : function(result) {
    	    	if (result == 'false') {
    	    		$('#id_check').text('존재하지않는 아이디입니다.');
    	    		$('#id_check').css('color','red');
    	      	} else {
    	      		$('#id_check').text('');
    	      	}
    	    }	
    	});

    });
});

function closeWindow() { 
	 document.form1.submit();
	 window.opener.location.reload();
	 window.close();  
}
</script>
</head>
<body>
<div class ="container">
	<form action="sendMsg"name="form1">
	<table>
		<tr>
			<th>title</th>
			<th><input type="text" name="title"></th>
		</tr>
		<tr>
			<th>from</th>
			<th><input type="text" name="from" value="${session_cname }${session_bname}" readonly></th>
		</tr>
		<tr>
			<th>to</th>
			<th><input type="text" name="to" id="to" value="" ><div id="id_check"></div></th>
			
		</tr>
		<tr>
			<th>content</th>
			<th><textarea rows="10" cols="20" name="content"></textarea></th>
		</tr>
		<tr><th colspan="2"><input type="button" onclick="closeWindow()" value="전송"></th></tr>
	</table>
	</form>
</div>
</body>
</html> 