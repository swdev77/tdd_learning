class MyClock {
  String todayAsString() {
    DateTime now = localDate();

    return '${now.day.toString().padLeft(2, '0')}/'
        '${now.month.toString().padLeft(2, '0')}/'
        '${now.year}';
  }

  DateTime localDate() {
    final now = DateTime.now();
    return now;
  }
}
