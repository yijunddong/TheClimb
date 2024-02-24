<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>climb</title>


<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=PT+Sans+Narrow&family=Quicksand:wght@500&display=swap"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>


<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/projectOpen1.css" />
<link rel="stylesheet" href="resources/css/grade.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="resources/js/joinmodal.js"></script>
	<script src="resources/js/grade.js"></script>
	

<style>
.modal-content {
    max-height: 400px; /* 스크롤이 필요한 높이를 지정합니다. */
    overflow-y: auto; /* 세로 스크롤을 표시합니다. */
}

</style>
</head>
<body>

	<header>
		<h1 class="name">The Climb</h1>
		<nav class="personal">
			<c:if test="${empty sessionScope.userName}">
				<button class="join" id="joinUs">회원가입</button>
				<button class="join" id="login">로그인</button>
				<button class="join" id="searchPass">비밀번호 찾기</button>
				<button class="join" id="openModal">동영상업로드</button>
			</c:if>
			<c:if test="${not empty sessionScope.userName}">
			${userName}님 환영합니다.
			
				<form action="logout.do" method="get"
					style="display: inline-block;">
					<button class="join" id="logout">로그아웃</button>
				</form>
				<form action="dropUser.do" method="get"
					style="display: inline-block;">
					<button class="join" id="dropUser">회원탈퇴</button>
				</form>
				<button class="join" id="updateUser">회원정보수정</button>
				<button class="join" id="openModal">동영상업로드</button>
			</c:if>
		</nav>
	</header>
	<!-- 모달들 -->
	<!-- 회원가입 모달 -->
	<div id="joinModal" class="modal">
		 <div class="modal-content" >
			<span class="close" id="closeJoinModal">&times;</span>
			<h2>회원가입</h2>
			<form action="insertUser.do" method="post" id="joinButtonFrom">
				<label for="userID">아이디: </label> <input type="text" id="userID"
					name="id" placeholder="아이디 " required /> <br /> <label
					for="userPW">비밀번호: </label> <input type="password" id="userPW"
					name="password" placeholder="비밀번호  " required /> <br /> <label
					for="userPWCheck">비밀번호 확인: </label> <input type="password"
					id="userPWCheck" placeholder="비밀번호  " required /> <br /> <label
					for="name">이름:</label> <input type="text" id="name" name="username"
					placeholder="이름" required /> <br /> <label for="phoneNumber">전화번호:</label>
				<input type="text" id="userphoneNumber" name="phoneNumber"
					placeholder="전화번호" required /> <br /> <label for="birthdate">생년월일:</label>
				<input type="date" id="birthdate" name="birthday" required /> <br />
				<label for="address">주소:</label> <input type="text" id="address"
					name="address" placeholder="주소" required><br />
					<label for="email">email:</label> <input type="email" id="email"
					name="email"  required><br />
					
					 <input type="submit" value="가입하기 " id="joinButton">

			</form>

		</div>
	</div>
	<!-- 로그인 모달 -->
	<div id="loginModal" class="modal">
		<div class="modal-content">
			<span class="close" id="closeLoginModal">&times;</span>
			<h2>로그인</h2>
			<form action="loginOk.do" method="post" id="closeLoginModalform">
				<input type="text" id="userid" name="id" placeholder="아이디" required />
				<br /> <input type="password" id="password" name="password"
					placeholder="비밀번호" required /> <input type="submit"
					id="loginButton" value="로그인">
			</form>
		</div>
	</div>

	<!-- 비밀번호 찾기 모달 -->
	<div id="searchPassModal" class="modal">
		<div class="modal-content">
			<span class="close" id="closeSearchPassModal">&times;</span>
			<h2>비밀번호 찾기</h2>
			
				<label for="id">아이디:</label> <input type="text" id="id"
					placeholder="아이디" required /> <br /> <label for="phoneNumber">전화번호:</label>
				<input type="text" id="phoneNumber" placeholder="전화번호" required />
				<br /> <span
					id="passwordPlaceholder" style="display: none" name="password"></span> <br /> <input type="text"
					id="password" readonly="readonly" style="display: none;" />

				<button id="searchPassButton">확인</button>
		
		</div>    
	</div>

	




	<!-- 상세정보  -->
	<div id="updateModal" class="modal">
		<div class="modal-content">
			<span class="close" id="closeUpdateModal">&times;</span>
			<h2>개인정보수정</h2>
			<form action="updateUser.do" method="post" id="joinButtonFrom">

				<label for="userID">아이디: </label> <input type="text" id="userID"
					name="id" placeholder="${sessionScope.id}" readonly="readonly" />
				<br /> <label for="userPW">비밀번호: </label> <input type="password"
					id="userPW" name="password" placeholder="비밀번호 " required /> <br />
				<label for="name">이름:</label> <input type="text" id="name"
					name="username" placeholder="이름" required /> <br /> <label
					for="phoneNumber">전화번호:</label> <input type="text"
					id="userphoneNumber" name="phoneNumber" placeholder="전화번호" required />
				<br /> <label for="birthdate">생년월일:</label> <input type="date"
					id="birthdate" name="birthday" required /> <br /> <label
					for="address">주소:</label> <input type="text" id="address"
					name="address" placeholder="주소" required><br /> <input
					type="submit" value="수정하기  " id="updateButton">

			</form>

		</div>
	</div>
	<!--동영상업로드-->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<h2>동영상 업로드 선택</h2>
			<c:if test="${empty sessionScope.userName}">
				<button class="join" id="joinUsUp">회원가입</button>
				<button class="join" id="loginUp">로그인</button>


			</c:if>
			<c:if test="${not empty sessionScope.userName}">


				<hr>
				<form action="insertUploadVideo.do" method="post"
					enctype="multipart/form-data">
					<table border="1">
						<tr>
							<td>제목</td>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" id="userID" name="id" value="${id}"
								readonly="readonly" /> <br />
						</tr>
						<tr>
							<td>난이도</td>
							<td><select name="difficulty">
									<option value="White">White</option>
									<option value="Yellow">Yellow</option>
									<option value="Orange">Orange</option>
									<option value="Green">Green</option>
									<option value="Blue">Blue</option>
									<option value="Red">Red</option>
									<option value="Purple">Purple</option>
									<option value="Gray">Gray</option>
									<option value="Brown">Brown</option>
									<option value="Black">Black</option>

							</select></td>
						</tr>
						<tr>
							<td>지점</td>
							<td><select name="branch">

									<option value="Hongdae">홍대b</option>
									<option value="Seoul National University">서울대</option>
									<option value="Ilsan">일산</option>
									<option value="Yangjae">양재</option>
									<option value="Magok">마곡</option>
									<option value="Sinlim">신림</option>
									<option value="Yeonnam">연남</option>
									<option value="Gangnam">강남</option>
									<option value="Sadan">사당</option>
									<option value="Sinsa">신사</option>
									<option value="Nonhyeon">논현</option>

							</select></td>
						</tr>


						<tr>
							<td>업로드</td>
							<td><input type="file" name="uploadFile"></td>
						</tr>

						<tr>
							<td colspan="2"><input type="submit" value=" 새글 등록 " /></td>
						</tr>
					</table>
				</form>
				<hr>
			</c:if>
		</div>
	</div>
