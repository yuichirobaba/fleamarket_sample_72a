$(function () {
  var birthday_year = [];
  var birthday_month = [];
  var months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  var date = new Date();
  var this_year = date.getFullYear();
  var oldest_year = 1950;

  for (var i = this_year; i >= oldest_year; i--) {
    var year = { var: i, txt: String(i) };
    birthday_year.push(year);
  }
  for (var i = 1; i <= 12; i++) {
    var month = { var: i, txt: String(i) };
    birthday_month.push(month);
  }

  for (var i = 0; i < birthday_year.length; i++) {
    $("<option>", {
      value: birthday_year[i].var,
      text: birthday_year[i].txt
    }).appendTo('#select_birth_year');
  }
  for (var i = 0; i < birthday_month.length; i++) {
    $("<option>", {
      value: birthday_month[i].var,
      text: birthday_month[i].txt
    }).appendTo('#select_birth_month');
  }

  $('#select_birth_year, #select_birth_month').change(function () {

    $('#select_birth_day').empty();

    $("<option>", {
      text: '--'
    }).appendTo('#select_birth_day');

    months[1] = 28;
    var year = $('#select_birth_year').val();
    var month = $("#select_birth_month").val();
    if (year != '--' && month != '--') {
      if (month == 2) {
        if (year % 4 == 0 && year % 100 == 0 && year % 400 == 0) {
          months[1] = 29;
        }
      }
      var birthday_day = []
      for (var i = 1; i <= months[month - 1]; i++) {
        var day = { var: i, txt: String(i) };
        birthday_day.push(day);
      }
      for (var i = 0; i < birthday_day.length; i++) {
        $("<option>", {
          value: birthday_day[i].var,
          text: birthday_day[i].txt
        }).appendTo('#select_birth_day');
      };
    };
  });
});