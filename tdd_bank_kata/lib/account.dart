import 'package:tdd_bank_kata/statement_printer.dart';
import 'package:tdd_bank_kata/transaction_repository.dart';

class Account {
  final TransactionRepository transactionRepository;
  final StatementPrinter statementPrinter;

  Account({
    required this.transactionRepository,
    required this.statementPrinter,
  });

  void printStatement() {
    statementPrinter.print(transactionRepository.getAllTransactions());
  }

  void deposit(int amount) {
    transactionRepository.addDeposit(amount);
  }

  void withdraw(int amount) {
    transactionRepository.addWithdraw(amount);
  }
}
