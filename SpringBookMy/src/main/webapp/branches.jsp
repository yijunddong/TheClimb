<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@include file="header.jsp" %>
            <section>
                <div style="border: 3px solid black; float: left; width: 100%" class="mainBody">
                    <div class="container" style="float: left">
                        <ul class="nav nav-pills">
                            <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">BRANCH</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#" data-toggle="pill" data-target="#gangnam">강남</a>
                                    <a class="dropdown-item" href="#" data-toggle="pill" data-target="#yangjae">양재 </a>
                                    <a class="dropdown-item" href="#" data-toggle="pill" data-target="#sinsa">신사 </a> <a
                                        class="dropdown-item" href="#" data-toggle="pill" data-target="#nonh">논현</a>
                                </div>
                            </li>

                        </ul>

                        <!-- 드롭다운에 대응하는 컨텐츠 -->
                        <div class="tab-content">
                            <%@include file="gangnam.jsp" %>
                            <%@include file="yangjae.jsp" %>
                            <%@include file="sinsa.jsp" %>
                            <%@include file="nonh.jsp" %>
                        </div>
                    </div>
                </div>
            </section>
       </body>
</html>