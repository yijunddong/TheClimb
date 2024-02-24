<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="nonh" class="tab-pane fade">
						<h3>nonh</h3>
				<c:forEach items="${UploadVideoList}" var="difficult">
				<c:choose>
					<c:when test="${difficult.branch eq 'Nonhyeon'}">
						<div style="border: 1px solid white; float: left; width: 33%">
							<div id="main">
								<div class="video-container">
									<video controls class="movie">
										<source src="resources/movie/${difficult.seq}.mp4"
											type="video/mp4" />
									</video>
									<div style="display: flex;">
									<form action="updateUploadVideo.do" method="post">
									
										<input type="hidden" value="nonh" name="branch"> 
									<input type="submit" value="❤">
									<input type="hidden" name="seq" value="${difficult.seq}"> 
									<span id="likeCount${difficult.seq}" name="good">${difficult.good}</span>
									</form>
									<form action="insertBoardGrade.do" method="post">
											<table>
												<tr>
													<td><input type="text" name="writer"
														placeholder="${sessionScope.id}" readonly="readonly"
														value="${empty sessionScope.id ? '게스트' : sessionScope.id}"
														style="display: none"></td>
													<td><input type="text" id="comment" name="content"
														placeholder="댓글을 입력하세요" /></td>
													<td><input type="hidden" name="category"
														value="${difficult.seq}"> <input type="submit"
														value="글 쓰기" style="display: inline-block;" onclick="toggleComments(${difficult.seq});"></td>
														<td><input type="button" value="댓글 보기 "onclick="toggleComments(${difficult.seq});">
 </td>
												</tr>
											</table>
											
										</form>
										
									</div>
									<div style=" max-height: 600px;">

										<div style="width: 100%">
											
											<div class="commentReceive${difficult.seq}" style="display: none">
												<table>
													<c:forEach items="${boardList}" var="board"
														varStatus="loop">
														<c:choose>
															<c:when test="${board.category eq difficult.seq}">
																<c:if test="${loop.index < 20}">
																	<tr>
																		<c:choose>
																			<c:when test="${board.writer eq sessionScope.id}">
																				<!-- 내가 쓴 글 -->
																				<td
																					style="max-width: 70px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; text-align: left;">${board.writer}:</td>
																				<td style="width: 100%; text-align: left;">${board.content}</td>
																			</c:when>
																			<c:otherwise>
																				<!-- 남들이 쓴 글 -->
																				<td
																					style="max-width: 70px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; text-align: left;">${board.writer}:</td>
																				<td style="max-width: 300px; text-align: left;">${board.content}</td>
																			</c:otherwise>
																		</c:choose>
																	</tr>
																</c:if>
															</c:when>
														</c:choose>
													</c:forEach>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach></div>
