import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../data/model/transction_model.dart';
import 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletState(transactions: [])) {
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    final box = Hive.box<TransactionModel>('transactions');
    emit(state.copyWith(transactions: box.values.toList()));
  }

  Future<void> addTransaction(TransactionModel tx) async {
    final box = Hive.box<TransactionModel>('transactions');
    await box.add(tx);
    emit(state.copyWith(transactions: box.values.toList()));
  }

  Future<void> clearTransactions() async {
    final box = Hive.box<TransactionModel>('transactions');
    await box.clear();
    emit(state.copyWith(transactions: []));
  }
}
