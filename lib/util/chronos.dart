String hMonthName(int month) => switch (month) {
      1 => "January",
      2 => "February",
      3 => "March",
      4 => "April",
      5 => "May",
      6 => "June",
      7 => "July",
      8 => "August",
      9 => "September",
      10 => "October",
      11 => "November",
      12 => "December",
      _ => "UnknowMonth"
    };

String hFormatLogTimestamp() {
  DateTime now = DateTime.now();
  String padZeroes(dynamic r) => r.toString().padLeft(2, "0");

  return "${hMonthName(now.month).substring(0, 3)} ${padZeroes(now.day)} ${now.year} | ${padZeroes(now.hour)}:${padZeroes(now.minute)}:${padZeroes(now.second)}";
}
