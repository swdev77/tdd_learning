import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_bank_kata/my_clock.dart';

void main() {
  group('clock should ', () {
    test('return today date in dd_MM_yyyy format', () {
      final myClock = TestableMyClock();

      final today = myClock.todayAsString();

      final expectedToday = "24/04/2025";

      expect(today, expectedToday);
    });
  });
}

class TestableMyClock extends MyClock {
  @override
  DateTime localDate() {
    return DateTime(2025, 4, 24);
  }
}
