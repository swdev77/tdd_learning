import 'package:tdd_bank_kata/my_clock.dart';
import 'package:tdd_bank_kata/transaction.dart';

class TransactionRepository {
  final MyClock clock;

  // internal mutable storage, keep private
  final List<Transaction> _transactions = [];

  TransactionRepository({required this.clock});

  Transaction _makeTransaction(int amount) =>
      Transaction(date: clock.todayAsString(), amount: amount);

  void addDeposit(int amount) {
    _transactions.add(_makeTransaction(amount));
  }

  void addWithdraw(int amount) {
    _transactions.add(_makeTransaction(-amount));
  }

  List<Transaction> getAllTransactions() {
    // Return an unmodifiable copy to prevent external mutation
    return List.unmodifiable(_transactions);
  }
}
