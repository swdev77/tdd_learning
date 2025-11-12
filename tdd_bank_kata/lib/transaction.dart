import 'package:equatable/equatable.dart';

class Transaction extends Equatable{
  final String date;
  final int amount;

  const Transaction({required this.date, required this.amount});
  
  @override
  List<Object?> get props => [date, amount];
}
