<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="header.jsp" %>
	<section>
		<div style="border: 3px solid black; float: left; width: 100%"
			class="mainBody">
			<div class="container" style="float: left">
				<ul class="nav nav-pills">

					<li class="nav-item"><a class="nav-link active"
						data-toggle="pill" href="#home">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">BRANCH</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#" data-toggle="pill"
								data-target="#gangnam">강남</a> <a class="dropdown-item" href="#"
								data-toggle="pill" data-target="#yangjae">양재 </a> <a
								class="dropdown-item" href="#" data-toggle="pill"
								data-target="#sinsa">신사 </a> <a class="dropdown-item" href="#"
								data-toggle="pill" data-target="#nonh">논현</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">GRADE</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#" data-toggle="pill"
								data-target="#green">green</a> <a class="dropdown-item" href="#"
								data-toggle="pill" data-target="#blue">blue</a> <a
								class="dropdown-item" href="#" data-toggle="pill"
								data-target="#red">red</a> <a class="dropdown-item" href="#"
								data-toggle="pill" data-target="#purple">purple</a>

						</div></li>
				</ul>

				<!-- 드롭다운에 대응하는 컨텐츠 -->
				<div class="tab-content">
					<div id="home" class="container tab-pane active">
						<br>
						<h3>Free Board</h3>
						 <table class="table table-bordered">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>내용</th>		
							</tr>
							<c:forEach items="${boardList}" var="board">
								<c:choose>
									<c:when test="${board.idseq eq 'free'}">
										<tr>
											<td>${board.seq}</td>
											<td><a href="getBoard.do?seq=${board.seq}">${board.title}</a></td>
											<td>${board.writer}</td>
											<td>${board.content}</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</table>
					<a href="insertBoard.jsp" class="btn btn-primary">글쓰러 가기</a>
					</div>
					<div id="gangnam" class="tab-pane fade">
						<h3>gangnam</h3>
						 <table class="table table-bordered">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>내용</th>		
							</tr>
							<c:forEach items="${boardList}" var="board">
								<c:choose>
									<c:when test="${board.idseq eq 'gangnam'}">
										<tr>
											<td>${board.seq}</td>
											<td><a href="getBoard.do?seq=${board.seq}">${board.title}</a></td>
											<td>${board.writer}</td>
											<td>${board.content}</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</table>
					<a href="insertBoard.jsp" class="btn btn-primary">글쓰러 가기</a>
					</div>
					<div id="yangjae" class="tab-pane fade">
						<h3>yangjae</h3>
						 <table class="table table-bordered">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>내용</th>		
							</tr>
							<c:forEach items="${boardList}" var="board">
								<c:choose>
									<c:when test="${board.idseq eq 'yangjae'}">
										<tr>
											<td>${board.seq}</td>
											<td><a href="getBoard.do?seq=${board.seq}">${board.title}</a></td>
											<td>${board.writer}</td>
											<td>${board.content}</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</table>
					<a href="insertBoard.jsp" class="btn btn-primary">글쓰러 가기</a>
					</div>
					<div id="sinsa" class="tab-pane fade">
						<h3>sinsa</h3>
						 <table class="table table-bordered">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>내용</th>		
							</tr>
							<c:forEach items="${boardList}" var="board">
								<c:choose>
									<c:when test="${board.idseq eq 'sinsa'}">
										<tr>
											<td>${board.seq}</td>
											<td><a href="getBoard.do?seq=${board.seq}">${board.title}</a></td>
											<td>${board.writer}</td>
											<td>${board.content}</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</table>
					<a href="insertBoard.jsp" class="btn btn-primary">글쓰러 가기</a>
					</div>
					<div id="nonh" class="tab-pane fade">
						<h3>nonh</h3>
						 <table class="table table-bordered">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>내용</th>		
							</tr>
							<c:forEach items="${boardList}" var="board">
								<c:choose>
									<c:when test="${board.idseq eq 'nonh'}">
										<tr>
											<td>${board.seq}</td>
											<td><a href="getBoard.do?seq=${board.seq}">${board.title}</a></td>
											<td>${board.writer}</td>
											<td>${board.content}</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</table>
					<a href="insertBoard.jsp" class="btn btn-primary">글쓰러 가기</a>
					</div>
					<div id="green" class="tab-pane fade">
						<h3>green</h3>
						 <table class="table table-bordered">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>내용</th>		
							</tr>
							<c:forEach items="${boardList}" var="board">
								<c:choose>
									<c:when test="${board.idseq eq 'green'}">
										<tr>
											<td>${board.seq}</td>
											<td><a href="getBoard.do?seq=${board.seq}">${board.title}</a></td>
											<td>${board.writer}</td>
											<td>${board.content}</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</table>
					<a href="insertBoard.jsp" class="btn btn-primary">글쓰러 가기</a>
					</div>
					<div id="blue" class="tab-pane fade">
						<h3>blue</h3>
						 <table class="table table-bordered">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>내용</th>		
							</tr>
							<c:forEach items="${boardList}" var="board">
								<c:choose>
									<c:when test="${board.idseq eq 'blue'}">
										<tr>
											<td>${board.seq}</td>
											<td><a href="getBoard.do?seq=${board.seq}">${board.title}</a></td>
											<td>${board.writer}</td>
											<td>${board.content}</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</table>
					<a href="insertBoard.jsp" class="btn btn-primary">글쓰러 가기</a>
					</div>
					<div id="red" class="tab-pane fade">
						<h3>red</h3>
						 <table class="table table-bordered">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>내용</th>		
							</tr>
							<c:forEach items="${boardList}" var="board">
								<c:choose>
									<c:when test="${board.idseq eq 'red'}">
										<tr>
											<td>${board.seq}</td>
											<td><a href="getBoard.do?seq=${board.seq}">${board.title}</a></td>
											<td>${board.writer}</td>
											<td>${board.content}</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</table>
					<a href="insertBoard.jsp" class="btn btn-primary">글쓰러 가기</a>
					</div>
					<div id="purple" class="tab-pane fade">
						<h3>purple</h3>
							 <table class="table table-bordered">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>내용</th>		
							</tr>
							<c:forEach items="${boardList}" var="board">
								<c:choose>
									<c:when test="${board.idseq eq 'purple'}">
										<tr>
											<td>${board.seq}</td>
											<td><a href="getBoard.do?seq=${board.seq}">${board.title}</a></td>
											<td>${board.writer}</td>
											<td>${board.content}</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</table>
					<a href="insertBoard.jsp" class="btn btn-primary">글쓰러 가기</a>
					</div>
					<div id="purple" class="tab-pane fade">
						<h3>purple</h3>
						<p>이 부분에 링크 3에 대한 추가 내용을 작성하세요.</p>
					</div>
					<div id="purple" class="tab-pane fade">
						<h3>purple</h3>
						<p>이 부분에 링크 3에 대한 추가 내용을 작성하세요.</p>
					</div>
					<div id="purple" class="tab-pane fade">
						<h3>purple</h3>
						<p>이 부분에 링크 3에 대한 추가 내용을 작성하세요.</p>
					</div>
					<div id="purple" class="tab-pane fade">
						<h3>purple</h3>
						<p>이 부분에 링크 3에 대한 추가 내용을 작성하세요.</p>
					</div>
					<div id="purple" class="tab-pane fade">
						<h3>purple</h3>
						<p>이 부분에 링크 3에 대한 추가 내용을 작성하세요.</p>
					</div>
				</div>
			</div>
		</div>
	</section>


</body>
</html>
