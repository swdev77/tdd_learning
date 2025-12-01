import 'package:intl/intl.dart';
import 'package:tdd_bank_kata/my_console.dart';
import 'package:tdd_bank_kata/transaction.dart';

class StatementPrinter {
  static const header = "DATE | AMOUNT | BALANCE";

  final MyConsole console;

  StatementPrinter({required this.console});

  void print(List<Transaction> transactions) {
    console.printLn(header);
    int runningBalance = 0;

    transactions
        .map((transaction) {
          runningBalance += transaction.amount;
          return _statementLine(transaction, runningBalance);
        })
        .toList()
        .reversed
        .forEach((line) {
          console.printLn(line);
        });
  }

  String _statementLine(Transaction transaction, int runningBalance) {
    final date = transaction.date;
    final amount = transaction.amount;
    final balance = runningBalance;

    final formatter = NumberFormat("0.00", "en_US");

    final dateString = date;
    final amountString = formatter.format(amount);
    final balanceString = formatter.format(balance);

    return "$dateString | $amountString | $balanceString";
  }
}
