
$(function () {


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

  // 회원가입 모달 열기
  $("#joinUs").on("click", function () {
    $("#joinModal").css("display", "block");
  });
  // 회원가입 모달 닫기
  $("#closeJoinModal").on("click", function () {
    $("#joinModal").css("display", "none");
  });

  //회원가입 버튼 클릭 시 모달 닫기+구현 x
  $("#joinButtonFrom").on("submit", function (event) {
    $("#joinModal").css("display", "none");
    var password = $("#userPW").val();
    var confirmPassword = $("#userPWCheck").val();

    if (password !== confirmPassword) {
      alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
      event.preventDefault(); // 기본 동작 중지
      return false;
    } else {
      alert("회원가입 성공.");
    }
    return true;
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
  $("#closeLoginModalform").on("submit", function () {
    console.log("sdfsdf");
    $("#loginModal").css("display", "none");
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

  // 비번찾기 모달 열기
  $("#searchPass").on("click", function () {
    $("#searchPassModal").css("display", "block");
  });
  // 비번찾기 모달 닫기
  $("#closeSearchPassModal").on("click", function () {
    $("#searchPassModal").css("display", "none");
  });

  //비번찾기 버튼 클릭 시 모달 닫기+구현 x
  $("#searchPassButton").on("click", function () {});

  //shop 버튼 모달
  $(".shop").on("click", function () {
    $("#shopModal").css("display", "block");
  });

  // "closeShopModal" 버튼 클릭 시 모달 닫기
  $("#closeShopModal").click(function () {
    $("#shopModal").css("display", "none");
  });

  // 예약
  $(".reserve").on("click", function () {
    $("#reserveModal").css("display", "block");
  });

  // "closeReserveModal" 버튼 클릭 시 모달 닫기
  $("#closeReserveModal").click(function () {
    $("#reserveModal").css("display", "none");
  });

  // 모달 외부 클릭 시 닫기 (선택 사항)
  $(document).on("click", function (event) {
    if (event.target == $("#joinModal")[0]) {
      $("#joinModal").css("display", "none");
    }
    if (event.target == $("#loginModal")[0]) {
      $("#loginModal").css("display", "none");
    }
    if (event.target == $("#searchPassModal")[0]) {
      $("#searchPassModal").css("display", "none");
    }
    if (event.target == $("#shopModal")[0]) {
      $("#shopModal").css("display", "none");
    }
    if (event.target == $("#reserveModal")[0]) {
      $("#reserveModal").css("display", "none");
    }
    if (event.target == $("#branchesModal")[0]) {
      $("#branchesModal").css("display", "none");
    }
    if (event.target == $("#myModal")[0]) {
      $("#myModal").css("display", "none");
    }
    if (event.target == $("#gradesModal")[0]) {
      $("#gradesModal").css("display", "none");
    }
  });

  $(".grade").on("click", function () {
    window.location.href = "grade.do";
  });

  //종로산악 이동
  $(".jongro").on("click", function () {
    window.location.href = "http://www.jrsports.net";
  });
  //숙련공
  $(".reuse").on("click", function () {
    window.location.href = "https://www.instagram.com/sookryeongong";
  });
  //굿초크
  $(".goodch").on("click", function () {
    window.location.href = " https://linktr.ee/good_chalk";
  });

  //더클라임 클릭시 홈화면
  $(".name").on("click", function () {
    window.location.href = "projectOpen.do";
  });

  //지점별 선택하기
  // branches 버튼 클릭 시 모달 열기
  $(".goToGym").on("click", function () {
    window.location.href = "branches.do";
  });

  // 모달 닫기 버튼 클릭
  $("#closeBranchesModal").click(function () {
    // 모달 닫기
    $("#branchesModal").css("display", "none");
  });

  //안전수칙이미지
  const imagePaths = [
    "resources/images/safe1.png",
    "resources/images/safe2.png",
    "resources/images/safe3.png",
    "resources/images/safe4.png",
  ];
  let currentImageIndex = 0;

  function updateImage() {
    $(".slide-image").fadeOut(500, function () {
      $(this).attr("src", imagePaths[currentImageIndex]).fadeIn(500);
    });

    currentImageIndex = (currentImageIndex + 1) % imagePaths.length;
  }

  // 초기 이미지 업데이트
  updateImage();

  // 1초마다 이미지 업데이트
  setInterval(updateImage, 3000);

  //댓글입력
  $(".submit").on("click", function () {
    // comment 요소의 값을 가져옵니다.
    var commentValue = $("#comment").val();

    if (commentValue === "") {
      alert("댓글을 입력하세요.");
    } else {
      // "commentReceive" div에 새로운 댓글을 추가합니다.
      var currentContent = $(".commentReceive").html();
      $(".commentReceive").html(
        currentContent + "<div>" + commentValue + "</div><hr>"
      ); // 새로운 댓글을 추가
      alert("댓글이 입력되었습니다.");
    }
  });
});

//newSet
$(function () {
  $(".sche").on("click", function () {
    window.location.href = "newSet.jsp";
  });
  //board
  $(".board").on("click", function () {
    window.location.href = "mainBoardList.do";
  });

  //동영상업로드 모달
  var openModalButton = document.getElementById("openModal");

  var modal = document.getElementById("myModal");

  var memberUsageButton = document.getElementById("memberUsage");

  var nonMemberUsageButton = document.getElementById("nonMemberUsage");

  $("#openModal").on("click", function () {
    $("#myModal").css("display", "block");
  });

  var memberUsageButton = document.getElementById("memberUsage");

  var nonMemberUsageButton = document.getElementById("nonMemberUsage");

  // 회원 이용 버튼 클릭 시 동작
  $("#memberUsage").on("click", function () {
    $("#myModal").css("display", "none");
  });

  // 비회원 이용 버튼 클릭 시 동작
  $("#nonMemberUsage").on("click", function () {
    $("#myModal").css("display", "none");
  });
});
//이미지 넘기기 변수명 겹침
$(function () {
  let currentImageIndex = 1;
  const totalImages = 6; // 전체 이미지 수

  $(".nextReserve").on("click", function () {
    if (currentImageIndex < totalImages) {
      currentImageIndex++;
    } else {
      currentImageIndex = 1;
    }
    updateImage();
  });

  $(".prevReserve").on("click", function () {
    if (currentImageIndex > 1) {
      currentImageIndex--;
    } else {
      currentImageIndex = totalImages;
    }
    updateImage();
  });

  function updateImage() {
    const imageElement = $(".reserveImage"); // 클래스를 선택합니다.
    imageElement.attr(
      "src",
      `resources/images/reserve/${currentImageIndex}.png`
    );
  }
});

$(document).ready(function () {
  $("#searchPassButton").click(function () {
  alert("로딩중.");
    var id = $("#id").val();
    var phoneNumber = $("#phoneNumber").val();

    // 서버에 비밀번호 찾기 처리를 위한 AJAX 요청을 보냅니다.
    $.ajax({
      type: "POST",
      url: "searchPass.do",
      data: {
        id: id,
        phoneNumber: phoneNumber,
      },

      success: function (response) {
        // 응답 값이 null이 아닌 경우에만 이메일로 보냈다는 얼럿 창을 표시합니다.
        if (response == "") {
         alert("아이디와 전화번호를 확인해 주세요.");
        
        } else {
          // 응답 값이 null인 경우에는 해당하는 비밀번호가 없다는 얼럿 창을 표시합니다.
          alert("이메일로 비밀번호를 전송했습니다.");
        }

        // 응답 값을 span에 설정합니다.
        $("#passwordPlaceholder").text(response || "");
        // 화면에 변경을 갱신합니다.
        $("#password").val("").show();
      },
      error: function () {
        // AJAX 요청 중 오류가 발생한 경우 처리
        alert("비밀번호 찾기 중 오류가 발생했습니다.");
      },
    });
  });
});


