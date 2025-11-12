import 'package:tdd_bank_kata/my_console.dart';
import 'package:tdd_bank_kata/transaction.dart';

class StatementPrinter {
  
  static const header = "DATE    | AMOUNT    | BALANCE ";

  final MyConsole console;

  StatementPrinter({required this.console});

  void print(List<Transaction> transactions) {
    console.printLn(header);
  }
}