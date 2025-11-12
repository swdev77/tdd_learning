import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_bank_kata/statement_printer.dart';
import 'package:tdd_bank_kata/transaction.dart';

import 'mock_my_console.dart';

void main() {
  group('statement printer should', () {
    final myConsole = MockMyConsole();
    final statementPrinter = StatementPrinter(console: myConsole);
    test('print header', () {
      final noTransactions = <Transaction>[];

      statementPrinter.print(noTransactions);

      verify(
        () => myConsole.printLn("DATE    | AMOUNT    | BALANCE "),
      ).called(1);
    });

    test('print transactions in reverse order', () {
      final transactions = [
        Transaction(date: "01/04/2025", amount: 1000),
        Transaction(date: "02/04/2025", amount: -200),
        Transaction(date: "10/04/2025", amount: 500),
      ];

      statementPrinter.print(transactions);

      verifyInOrder([
        () => myConsole.printLn("DATE    | AMOUNT    | BALANCE "),
        () => myConsole.printLn("10/04/2025 | 500      | 1300     "),
        () => myConsole.printLn("02/04/2025 | -200     | 800      "),
        () => myConsole.printLn("01/04/2025 | 1000     | 1000     "),
      ]);
    });
  });
}
