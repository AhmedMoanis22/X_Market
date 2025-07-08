import 'package:hive/hive.dart';

part 'transction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  final String type;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  TransactionModel({
    required this.type,
    required this.amount,
    required this.date,
  });
}
