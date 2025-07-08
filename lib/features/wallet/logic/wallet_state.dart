import '../data/model/transction_model.dart';

class WalletState {
  final List<TransactionModel> transactions;
  final bool isCheckoutSuccess;

  WalletState({
    required this.transactions,
    this.isCheckoutSuccess = false,
  });

  WalletState copyWith({
    List<TransactionModel>? transactions,
    bool? isCheckoutSuccess,
  }) {
    return WalletState(
      transactions: transactions ?? this.transactions,
      isCheckoutSuccess: isCheckoutSuccess ?? this.isCheckoutSuccess,
    );
  }
}
