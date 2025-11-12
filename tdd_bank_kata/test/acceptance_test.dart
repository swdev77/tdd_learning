import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:tdd_bank_kata/account.dart';
import 'package:tdd_bank_kata/statement_printer.dart';
import 'package:tdd_bank_kata/transaction_repository.dart';
import 'mock_my_clock.dart';
import 'mock_my_console.dart';

void main() {
  group('Features', () {
    test('print account statement', () {
      final myConsole = MockMyConsole();
      final myClock = MockMyClock();
      final transaction = TransactionRepository(clock: myClock);
      final statementPrinter = StatementPrinter(console: myConsole);
      final account = Account(
        transactionRepository: transaction,
        statementPrinter: statementPrinter,
      );

      when(() => myClock.todayAsString()).thenReturn('24/04/2025');

      account.deposit(1000);
      account.withdraw(100);
      account.deposit(500);

      account.printStatement();

      verify(
        () => myConsole.printLn("DATE       | AMOUNT    | BALANCE "),
      ).called(1);
      verify(
        () => myConsole.printLn("10/04/2025 | 500.00    | 1400.00 "),
      ).called(1);
      verify(
        () => myConsole.printLn("02/04/2025 | -100.00   | 900.00 "),
      ).called(1);
      verify(
        () => myConsole.printLn("01/04/2025 | 1000.00   | 1000.00 "),
      ).called(1);
    });
  });
}
