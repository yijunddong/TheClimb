$(function(){








  //홈화면 바로가기
  $(".name").on("click", function () {
    window.location.href = "projectOpen.do";
  });


  $("#joinUs").on("click", function () {
    $("#joinModal").css("display", "block");
  });
  // 회원가입 모달 닫기
  $("#closeJoinModal").on("click", function () {
    $("#joinModal").css("display", "none");
  });

  //회원가입 버튼 클릭 시 모달 닫기+구현 x
  $("#joinButton").on("click", function () {
    $("#joinModal").css("display", "none");
    
  });
     // 상세정보수정  모달 열기
  $("#updateUser").on("click", function () {
    $("#updateModal").css("display", "block");
  });
  // 로그인 모달 닫기
  $("#closeUpdateModal").on("click", function () {
    $("#updateModal").css("display", "none");
  });

  //로그인 버튼 클릭 시 모달 닫기+구현 x
  $("#closeUpdateModalform").on("submit", function () {
  console.log("sdfsdf");
    $("#updateModal").css("display", "none");
   
  });
  
  //업로드내 회원가입버튼 
    $("#joinUsUp").on("click", function () {
    $("#myModal").css("display", "none");
    $("#joinModal").css("display", "block");
  });
// 업로드내 로그인 모달 열기
  $("#loginUp").on("click", function () {
   $("#myModal").css("display", "none");
    $("#loginModal").css("display", "block");
  });
  // 로그인 모달 열기
  $("#login").on("click", function () {
    $("#loginModal").css("display", "block");
  });
  // 로그인 모달 닫기
  $("#closeLoginModal").on("click", function () {
    $("#loginModal").css("display", "none");
  });

  //로그인 버튼 클릭 시 모달 닫기+구현 x
  $("#loginButton").on("click", function () {
    $("#loginModal").css("display", "none");
   
  });

  // 비번찾기 모달 열기
  $("#searchPass").on("click", function () {
    $("#searchPassModal").css("display", "block");
  });
  // 비번찾기 모달 닫기
  $("#closeSearchPassModal").on("click", function () {
    $("#searchPassModal").css("display", "none");
  });

  //비번찾기 버튼 클릭 시 모달 닫기+구현 x
  $("#searchPassButton").on("click", function () {
    $("#searchPassModal").css("display", "none");
  
  });

//동영상업로드 모달
  $("#openModal").on("click", function () {
    $("#myModal").css("display", "block");
  });
// 회원
 $("#memberUsage").on("click", function () {
  $("#myModal").css("display", "none");

});



//색별 업로드
$("#whiteUploadModal").on("click", function () {
  $("#myModal").css("display", "block");
});
$("#yellowUploadModal").on("click", function () {
  $("#myModal").css("display", "block");
});
$("#orangeUploadModal").on("click", function () {
  $("#myModal").css("display", "block");
});
$("#greenUploadModal").on("click", function () {
  $("#myModal").css("display", "block");
});
$("#blueUploadModal").on("click", function () {
  $("#myModal").css("display", "block");
});
$("#redUploadModal").on("click", function () {
  $("#myModal").css("display", "block");
});
$("#purpleUploadModal").on("click", function () {
  $("#myModal").css("display", "block");
});
$("#greyUploadModal").on("click", function () {
  $("#myModal").css("display", "block");
});
$("#brownUploadModal").on("click", function () {
  $("#myModal").css("display", "block");
});
$("#blackUploadModal").on("click", function () {
  $("#myModal").css("display", "block");
});


//모달외부클릭시 닫기
  $(document).on("click", function (event) {
    if (event.target == $("#joinModal")[0]) {
      $("#joinModal").css("display", "none");
    }
    if (event.target == $("#loginModal")[0]) {
      $("#loginModal").css("display", "none");
    }
    if (event.target == $("#searchPassModal")[0]) {
      $("#searchPassModal").css("display", "none");
    } if (event.target == $("#myModal")[0]) {
      $("#myModal").css("display", "none");
    }
   
   
   
      // 색 버튼 클릭 시 스크롤
      $(".colorButton").click(function() {
        // 클릭된 버튼의 색상을 가져옵니다.
        var color = $(this).text().toLowerCase();
        // 해당 색상 클래스를 가진 div의 위치로 스크롤합니다.
        $("." + color).get(0).scrollIntoView({ behavior: "smooth" });
      });
  });

  function positionModal(modalId) {
    var modal = $("#" + modalId);
    var scrollTop = $(window).scrollTop();

    modal.css("top", (scrollTop + 100) + "px");
  }

  // 업로드 버튼 클릭 시 모달 표시 및 위치 조절
  function configureUploadButton(buttonId, modalId) {
    $(buttonId).click(function() {
      var modal = $("#" + modalId);
      modal.css("display", "block");

      positionModal(modalId);
    });
  }

  // 닫기 버튼 클릭 시 모달 숨김
  $(".close").click(function() {
    var modal = $(this).closest(".modal");
    modal.css("display", "none");
  });

  // 스크롤 이벤트 감지 시 모달 위치 재조절
  $(window).scroll(function() {
    $(".modal:visible").each(function() {
      positionModal($(this).attr("id"));
    });
  });
  


  // 각 버튼에 대한 모달 처리
  configureUploadButton("#whiteUploadModal", "myModal");
  configureUploadButton("#yellowUploadModal", "yellowModal");
  configureUploadButton("#orangeUploadModal", "orangeModal");
  configureUploadButton("#greenUploadModal", "greenModal");
  configureUploadButton("#blueUploadModal", "blueModal");
  configureUploadButton("#redUploadModal", "redModal");
  configureUploadButton("#purpleUploadModal", "purpleModal");
  configureUploadButton("#greyUploadModal", "greyModal");
  configureUploadButton("#brownUploadModal", "brownModal");
  configureUploadButton("#blackUploadModal", "blackModal");

  var initialOffset = $(".colorButtons").offset().top;

  // 스크롤 이벤트를 감지
  $(window).scroll(function() {
    // 현재 스크롤 위치
    var currentScroll = $(window).scrollTop();

    // colorButtons가 원래 위치보다 아래로 내려갔을 때
    if (currentScroll > initialOffset) {
      // 스크롤 위치를 colorButtons 아래로 이동
      $(".colorButtons").css("position", "fixed").css("top", "0").css("left","20%");
    } else {
      // 원래 위치보다 위에 있을 때는 원래 위치로 돌아감
      $(".colorButtons").css("position", "static");
    }
  });
})

    function toggleComments(seq) {
    var commentDiv = document.querySelector('.commentReceive' + seq);

    if (commentDiv.style.display === 'none') {
      commentDiv.style.display = 'block';
    } else {
      commentDiv.style.display = 'none';
    }
  }

  function saveAndReload() {
    // 저장 후 새로고침
    sessionStorage.setItem('scrollPosition', window.scrollY);
    location.reload();
  }
  window.onload = function() {
    var scrollPosition = sessionStorage.getItem('scrollPosition');
    if (scrollPosition) {
      window.scrollTo(0, scrollPosition);
      sessionStorage.removeItem('scrollPosition'); // 스크롤 위치 정보 삭제
    }
  };

  // 페이지 이동 시 스크롤 위치 저장
  window.onbeforeunload = function() {
    sessionStorage.setItem('scrollPosition', window.scrollY);
  };