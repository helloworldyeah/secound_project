import 'package:flutter/foundation.dart';

class Transaction {
  int id;
  String product;
  double amount;
  DateTime date;

  Transaction({
    required this.id,
    required this.product,
    required this.amount,
    required this.date,
  });
}
