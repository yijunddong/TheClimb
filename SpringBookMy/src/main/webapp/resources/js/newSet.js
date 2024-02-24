$(function () {

    
  const events = {};

  function updateCalendar(year, month) {
      let dateText = "";
      let curYear = year;
      let curMonth = month;
      let lastDay = getLastDayOfMonth();
      const nowTemp = new Date(curYear, curMonth, 1);
      let firstDayOfTheWeek = nowTemp.getDay();
      let numOfWeeks = Math.ceil((firstDayOfTheWeek + lastDay) / 7);
      let cell = 0;
      let date = 1;
      let selectedDate;

      dateText += "<li class='prev' onclick='nextMonth(-1)'>&#10094;</li>";
      dateText += "<li class='next' onclick='nextMonth(1)'>&#10095;</li>";

      let table = `<table>`;
      table += `<caption12>${dateText}${curYear}Y ${curMonth + 1}M ${getCurrentTime()}</caption12>`;
      const dayOfTheWeek = ["일", "월", "화", "수", "목", "금", "토"];
      table += `<tr>`;
      for (let i = 0; i < dayOfTheWeek.length; i++) {
          table += `<th`;
          if (i === 0) {
              table += ` class="sunday"`;
          }
          table += `>${dayOfTheWeek[i]}</th>`;
      }
      table += `</tr>`;
      for (let i = 0; i < numOfWeeks; i++) {
          table += `<tr>`;
          for (let j = 0; j < 7; j++) {
              if (cell < firstDayOfTheWeek) table += `<td>&nbsp;</td>`;
              else if (date <= lastDay) {
                  table += `<td`;
                  if (j === 0) {
                      table += ` class="sunday"`;
                  } else if (j === 6) {
                      table += ` class="saturday"`;
                  }
                  table += `>${date}`;
                  if (
                      date === new Date().getDate() &&
                      new Date().getMonth() === curMonth &&
                      new Date().getFullYear() === curYear
                  )
                      table += `<br>${"Today"}`;

                  const currentMonthKey = `${curYear}-${curMonth}`;
                  if (events[currentMonthKey] && events[currentMonthKey][date]) {
                      table += `<br>${events[currentMonthKey][date]}`;
                  }

                  table += `</td>`;
                  date++;
              } else table += `<td>&nbsp;</td>`;
              cell++;
          }

          table += `</tr>`;
      }
      table += `</table>`;
      document.getElementById("calendar").innerHTML = table;
  }

  function nextMonth(step) {
    curMonth += step;
    if (curMonth < 0) {
        curMonth = 11;
        curYear--;
    }
    if (curMonth > 11) {
        curMonth = 0;
        curYear++;
    }
    updateCalendar(curYear, curMonth);
}


  function getLastDayOfMonth() {
      const lastDayOfMon = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
      let leapYear;

      if (curYear % 4 == 0 && curYear % 100 != 0) leapYear = true;
      else if (curYear % 400 == 0) leapYear = true;
      else leapYear = false;

      lastDayOfMon[1] = leapYear ? 29 : 28;
      return lastDayOfMon[curMonth];
  }

  function getCurrentTime() {
      let now = new Date();
      let hour = now.getHours() % 12;
      let minute = now.getMinutes();
      let ampm;

      if (now.getHours() >= 12) {
          ampm = "PM";
      } else {
          ampm = "AM";
      }

      hour = hour == 0 ? 12 : hour;
      if (minute < 10) minute = "0" + minute;

      const timeString = `<span class="time"> ${hour}:${minute}${ampm}</span>`;
      return timeString;
  }

  const now = new Date();
  let curYear = now.getFullYear();
  let curMonth = now.getMonth();
  updateCalendar(curYear, curMonth);


  $(document).on("click", ".prev", function () {
    nextMonth(-1);
});

// "다음 달" 버튼 클릭 이벤트
$(document).on("click", ".next", function () {
    nextMonth(1);
});

  $(document).on("click", "#calendar td", function () {
      selectedDate = $(this).text();
      $("#event-modal").css("display", "block");
      $("#modal-date").text(`${curYear}-${curMonth + 1}-${selectedDate}`);
  });

  $("#close-modal").click(function () {
      $("#event-modal").css("display", "none");
  });

  $(function () {
      const storedEvents = localStorage.getItem("events");
      if (storedEvents) {
          Object.assign(events, JSON.parse(storedEvents));
      }

      updateCalendar(curYear, curMonth);

      $("#save-event-modal").click(function () {
          if (selectedDate) {
              const currentMonthKey = `${curYear}-${curMonth}`;
              const eventInput = $("#event-input").val();
              events[currentMonthKey] = events[currentMonthKey] || {};
              events[currentMonthKey][selectedDate] = eventInput;
              localStorage.setItem("events", JSON.stringify(events));
              updateCalendar(curYear, curMonth);
              $("#event-modal").css("display", "none");
              alert("저장되었습니다.");
          }
      });
  });

  function showEventListForDeletion() {
      const currentMonthKey = `${curYear}-${curMonth}`;
      const eventsForSelectedDate = events[currentMonthKey] || {};
      const eventList = $("#event-list");

      eventList.empty();

      for (const date in eventsForSelectedDate) {
          const eventText = eventsForSelectedDate[date];
          eventList.append(
              `<label><input type="radio" name="eventToDelete" value="${date}">${date}: ${eventText}</label><br>`
          );
      }

      $("#delete-event-modal").off("click");
      $("#delete-event-modal").on("click", function () {
          const selectedEventDate = $("input[name='eventToDelete']:checked").val();
          if (selectedEventDate) {
              delete eventsForSelectedDate[selectedEventDate];
              localStorage.setItem("events", JSON.stringify(events));
              updateCalendar(curYear, curMonth);
              $("#event-modal").css("display", "none");
              alert("선택한 이벤트가 삭제되었습니다.");
          } else {
              alert("삭제할 이벤트를 선택하세요.");
          }
      });
  }
  function showEventListForDeletion() {
    const currentMonthKey = `${curYear}-${curMonth}`;
    const eventsForSelectedDate = events[currentMonthKey] || {};
    const eventList = $("#event-list");

    eventList.empty();

    for (const date in eventsForSelectedDate) {
        const eventText = eventsForSelectedDate[date];
        eventList.append(
            `<label><input type="radio" name="eventToDelete" value="${date}">${date}: ${eventText}</label><br>`
        );
    }

    // Add the event deletion logic here
    $("#delete-event-modal").off("click");
    $("#delete-event-modal").on("click", function () {
        const selectedEventDate = $("input[name='eventToDelete']:checked").val();
        if (selectedEventDate) {
            delete eventsForSelectedDate[selectedEventDate];
            localStorage.setItem("events", JSON.stringify(events));
            updateCalendar(curYear, curMonth);
            $("#event-modal").css("display", "none");
            alert("선택한 이벤트가 삭제되었습니다.");
        } else {
            alert("삭제할 이벤트를 선택하세요.");
        }
    });
}

$(document).on("click", "#calendar td", function () {
    selectedDate = $(this).text();
    $("#event-modal").css("display", "block");
    $("#modal-date").text(`${curYear}-${curMonth + 1}-${selectedDate}`);
    showEventListForDeletion(); // Call the function when a date is clicked
});

});
