import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:tdd_bank_kata/account.dart';
import 'package:tdd_bank_kata/statement_printer.dart';
import 'package:tdd_bank_kata/transaction_repository.dart';
import 'mock_my_clock.dart';
import 'mock_my_console.dart';

void main() {
  group('Features', () {
    test('print account statement', () async {
      final myConsole = MockMyConsole();
      final myClock = MockMyClock();
      final transaction = TransactionRepository(clock: myClock);
      final statementPrinter = StatementPrinter(console: myConsole);
      final account = Account(
        transactionRepository: transaction,
        statementPrinter: statementPrinter,
      );

      final dates = ["01/04/2025", "02/04/2025", "10/04/2025"];
      int counter = 0;

      when(() => myClock.todayAsString()).thenAnswer((_) {
        return dates[counter++];
      });

      account.deposit(1000);
      account.withdraw(100);
      account.deposit(500);

      account.printStatement();

      verifyInOrder([
        () => myConsole.printLn("DATE | AMOUNT | BALANCE"),
        () => myConsole.printLn("10/04/2025 | 500.00 | 1400.00"),
        () => myConsole.printLn("02/04/2025 | -100.00 | 900.00"),
        () => myConsole.printLn("01/04/2025 | 1000.00 | 1000.00"),
      ]);
    });
  });
}
