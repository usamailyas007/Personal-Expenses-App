import 'package:flutter/foundation.dart';

class Transaction {
  final String titile;
  final String id;
  final double amount;
  final DateTime date;

  Transaction({
    required this.titile,
    required this.id,
    required this.amount,
    required this.date
  });
}
