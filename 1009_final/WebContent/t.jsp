<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<input class="form-control" id="id" name="id" type="text" required>
<button id="idCheck" type="button" onclick="idCheck();">중복확인</button>
</body>
<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript">
	function idCheck() {
		var id = $('#id').val();
		console.log(id);
		$.ajax({
			type : 'GET',
			url : "idCheck.do",
			data : "id="+id,
			success : function(result) {
				console.log(result);
				if (result == 'false') {
					alert("ID형식이 잘못 되었습니다. 다시 입력하세요.");

				} else if (result == 'fail') {
					alert("ID가 이미 존재합니다. 다시 입력하세요.");

				} else {
					alert("사용 가능한 ID입니다.");
					
				}
			},
			error : function(xhr) {
				console.log(xhr.status + " : " + xhr.errorText);
				alert("에러발생!");
			}

		})
	}
	</script>
</html>