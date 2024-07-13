import 'package:child_moments/models/kid.dart';

class Invoice {
  String? id;
  Kid kid;
  String? dueDate;
  double? amount;
  double? total;
  String? type;
  String? status;
  String? paymentMethod;
  String? proof1;
  String? proof2;
  String? preview;
  String? packages;
  String? currency;
  Invoice(
      {this.amount,
      this.currency,
      required this.kid,
      this.dueDate,
      this.id,
      this.paymentMethod,
      this.preview,
      this.proof1,
      this.proof2,
      this.status,
      this.total,
      this.type,
      this.packages});
}
