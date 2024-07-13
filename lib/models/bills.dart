// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Bills {
  String? name;
  String? total;
  String? type;
  String? paymentMethod;
  String? dueDate;
  String? amount;
  IconButton actions = IconButton(onPressed: () {}, icon: const Icon(Icons.upload));
  Bills({
    this.name,
    this.total,
    this.type,
    this.paymentMethod,
    this.dueDate,
    this.amount,
    required this.actions,
  });
}
