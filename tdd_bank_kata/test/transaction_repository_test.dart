import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_bank_kata/transaction.dart';
import 'package:tdd_bank_kata/transaction_repository.dart';

import 'mock_my_clock.dart';

void main() {
  group('transaction repository should', () {
    const today = "12/11/2025";
    late MockMyClock myClock;
    late TransactionRepository transactionRepository;

    setUp(() {
      myClock = MockMyClock();
      when(() => myClock.todayAsString()).thenReturn(today);

      transactionRepository = TransactionRepository(clock: myClock);
    });

    test('create and store a deposit transaction ', () {

      transactionRepository.addDeposit(100);

      final List<Transaction> transactions = transactionRepository
          .getAllTransactions();

      expect(transactions.length, 1);

      final transaction = transactions.first;

      expect(transaction, Transaction(date: today, amount: 100));
    });

    test('create and store withdraw transaction', () {

      transactionRepository.addWithdraw(200);

      final List<Transaction> transactions = transactionRepository
          .getAllTransactions();

      expect(transactions.length, 1);

      final transaction = transactions.first;

      expect(transaction, Transaction(date: today, amount: -200));
    });
  });
}
