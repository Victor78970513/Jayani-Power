class GetWeekDaysUtil {
  static List<DateTime> get5Days() {
    DateTime today = DateTime.now();
    List<DateTime> weekdays = [];
    while (weekdays.length < 5) {
      if (today.weekday >= DateTime.monday &&
          today.weekday <= DateTime.friday) {
        weekdays.add(today);
      }
      today = today.add(const Duration(days: 1));
    }
    return weekdays;
  }

  static List<String> getWeekNames(List<DateTime> days) {
    final List<String> names = [];
    List<String> dayNames = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo'
    ];
    for (int i = 0; i < days.length; i++) {
      DateTime date = days[i];
      String dayName = dayNames[date.weekday - 1];
      names.add(dayName);
    }
    return names;
  }
}
