<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


        <%@include file="header.jsp" %>

            <!--shop-->
            <div id="shopModal" class="modal">
                <div class="modal-content">
                    <span class="close" id="closeShopModal">&times;</span>
                    <h2>선택하세요</h2>
                    <button class="jongro">종로산악</button>
                    <button class="reuse">숙련공</button>
                    <button class="goodch">굿초크</button>
                </div>
            </div>

            <!--예약-->
            <div id="reserveModal" class="modal">
                <div class="modal-content">
                    <span class="close" id="closeReserveModal">&times;</span>
                    <h2>무료강습 예약하기</h2>
                    <img src="resources/images/reserve/1.png" alt="이미지 설명" class="reserveImage" />

                    <button class="prevReserve">이전</button>
                    <button class="nextReserve">다음</button>
                </div>
            </div>

            <section>
                <div style="border: 3px solid black; float: left; width: 100%" class="mainBody">
                    <div style="float: left; width: 12%">
                        <nav class="banner">
                            <div style="float: left; width: 100%">
                                <button class="goToGym">branch</button>
                            </div>
                            <div style="float: left; width: 100%">
                                <button class="grade">grades</button>
                            </div>

                            <div style="float: left; width: 100%">
                                <button class="upload" id="openModal">upload</button>
                            </div>

                            <div style="float: left; width: 100%">
                                <button class="shop">Shop</button>
                            </div>

                            <div style="float: left; width: 100%">
                                <button class="reserve">reservation</button>
                            </div>

                            <div style="float: left; width: 100%">
                                <button class="sche" id="showCalendar">New Set</button>
                            </div>
                            <div style="float: left; width: 100%">
                                <button class="board" id="showBoard">Board</button>
                            </div>
                        </nav>
                    </div>

                    <div style="float: left; width: 40%">
                        <h2 class="today">Today's Best</h2>

                        <div style="border: 1px solid white; float: left; width: 88%">
                            <div id="main">
                                <div class="video-containerOpen">

                                    <video controls class="movie">
                                        <source src="resources/movie/${goodUpload.seq}.mp4" type="video/mp4" />
                                    </video>
                                </div>
                                <form action="updateUploadVideoOpen.do" method="post">
                                    <input type="submit" value="❤">
                                    <input type="hidden" name="seq" value="${goodUpload.seq}">
                                    <span id="likeCount${goodUpload.seq}">${goodUpload.good}</span>
                                </form>
                            </div>
                        </div>



                        <div style="float: left; width: 100%">
                            <div id="main">


                                <form action="insertBoard.do" method="post">
                                    <input type="text" name="writer" placeholder="${sessionScope.id}"
                                        readonly="readonly" value="${empty sessionScope.id ? '게스트' : sessionScope.id}"
                                        style="display: none">
                                    <input type="text" id="comment" name="content" placeholder="댓글을 입력하세요" />
                                    <input type="hidden" name="category" value="${goodUpload.seq}">
                                    <input type="submit" value="글 쓰기 ">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div style="float: left; width: 23%; max-height: 600px;     margin-left: -4%;">

                        <div style="float: left; width: 100%">
                            <h2 class="comment1">comment</h2>
                            <div class="commentReceive">
                                <table>
                                    <c:forEach items="${boardList}" var="board" varStatus="loop">
                                        <c:choose>
                                            <c:when test="${board.category eq goodUpload.seq}">
                                                <c:if test="${loop.index < 20}">
                                                    <tr>
                                                        <c:choose>
                                                            <c:when test="${board.writer eq sessionScope.id}">
                                                                <!-- 내가 쓴 글 -->
                                                                <td
                                                                    style="max-width: 70px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; text-align: left;">
                                                                </td>
                                                                <td style="width: 300px; text-align: right;">
                                                                    ${board.content}</td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <!-- 남들이 쓴 글 -->
                                                                <td
                                                                    style="max-width: 70px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; text-align: left;">
                                                                    ${board.writer}:</td>
                                                                <td style="max-width: 300px; text-align: left;">
                                                                    ${board.content}</td>
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

                    <div style="float: left; width: 23%">
                        <div style="float: left; width: 95%">
                            <img src="resources/images/safe1.jpeg" alt="이미지 설명" class="nonSlide-image" />
                        </div>
                        <div style="float: left; width: 95%"></div>

                        <div style="float: left; width: 95%">
                            <div class="safes">
                                <img src="resources/images/safe1.png" alt="이미지 설명" class="slide-image" />
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <footer>
                <div style="border: 3px solid black; float: left; width: 100%" class="mainBody">
                    <div style="border: 1px solid black; float: left; width: 100%; background-color: black;">

                    </div>
                </div>
            </footer>
            </body>

            </html>