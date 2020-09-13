class DateTimeHelper {
  static getFormattedTime(DateTime currentTime) {
    int hour = currentTime.hour;
    int minutes = currentTime.minute;
    String timeSet = "";
    if (hour > 12) {
      hour -= 12;
      timeSet = "PM";
    } else if (hour == 0) {
      hour += 12;
      timeSet = "AM";
    } else if (hour == 12) {
      timeSet = "PM";
    } else {
      timeSet = "AM";
    }

    String min = "";
    if (minutes < 10)
      min = "0" + minutes.toString();
    else
      min = minutes.toString();

    String time = hour.toString() + ":" + min + " " + timeSet;
    return time;
  }

  static getFormattedTimeFromHourMinutes(int hour, int minutes) {
    String timeSet = "";
    if (hour > 12) {
      hour -= 12;
      timeSet = "PM";
    } else if (hour == 0) {
      hour += 12;
      timeSet = "AM";
    } else if (hour == 12) {
      timeSet = "PM";
    } else {
      timeSet = "AM";
    }

    String min = "";
    if (minutes < 10)
      min = "0" + minutes.toString();
    else
      min = minutes.toString();

    String time = hour.toString() + ":" + min + " " + timeSet;
    return time;
  }
}
