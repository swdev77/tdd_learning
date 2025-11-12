import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_bank_kata/account.dart';
import 'package:tdd_bank_kata/transaction.dart';

import 'mock_statement_printer.dart';
import 'mock_transaction_repository.dart';

void main() {
  group('account should', () {
    late MockTransactionRepository transactionRepository;
    late MockStatementPrinter statementPrinter;
    late Account account;

    setUp(() {
      transactionRepository = MockTransactionRepository();
      statementPrinter = MockStatementPrinter();
      account = Account(transactionRepository: transactionRepository, statementPrinter: statementPrinter);
    });

    test('store a deposit transaction', () {
      account.deposit(1000);

      verify(() => transactionRepository.addDeposit(1000)).called(1);
    });

    test('store a withdraw transaction', () {
      account.withdraw(500);

      verify(() => transactionRepository.addWithdraw(500)).called(1);
    });

    test('print statement', () {
      final List<Transaction> transactions = [];

      when(() => transactionRepository.getAllTransactions())
          .thenReturn(transactions);     

      account.printStatement();

      verify(() => statementPrinter.print(transactions)).called(1);
    });
  });
}
